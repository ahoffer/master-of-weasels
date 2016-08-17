source("01-preparedata.R")
source("leaf.performance.R")

fitBoruta = train(model,
									trainingSet,
									method = "Boruta")
predictions = predict(fitBoruta, testSet)
leaf.performance(predictions)
cm = confusionMatrix(predictions, testSet$Species)$table
write.csv(cm, file = "leafConfusion1MatrixBoruta.csv")

#################################
##### How can we do better? #####
#################################

#-Tweak our preprocessing and feature selection?
#--Big gains for the right features. Slowly becomming less and less important.
#--This was boruta's advantage over the vanilla Random Forest.

#-Tweak our machine learning algorithm and parameters?
#--Quickly becomming less and less important thanks to ensemble learning and deep learning
fit = train(model, trainingSet, method = "LogitBoost")
leaf.performance(predict(fit, testSet))
  # Accuracy                  Kappa
  # 0.8611111              0.8542510

#-The correct ansswers is GET MORE DATA.
#--Often the cheapests and most effective way to improve outcomes is to throw more training
#--at the classifier. This leads to BIG DATA.
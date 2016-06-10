# Libary command brings installed packages into the current namespace
library(caret)

# Source reads and executs a file in the current environment
source("01-preparedata.R")

# Create model (R formula)
model = Species ~ . # SpeciesName is the dependent variable, all other are independent variables (i.e. predictors)

# Use machine learning to fit the training data. THIS IS THE "LEARNING" PART OF "MACHINE LEARNING"
fitRandomForest = train(model, trainingSet)

# Quick assessment of the training results
confusionMatrix(fitRandomForest)

# Predict test results
predictions = predict(fitRandomForest, testSet)

# Assess test results
  multiClassSummary(
    data.frame(pred=predictions, obs=testSet$Species),
    lev=levels(cleanData$Species))

# Generate confusion matrix
 confusionMatrix(predictions, testSet$SpeciesName)$table

# Excel Demo
leaf.confusionmatrix(predictions)
write.csv(leaf.confusionmatrix(predictions), file = "leaf.confusionmatrix.csv")

# Accuracy                  Kappa       Mean_Sensitivity       Mean_Specificity    Mean_Pos_Pred_Value
# 0.72413793             0.71428571             0.71666667             0.99048663                    NaN
# Mean_Neg_Pred_Value    Mean_Detection_Rate Mean_Balanced_Accuracy
# 0.99068253             0.02413793             0.85357665
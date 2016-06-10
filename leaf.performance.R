# Define helper function to print the performance of our machine learning classifier
leaf.performance = function(predictions) {
  multiClassSummary(
    data.frame(pred=predictions, obs=testSet$Species),
    lev=levels(cleanData$Species))
}

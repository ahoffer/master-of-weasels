library(caret)
library(AppliedPredictiveModeling)

weasel.trellis = function(points, labels, ...) {
	bookTheme()
	# transparentTheme(trans = 0.4)
	plt = featurePlot(
		x = points,
		y = labels,
		plot = "pairs",
		auto.key = list(columns = 5),
		...
	)
	update(plt,	par.settings = list(fontsize = list(text = 8, points = 10)))

}
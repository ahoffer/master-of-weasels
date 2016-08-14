# install.packages('scatterplot3d')
library(scatterplot3d)
# install.packages("rgl")
library(rgl)

weasel.plot3d = function(points, labels) {
	selectedSpecies.names = unique(labels)
	colorMap = setNames(rainbow(length(selectedSpecies.names)), selectedSpecies.names)
	colorVec = sapply(labels, function(x) {
		colorMap[[x]]
	})

	plot3d(
		x =	points[, 1],
		y =	points[, 2],
		z =	points[, 3],
		col = colorVec,
		type = "s",
		xlab = "PC1",
		ylab = "PC2",
		zlab = "PC3",
		size = 1
	)

	legend3d(
		'topleft',
		cex = 0.5,
		legend = 	selectedSpecies.names,
		fill = colorMap,
		merge = F,
		bty = 'n'
	)
}
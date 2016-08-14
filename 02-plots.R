source("01-preparedata.R")
source("weasel.plot3d.R")
source("weasel.trellis.R")

weasel.trellis(features, cleanData$Species, pscales=FALSE)

species.names = as.character(cleanData$Species)

# Specify the species to plot
selectedSpecies.names = unique(species.names)[1:10]
# selectedSpecies.names = c("12-Celtis sp.", "28-Magnolia soulangeana", "24-Bougainvillea sp.")
numberOfPrincipleComponentsToPlot = 4

selectedSpecies.features = cleanData[species.names %in% selectedSpecies.names ,]

rotatedData = prcomp(features,	retx = TRUE,	center = TRUE,	scale = TRUE)$x
selectedSpecies.features.rotated = rotatedData[, 1:numberOfPrincipleComponentsToPlot]
selectedSpecies.plotLabels = species.names[species.names %in% selectedSpecies.names]
weasel.trellis(selectedSpecies.features.rotated, as.factor(selectedSpecies.plotLabels))
weasel.plot3d(selectedSpecies.features.rotated, selectedSpecies.plotLabels)


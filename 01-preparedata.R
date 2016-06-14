library(caret)
# Second Data Set
# Look at web site and download data
# https://archive.ics.uci.edu/ml/datasets/Leaf

# Load data
#-Read data with no additional parameters. Doesn't looks great.
read.csv("leaf.csv")


#-Read data and provider header names
data = read.csv(
  "leaf.csv",
  header = FALSE,
  col.names = c(
    "Species",
    "Specimen Number",
    "Eccentricity",
    "Aspect Ratio",
    "Elongation",
    "Solidity",
    "Stochastic Convexity",
    "Isoperimetric Factor",
    "Maximal Indentation Depth",
    "Lobedness",
    "Average Intensity",
    "Average Contrast",
    "Smoothness" ,
    "Third moment" ,
    "Uniformity",
    "Entropy"
  )
)

# Convert species number to labeled factor
speciesLabels = c(
  "Quercus suber",
  "Salix atrocinera",
  "Populus nigra",
  "Alnus sp.",
  "Quercus robur",
  "Crataegus monogyna",
  "Ilex aquifolium",
  "Nerium oleander",
  "Betula pubescens",
  "Tilia tomentosa",
  "Acer palmatum",
  "Celtis sp.",
  "Corylus avellana",
  "Castanea sativa",
  "Populus alba",
  "Acer negundo",
  "Taxus bacatta",
  "Papaver sp.",
  "Polypolium vulgare",
  "Pinus sp.",
  "Fraxinus sp.",
  "Primula vulgaris",
  "Erodium sp.",
  "Bougainvillea sp.",
  "Arisarum vulgare",
  "Euonymus japonicus",
  "Ilex perado ssp. azorica",
  "Magnolia soulangeana",
  "Buxus sempervirens",
  "Urtica dioica",
  "Podocarpus sp.",
  "Acca sellowiana",
  "Hydrangea sp.",
  "Pseudosasa japonica",
  "Magnolia grandiflora",
  "Geranium sp.",
  "Aesculus californica",
  "Chelidonium majus",
  "Schinus terebinthifolius",
  "Fragaria vesca")

# Create factor from species number and supplemental labels.
cleanData = data
cleanData$Species = paste(data$Species, speciesLabels[data$Species], sep="-")
cleanData$Species = factor(cleanData$Species)

# Drop specimen number
cleanData = cleanData[, -2]

# Partition data into training and test sets
trainingIndices = createDataPartition(
  cleanData$Species,
  p = 0.8,
  list=FALSE)
trainingSet = cleanData[trainingIndices,]
testSet = cleanData[-trainingIndices,]

# Create data set with no labels (i.e. no information about species)
features = cleanData[, -1]

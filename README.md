# The Leaf Dataset 

Topics covered are:

- Got data?
	- Finding practice datasets on the web
	- Example: data wrangling in R
	- Exploring a trellis plot
	- Example: data visualization in R
- Machine Learning
	- Example: training, prediction, evaluation with caret in R.
	- Example: visualize confusion matrix in Excel
- How to improve results
	- Ensemble learning
	- Bagging your training data
	- Feature selection
	- Example: leaf classification with BORUTA

##Got data?

### UCI ML Data Set Repository
- Browse
- Download 
- Read
	
### Prepare data
 - Review multi-classification 
 - Introduce high dimensionality
 - Add attrribute names
 - Add species names
 - Create training and test sets

### Visualize Data
- Trellis plot of high dimensional data
- Look for clusters (and anomalies)
- Look for "typical" objectes
	
##Machine Learning with caret in R
- Random Forest with caret in R
- Confusion matrix
- Export confusion matrix as CSV file
- Visualuze confusion matrix in Excel

## Improving the results	
	
### Ensemble Learning
- Getting from decision trees to random forests
- Strong/weak learners - VC dimension (see Wikipedia)
- Separability and non-linearity
- Boosting and ensemble learning

### Bagging
- Efon's bootstrapping
- Bootstrapping to create new training sets

### Feature Selection
- Reduces dimensionality
- Improve generalizability
- Simple example - additative feature selection
- Genetic algorithms, ant colonies
- Autoencoders

### Example: BORUTA in R	
- Train a classifier with BORUTA
- Did BORTU (random forest with advanced feature selection) outperform vanilla random forest?
- Generate an export confusion matrix as CSV file
- Visualize confusion matrix in Excel

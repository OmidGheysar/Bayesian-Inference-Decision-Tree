##regression example

##generate Friedman data
# https://cran.r-project.org/web/packages/bartMachine/bartMachine.pdf
# https://rdrr.io/cran/bartMachine/man/predict.bartMachine.html

library(bartMachine)
set.seed(11)
n  = 200 
p = 5
X = data.frame(matrix(runif(n * p), ncol = p))
y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
bart_machine = bartMachine(X, y)
summary(bart_machine)

Predictions <- bart_machine
# here is the prediction of BartMachine
bart_machine$y_hat_train

lmFit = lm(y~.,data.frame(X,y))##build BART regression model

library("ggplot2")
eq = function(x){x*x}
ggplot(data.frame(x=c(1, 50)), aes(x=x)) + 
  stat_function(fun=eq)
## Not run: 
##Build another BART regression model
bart_machine = bartMachine(X,y, num_trees = 200, num_burn_in = 500,
                           num_iterations_after_burn_in = 1000)

##Classification example

#get data and only use 2 factors
data(iris)
iris2 = iris[51:150,]
iris2$Species = factor(iris2$Species)

#build BART classification model
bart_machine = build_bart_machine(iris2[ ,1:4], iris2$Species)

##get estimated probabilities
phat = bart_machine$p_hat_train
##look at in-sample confusion matrix
bart_machine$confusion_matrix

## End(Not run)
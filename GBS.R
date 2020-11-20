
# https://www.r-bloggers.com/2017/08/gradient-boosting-in-r/
require(gbm)
require(MASS)#package with the boston housing dataset

#separating training and test data
train=sample(1:506,size=374)
Boston.boost=gbm(medv ~ . ,data = Boston[train,],distribution = "gaussian",n.trees = 10000,
                 shrinkage = 0.01, interaction.depth = 4)
Boston.boost

summary(Boston.boost) #Summary gives a table of Variable Importance and a plot of Variable Importance

gbm(formula = medv ~ ., distribution = "gaussian", data = Boston[-train, 
], n.trees = 10000, interaction.depth = 4, shrinkage = 0.01)
# A gradient boosted model with gaussian loss function.
# 10000 iterations were performed.
# There were 13 predictors of which 13 had non-zero influence.

summary(Boston.boost)

set.seed(11)
n  = 200 
p = 5
X = data.frame(matrix(runif(n * p), ncol = p))
y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
added <- cbind(X, y)
data.fuction = gbm(formula = y ~ ., distribution = "gaussian", data = X, 
    n.trees = 10000, interaction.depth = 4, shrinkage = 0.01)

summary(data.fuction)

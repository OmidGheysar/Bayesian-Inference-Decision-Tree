# Data Source: https://archive.ics.uci.edu/ml/machine-learning-databases/car/

install.packages("randomForest")
library(randomForest)

# https://www.datacareer.de/blog/random-forest-in-r-an-example/


library(ggplot2)
# Import the dataset
diamond <-diamonds
head(diamond)

diamond$cut <- as.integer(diamond$cut)
diamond$color <-as.integer(diamond$color)
diamond$clarity <- as.integer(diamond$clarity)

head(diamond)


X <- diamond %>% 
  select(carat, depth, table, x, y, z, clarity, cut, color)
y <- diamond$price

# Split data into training and test sets
index <- createDataPartition(y, p=0.75, list=FALSE)
X_train <- X[ index, ]
X_test <- X[-index, ]
y_train <- y[index]
y_test<-y[-index]

regr <- randomForest(x = X_train, y = y_train , maxnodes = 10, ntree = 10)

predictions <- predict(regr, X_test)

result <- X_test
result['price'] <- y_test
result['prediction']<-  predictions

head(result)


library(ggplot2)

# Build scatterplot
ggplot(  ) + 
  geom_point( aes(x = X_test$carat, y = y_test, color = 'red', alpha = 0.5) ) + 
  geom_point( aes(x = X_test$carat , y = predictions, color = 'blue',  alpha = 0.5)) + 
  labs(x = "Carat", y = "Price", color = "", alpha = 'Transperency') +
  scale_color_manual(labels = c( "Predicted", "Real"), values = c("blue", "red")) 

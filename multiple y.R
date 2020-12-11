
set.seed(1)
n  = 200 
p = 5
mydata = c (seq(0, 20, by=.1))
X = data.frame(mydata)
y = 10 * X$mydata^1
y = 10 * sin(2*pi* X$mydata)
bart_machine = bartMachine(X, y,run_in_sample= TRUE)
summary(bart_machine)



x = seq(0, 20, by=.1)
y2 = 10  * X$mydata^1
y2 = 10 * sin(2*pi* x)
library(ggplot2)


X_axis <- c(x)
Prediction<- bart_machine$y_hat_train
True_values <- c(y2)
# Join the variables to create a data frame
df <- data.frame(X_axis,Prediction,True_values)

ggplot(df) + 
  geom_line(aes(x=X_axis, y=Prediction,color = "BART")) +
  geom_line(aes(x=X_axis, y=True_values,color = "True value"),linetype = "dashed") +
  theme_bw()

  ggplot(df) + 
    geom_point(aes(x=X_axis, y=Prediction,color = "BART")) +
    geom_point(aes(x=X_axis, y=True_values,color = "True value"),linetype = "dashed") +
  theme_bw()





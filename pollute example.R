
install.packages("tree")
library(tree)
pollute <- read.table("https://raw.githubusercontent.com/shifteight/R-lang/master/TRB/data/Pollute.txt", header = TRUE)
attach(pollute)
model <- tree(pollute)
plot(model)
text(model)

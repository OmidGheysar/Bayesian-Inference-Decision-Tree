
install.packages("tree")
library(tree)
pollute <- read.table("https://raw.githubusercontent.com/shifteight/R-lang/master/TRB/data/Pollute.txt", header = TRUE)
attach(pollute)
model <- tree(pollute)
plot(model)
text(model)

library(dplyr)
subTreeB <- pollute %>% filter(Industry>748) 
# Ctrl + shift + M
meanB <- mean(subTreeB$Pollution)

subTreeA <- pollute %>% filter(Industry<748) %>% filter(Population<190)
# Ctrl + shift + M
meanA <- mean(subTreeA$Pollution)

subTreeC <- pollute %>% filter(Industry<748) %>% filter(Population>190)%>% filter(Wet.days<108)
# Ctrl + shift + M
meanC <- mean(subTreeC$Pollution)

subTreeD <- pollute %>% filter(Industry<748) %>% filter(Population>190)%>% filter(Wet.days>108)%>% 
                      filter(Temp>59.35)
# Ctrl + shift + M
meanD <- mean(subTreeD$Pollution)

subTreeF <- pollute %>% filter(Industry<748) %>% filter(Population>190)%>% filter(Wet.days>108)%>% 
  filter(Temp<59.35)%>% filter(Wind>9.65)
# Ctrl + shift + M
meanF <- mean(subTreeF$Pollution)

subTreeE <- pollute %>% filter(Industry<748) %>% filter(Population>190)%>% filter(Wet.days>108)%>% 
  filter(Temp<59.35)%>% filter(Wind<9.65)
# Ctrl + shift + M
meanE <- mean(subTreeE$Pollution)

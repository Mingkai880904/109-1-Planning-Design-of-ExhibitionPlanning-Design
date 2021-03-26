#Used Data Set for this Section
install.packages("MASS")
library(MASS)
data(Insurance)
head(Insurance)
nrow(Insurance);ncol(Insurance)
dim(Insurance)

#Understand Variables Structure ¡Vsummary()
names(Insurance)
attributes(Insurance)
str(Insurance)
summary(Insurance)

#Variables Description - describe()
install.packages("Hmisc")
library(Hmisc)
describe(Insurance[,1:3])
describe(Insurance[,4:5])

#fBasics package ¡V basicStats()
install.packages("fBasics")
library(fBasics)
basicStats(Insurance$Holders)

#Data Cleaning
pay=c(11,19,14,22,14,28,13,81,12,45,
      11,16,31,16,23,42,22,26,17,22,
      13,27,180,16,43,82,14,11,51,76,
      28,66,29,14,14,65,37,16,37,35,
      39,27,14,17,13,38,28,40,85,32,
      25,26,16,12,54,40,18,27,16,14,
      33,29,77,50,19,34)
par(mfrow=c(2,2))
hist(pay)
dotchart(pay)
boxplot(pay,horizontal = T)
qqnorm(pay);qqline(pay)

#Missing Data Processing
summary(nhanes2)
sum(is.na(nhanes2))
nrow(nhanes2)
sum(complete.cases(nhanes2))
md.pattern(nhanes2)
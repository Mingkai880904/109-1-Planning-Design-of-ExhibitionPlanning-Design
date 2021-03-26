#correlation v.s covariance in R(1)
install.packages("ggplot2")
library(ggplot2)
head(economics)
?economics
cor(economics$pce, economics$psavert)

#correlation v.s covariance in R(2)
xPart <- economics$pce - mean(economics$pce)
yPart <- economics$psavert - mean(economics$psavert)
nMinusOne <- (nrow(economics) - 1)
xSD <- sd(economics$pce)
ySD <- sd(economics$psavert)
sum(xPart * yPart) / (nMinusOne * xSD * ySD)

#correlation v.s covariance in R(3)
install.packages("GGally")
library(GGally)
GGally::ggpairs(economics[, c(2, 4:6)])
cor(economics[, c(2, 4:6)])

#correlation v.s covariance in R(4)
cov(economics$pce, economics$psavert)
cov(economics[, c(2, 4:6)])
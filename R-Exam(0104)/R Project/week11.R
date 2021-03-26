#exercise
n <- c(1,1,2,4,6)
plot(n, pch = 17, col = "blue", cex = 2)
#sum
sum(n)
#mean
mean(n)
#median
median(n)
as.numeric(names(table(n)))[which.max(table(n))]
#draw mean to x
points(mean(n), pch = 4, col = "blue", cex = 3)
#draw median to x
points(median(n), pch = 3, col = "orange", cex = 3)
#draw mode to x
points(getmode(n), pch = 1, col = "red", cex = 3)
#getmode
x <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
temp <- table(as.vector(x))
names(temp)[temp == max(temp)]

#standard deviation
str(iris)
iris$Sepal.Length
sd(iris$Sepal.Length)
iris$Petal.Length
sd(iris$Petal.Length)

#variation
sd(iris$Sepal.Length)
var(iris$Sepal.Length)
sd(iris$Petal.Length)
var(iris$Petal.Length)

#range
iris
range(iris$Sepal.Length)
range(iris$Sepal.Length)[2] - range(iris$Sepal.Length)[1]

#quartile
n <- (1:10)
sd(n)
var(n)
sd(n) ^ 2
cv <- 100 * sd(n) / mean(n)
cv
range(n)[2] - range(n)[1]

#Q1=P25,Q2=P50,Q3=P75
Q1 <- quantile(n, 1 / 4)
Q2 <- quantile(n, 2 / 4)
Q3 <- quantile(n, 3 / 4)
Q1
Q2
Q3
#IQR = Q3 - Q1
b <- Q3 - Q1 == IQR(n)
b
#summary
summary(n)
#quantile
quantile(n)

#quartile and quantile
x <- sample(x = 1:200, size = 100, replace = TRUE)
x
y <- x
y[sample(x = 1:200, size = 20, replace = FALSE)] <- NA
y

#count P25 and P75
quantile(x, probs = c(0.25, 0.75))
quantile(y, probs = c(0.25, 0.75))
quantile(y ,probs = c(0.25, 0.75), na.rm = TRUE)
quantile(x, probs = c(0.1, 0.25, 0.5, 0.75, 0.99))
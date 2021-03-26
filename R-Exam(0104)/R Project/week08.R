#mean
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
#Find Mean
result.mean <- mean(x)
print(result.mean)

#applying trim option in mean()
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
#Find Mean
result.mean <- mean(x,trim = 0.3)
print(result.mean)

#applying NA option in mean()
x <- c(12,7,3,4.2,18,2,54,-21,8,-5,NA)
result.mean <- mean(x)
print(result.mean)
result.mean <- mean(x,na.rm = TRUE)
print(result.mean)

#median
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
median.result <- median(x)
print(median.result)

#mode calculation
getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#run1:calculate the mode using the user function.
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
result <- getmode(v)
print(result)

#run2:calculate the mode using the user function.
charv <- c("o","it","the","it","it")
result <- getmode(charv)
print(result)

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
points(median(n), pch = 3, col = "blue", cex = 3)

x <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
temp <- table(as.vector(x))
names(temp)[temp == max(temp)]
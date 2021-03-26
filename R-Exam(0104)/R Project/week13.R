#dnorm()without mean and standard deviation->601
x <- seq(from = -3, to = 3, by = 0.01)
y <- dnorm(x)
plot(x, y, type = "l", ylab = "Density")

#dnorm()with mean and standard deviation
x <- seq(-10, 10, by = .1)
y <- dnorm(x, mean = 2.5, sd = 0.5)
png(file = "dnorm.png")
plot(x,y)
dev.off() #save the file

#pnorm()
pnorm(1.96)
x <- seq(-10, 10, by = .2)
y <- pnorm(x, mean = 2.5, sd = 2)
png(file = "pnorm.png")
plot(x,y)
dev.off() #save the file 
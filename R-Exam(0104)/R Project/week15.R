#Loading Data Set
install.packages("C:/Users/20200925/Documents/mvpart_1.6-2.tar.gz", repos = NULL, type = "source")
library(mvpart)
data(car.test.frame)
head(car.test.frame)
#install.packages("devtools")
#devtools::install_github("cran/mvpart")

#Rename the column names
car.test.frame$Mileage=100*4.546/(1.6*car.test.frame$Mileage)
names(car.test.frame)=c("價格","產地","可用性","油耗","型態","車重","發動機功率","淨馬力")
head(car.test.frame)

#Retrieving the column information
str(car.test.frame)
summary(car.test.frame)

#Choose the goal variable 
Group_Mileage=matrix(0,60,1)
Group_Mileage[which(car.test.frame$"油耗">=11.6)]="A"
Group_Mileage[which(car.test.frame$"油耗"<=9)]="C"
Group_Mileage[which(Group_Mileage==0)]="B"
car.test.frame$"分群組油耗"=Group_Mileage
car.test.frame[1:10,c(4,9)]

#Generate Training data & Test data
install.packages("sampling")
library(sampling)
a=round(1/4*sum(car.test.frame$"分群組油耗"=="A"))
b=round(1/4*sum(car.test.frame$"分群組油耗"=="B"))
c=round(1/4*sum(car.test.frame$"分群組油耗"=="C"))
a;b;c
sub=strata(car.test.frame, stratanames = "分群組油耗", size=c(c,b,a), method="srswor")
sub

Train_Car=car.test.frame[-sub$ID_unit,]
Test_Car=car.test.frame[sub$ID_unit,]
nrow(Train_Car); nrow(Test_Car)

#==========CART==========#
#CART Install and load packages
install.packages("rpart")
library(rpart)
library(rpart.plot)
library(maptree)

#Create a Model for a regression tree
formula_Car_Reg=油耗~價格+產地+可用性+型態+車重+發動機功率+淨馬力
rp_Car_Reg=rpart(formula_Car_Reg, Train_Car, method="anova")
print(rp_Car_Reg)
printcp(rp_Car_Reg)
summary(rp_Car_Reg)

rp_Car_Reg1=rpart(formula_Car_Reg, Train_Car, method="anova", minsplit=10)
print(rp_Car_Reg1)
printcp(rp_Car_Reg1)

#Create another Model for a Regression tree
rp_Car_Reg2=rpart(formula_Car_Reg, Train_Car, method="anova",cp=0.1)
print(rp_Car_Reg2)
printcp(rp_Car_Reg2)

#Using prune.rpart() to prune out branches
formula_Car_Reg=油耗~價格+產地+可用性+型態+車重+發動機功率+淨馬力
rp_Car_Reg=rpart(formula_Car_Reg, Train_Car, method="anova")
rp_Car_Reg3=prune.rpart(rp_Car_Reg,cp=0.1)
rp_Car_Reg3=prune.rpart(rp_Car_Reg,cp=0.1)
print(rp_Car_Reg3)
printcp(rp_Car_Reg3)

#建模
rp_Car_Reg4=rpart(formula_Car_Reg, Train_Car, method="anova", maxdepth=1)
print(rp_Car_Reg4)
printcp(rp_Car_Reg4)

#Using rpart.plot() to plot a tree
rp_Car_Plot=rpart(formula_Car_Reg, Train_Car, method="anova", minsplit=10)
print(rp_Car_Plot)
rpart.plot(rp_Car_Plot)
#rpart.plot(rp_Car_Plot, type=4)
#rpart.plot(rp_Car_Plot, type=4, branch=1)
#rpart.plot(rp_Car_Plot, type=4, fallen.leaves = FALSE)
draw.tree(rp_Car_Plot, col=rep(1,7), nodeinfo = TRUE)

#use Group_Mileage as a goal variable
formula_Car_Cla=分群組油耗~價格+產地+可用性+型態+車重+發動機功率+淨馬力
rp_Car_Cla=rpart(formula_Car_Cla, Train_Car, method="class", minsplit=5)
print(rp_Car_Cla)
rpart.plot(rp_Car_Cla, type=4, fallen.leaves = TRUE)

pre_Car_Cla=predict(rp_Car_Cla, Test_Car, type="class")
pre_Car_Cla
table(Test_Car$分群組油耗, pre_Car_Cla)
(p=sum(as.numeric(pre_Car_Cla!=Test_Car$分群組油耗))/nrow(Test_Car))
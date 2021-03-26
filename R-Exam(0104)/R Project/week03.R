#整數向量
c(T, F, TRUE, FALSE)
c(1L, 2L, 3L, 4L, 0xaL)

#數值向量

#factor(1)
colors <- c("red", "yellow", "green", "red", "green")
colors.factor <- factor(colors)
colors.factor
levels(colors.factor)
nlevels(colors.factor)

#factor(2)
colors.factor2 <- factor(colors, 
                         levels = c("red", "yellow"))
colors.factor2

#factor(3)
a <- c("IE", "IM", "IN", "IE", "IE")
af <- factor(a)
af
bf <- factor(c("IE", "IM", "IN", "IE", "IE"))
bf

#vectors(1)
v1 = 1:5
v1
v2 = c("f","g","d","5")
v2
v3 = vector(mode="character", length=5)
     #default values+#elements setting
v3
v4 = vector(mode="logical", length=5)
     #default values+#elements setting
v4

#matrices
mtx0 = matrix(1:9, ncol=3, nrow=3, byrow=T)
mtx0
#-----------------------------------------
mtx = matrix(2:5, ncol=2, nrow=2, byrow=T)
mtx
#-----------------------------------------
colnames(mtx) = c('col1','col2');
rownames(mtx) = c('col1','col2')
mtx
#-----------------------------------------
t(mtx) #transpose the matrix-轉置矩陣

#array(1)
array(1:5, c(2,4)) #recycle 1:5
#-----------------------------------------
a1 = array(c(2, 3, 4, 5, 6, 7), dim=c(1, 2, 3)) #1x2x3
a1
#-----------------------------------------
a2 = array(c(1, 4, 7, 2, 5, 8, 3, 6, 9), dim=c(3,3))
a2

#array(2)
x <- c(1, 2, 3)
y <- c(4, 5, 6)
rbind(x,y) #rbind是利用row(橫)合併
cbind(x,y) #cbind是利用column(直)合併

#data.frame(1)
v1 = c(9, 8, 7)
v2 = c("a","b","c")
#combine 2 vectors
d = data.frame(x1 = v1, x2 = v2, stringsAsFactors = F)
str(d) #show the structure of the data frame "d"
d

#data.frame(2)
df1 <- data.frame(v1=1:5, v2=c(10,7,9,6,8), 
                  v3=11:15, v4=c(1,1,2,2,1))
df1
sort(df1$v2)
df1
sort(df1$v2, decreasing = T)
df1
order(df1$v2)
df1
order(df1$v2, decreasing = T)
df1
df1[order(df1$v2, decreasing = T),] #[]中括號左邊擺元素


#data.table()
df <- data.frame(a=c('A','B','C','A','A','B'), b=rnorm(6))
df
dt <- data.table(a=c('A','B','C','A','A','B'), b=rnorm(6))
dt

#type of data.table(1)
class(df)
class(dt)
#memory object-physical
mode(df)
mode(dt)
#memory object-physical(對內存物件型別之細分)
typeof(df)
typeof(dt)

#type of data.table(2)
class(3)
class(3L)
mode(3)
mode(3L)
typeof(3)
typeof(3L)

#data.table
df <- data.frame(a=c('A','B','C','A','A','B'), b=rnorm(6))
class(df)
df2 <- data.table(df)
class(df2)
df3 <- data.frame(df2)
class(df3)

#data.table()篩選資料1
dt <- data.table(a=c('A','B','C','A','A','B'), b=rnorm(6))
dt
dt[2,]
dt[a=='B',]
dt$a

#data.table()篩選資料2
#增加1列，行名為c
dt[,c:=b+2]
dt
#增加2列，第2種寫法
dt[,`:=` (c1 = 1:6, c2 = 2:7)]
dt

#data.table()篩選資料3
dt = data.table(a=c('A','B','C','A','A','B'), b=rnorm(6))
dt
dt[,sum(b)] #對整個b列數據求和
dt[,sum(b),by=a] #按a列分組，並對b列按分組求和

#list(1)
L = list(k1 = c(6, 8, 9), k2 = c("e","f"), k3 = c(1))
L
class(L)
mode(L)
typeof(L)

#list(2)
listSample <- list(Students=c("Tom","Kobe","Emma","Amy"),
                   Year=2017,
                   Score=c(60,50,80,40),
                   School="KSU")
listSample
listSample$Year
listSample$Score
listSample[2]
listSample[3]

#list(3)
rec <- list(name="John Canning", age=30, scores=c(85,76,90))
rec
rec[[2]]
rec[[3]][2]
rec$age <- 45
rec$age
rec

#list(4)
a_vector <- c(1, "me")
a_vector
a_vector <- data.frame(1, "me")
a_vector
a_vector <- list(1, "me")
a_vector
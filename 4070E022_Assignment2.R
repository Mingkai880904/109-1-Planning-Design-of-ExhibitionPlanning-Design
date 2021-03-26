#1
install.packages("dplyr")
library("dplyr")
a <- data.frame(m.name = c("Tom", "Joe", "Vicky", "Mike"),
                m.age = c(27, 29, 28, 28))
b <- data.frame(m.name = c("Tom", "Joe", "Vicky", "Mike"),
                m.hight = c(178, 186, 168, 177))
data01 <- merge(x = a, y = b, by= "m.name", all = TRUE) %>% select(m.age, m.hight, m.name)
data01

#2
df1 <- data.frame(m.name = c("Tom", "Joe", "Vicky", "Mike"),
                m.age = c(27, 29, 28, 28))
df2 <- data.frame(m.name = c("Tom", "Joe", "Vicky", "Mike"),
                m.hight = c(178, 186, 168, 177))
data02 <- merge(x = df1, y = df2, by= "m.name", all = TRUE) %>% select(m.age, m.hight, m.name)
data02[order(data02$m.age, data02$m.hight),]

#3
df3 <- data.frame(emp_id = c(1:5), 
                  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
                  salary = c(623.3,515.2,611.0,729.0,843.25), 
                  start_date = c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27"), 
                  dept = c("IT","Operations","IT","HR","Finance"))
df4 <- data.frame(emp_id = c(6:8), 
                  emp_name = c("Rasmi","Pranab","Tusar"),
                  salary = c(578.0,722.5,632.8),  
                  start_date = c("2013-05-21","2013-07-30","2014-06-17"),  
                  dept = c("IT","Operations","Fianance"))
merge(x = df3, y = df4, all = TRUE)

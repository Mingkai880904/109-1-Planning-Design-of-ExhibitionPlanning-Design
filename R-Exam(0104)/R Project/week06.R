#install RJSON Package
install.packages("jsonlite")
any(grepl("jsonlite",install.packages()))
library("jsonlite")

#use mtcars
mtcars
my.json <- toJSON(mtcars)
my.df <- fromJSON(my.json)
all.equal(mtcars, my.df)

write(my.json, "output.json")
fromAJsonFile <- fromJSON("output.json")
head(fromAJsonFile)

#json to R
json <- '["Mario", "Peach", null, "Bowser"]'
fromJSON(json)

#json to dataframe's object
json <- '[{"Name" : "Mario", "Age" : 32, "Occupation" : "Plumber"},
          {"Name" : "Peach", "Age" : 21, "Occupation" : "Princess"},
          {},
          {"Name" : "Bowser", "Occupation" : "Koopa"}]'
(my.df <- fromJSON(json))
my.df #same as previous one

#Data Reshaping
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)
addresses <- cbind(city,state,zipcode)
cat("# # # # The First data frame\n")
print(addresses)

#create another data frame with similar columns
new.address <- data.frame(
  city = c("Lowry","Charlotte"),
  state = c("CO","FL"),
  zipcode = c("80230","33949"),
  stringsAsFactors = FALSE
)
cat("# # # # The Second data frame\n")
print(new.address)
all.addresses <- rbind(addresses,new.address)
cat("# # # # The Combined data frame\n")
print(all.addresses)

#Merging Data Frames
library("MASS")
merged.Pima <- merge(x = Pima.te, y = Pima.tr,
                     by.x = c("bp", "bmi"),
                     by.y = c("bp", "bmi")
)
print(merged.Pima)
nrow(merged.Pima)

#Merge Example
ID <- c(1,2,3,4)
name <- c('A','B','C','D')
score <- c(60,70,80,90)
student1 <- data.frame(ID,name)
student1
student2 <- data.frame(ID,score)
student2
total_student1 <- merge(student1,student2,by='ID')
total_student1
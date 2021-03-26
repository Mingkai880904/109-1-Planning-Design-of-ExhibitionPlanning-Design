# for-loop
result <- 0
for(i in c(1:15)){ 
  result <- result + i
}
result

# break
for(i in c(2:7)){
  if(i == 6) break 
  print(i)
}

# next
for(i in c(2:7)){
  if(i == 6) next
  print(i)
}

# Exercise(while-loop)
result <- 0
i <- 1
while(i < 16){ 
  result <- result + i
  i <- i + 1
}
result
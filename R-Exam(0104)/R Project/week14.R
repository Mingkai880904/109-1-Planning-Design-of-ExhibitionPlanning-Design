#data set
install.packages("arules")
library("arules")
data("Groceries")
summary(Groceries)
inspect(Groceries[1:10])
inspect(Groceries[1:10], linebreak=FALSE)

#rule0 setting
rules0=apriori(Groceries, parameter = list(support=0.001, confidence=0.5))
rules0
inspect(rules0[1:10], linebreak=FALSE)

#other rules settings-way1
rules1=apriori(Groceries, parameter = list(support=0.005, confidence=0.5))
rules1
rules2=apriori(Groceries, parameter = list(support=0.005, confidence=0.6))
rules2
rules3=apriori(Groceries, parameter = list(support=0.005, confidence=0.64))
rules3

#other rules settings
inspect(rules3, linebreak=FALSE)

#other rules settings-way2
rules.sorted_sup = sort(rules0, by="support")
inspect(rules.sorted_sup[1:10], linebreak=FALSE)

#other rules settings-way3
rules.sorted_con = sort(rules0, by="confidence")
inspect(rules.sorted_con[1:10], linebreak=FALSE)

#other rules settings-way4
rules.sorted_lift = sort(rules0, by="lift")
inspect(rules.sorted_lift[1:8])

#another thinking - promotion
rules4 = apriori(Groceries,parameter = list(maxlen=2, supp=0.001, conf=0.1), appearance = list(rhs="mustard", default="lhs"))
inspect(rules4)

#another thinking - frequent itemsets
itemsets_apr = apriori(Groceries,
                       parameter = list(supp=0.001, target="frequent itemset"),
                       control = list(sort=-1))
itemsets_apr
inspect(itemsets_apr[1:5])

#another thinking - revisit frequent itemsets
itemsets_ecl = eclat(Groceries,
                       parameter = list(minlen=1, maxlen=3, supp=0.001,
                                        target="frequent itemset"), control = list(sort=-1))
itemsets_ecl
inspect(itemsets_ecl[1:5])

#visualization
install.packages("digest")
library("digest")
install.packages("arulesViz")
library("arulesViz")

library(MASS); library(scatterplot3d);
library(vcd); library(grid)
library(colorspace); library(seriation);
library(cluster); library(TSP); library(gclus)

#visualization
rules5 = apriori(Groceries, parameter = list(support=0.002,confidence=0.5))
rules5
plot(rules5)
png(file="grouped.png")
plot(rules5, method="grouped")
dev.off()

#Visualization - Interactive
plot(rules5, interactive(TRUE))
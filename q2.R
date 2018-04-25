x = read.csv(file.choose())  #select dirty_iris.csv

#replace special values with NA
x[,-5] = lapply(x[,-5], function(y) as.numeric(as.character(y)))

#total number of complete observations
c = sum(complete.cases(x))
cat("Number of complete observations : ", c, "\n")

#percentage of complete observations
cat("Number of complete observations : ", c/(dim(x)[1])*100, "\n\n")
x = na.omit(x)    #delete records with NAs

library(editrules)
edit2 <- editfile(file.choose())  #select rules2.txt
sm <- violatedEdits(edit2,x)
summary(sm)
plot(sm)

boxplot(iris$Sepal.Length)
boxplot.stats(iris$Sepal.Length)

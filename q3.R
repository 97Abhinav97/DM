iris1 <- iris[,-5]
summary(iris1)
s <- sapply(iris1,sd)
s
hist(iris1$Sepal.Width)  #check bell shape curve for all attributes
data_std <- function(x) { (x-mean(x))/sd(x) }
iris_std <- data.frame(sapply(iris[,-5],data_std))
summary(iris_std)
s <- sapply(iris_std,sd)
s
hist(iris_std$Sepal.Width)  #check bell shape curve for all attributes

#Naive Bayes
library(naivebayes)
library(caret)
set.seed(1234)
id <- sample(2,150,prob=c(0.7,0.3),replace = T)
train <- iris[id==1,]
test <- iris[id==2,]
imp_nb = naive_bayes(Species~., data=train)
pre3 <- predict(imp_nb,test)
confusionMatrix(table(pre3, test$Species))
mean(pre3==test[,5])


#KNN
library(class)
normalize <- function(x) { (x-min(x))/(max(x)-min(x)) }
iris_norm <- sapply(iris[,-5], normalize)
s <- sample(150,120)
iris_train <- iris_norm[s,]
iris_test <- iris_norm[-s,]
iris_pred <- knn(iris_train,iris_test,iris[s,5],k=13)
table(iris_pred,iris[-s,5])
mean(iris_pred==iris[-s,5])


#DECISION TREE
library(rpart)
library(rpart.plot)
s <- sample(150, 100)
train <- iris[s,]
test <- iris[-s,]
d <- rpart(Species~., train, method = "class")
rpart.plot(d)
p <- predict(d, test, type  = "class")
table(test[,5], p)
mean(p==test[,5])

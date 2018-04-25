#Kmeans
library(cluster)
iris1 <- iris[,1:4]
results <- kmeans(iris1,3)
results
table(iris$Species,results$cluster)
plot(iris[,-5],col=results$cluster)


#DBScan
library(dbscan)
iris_m <- iris[,1:4]
kNNdistplot(iris_m,k=4)
abline(h=0.4,col="red")
db <- dbscan(iris_m,0.4,4)
db
hullplot(iris_m,db$cluster)
table(iris$Species,db$cluster)


#Hierarchical Clustering
library(cluster)
hc_complete <- hclust(dist(iris),method = "complete")
hc_single <- hclust(dist(iris),method = "single")
plot(hc_complete, main = "Hierarchical Clustering Complete", cex = 0.9)
plot(hc_single, main = "Hierarchical Clustering Single", cex = 0.9)

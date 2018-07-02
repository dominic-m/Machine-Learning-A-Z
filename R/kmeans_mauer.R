# K-Means Clustering

# Importing the mall dataset
dataset <- read.csv('Mall_Customers.csv')
X <- dataset[, 4:5]

# When using k-means, we have to specify the number of clusters
# but we can use the elbow method to find optimal number of clusters

# Using the elbow method:
set.seed(6) #just to get same results on video
wcss <- vector()
for (i in 1:10) wcss[i] <- sum(kmeans(X, i)$withinss)
plot(1:10, wcss, type = 'b', main = paste('Clusters of Clients'),
     xlab = 'Number of clusters', ylab = 'WCSS')

# Applying k-means to the mall dataset
set.seed(29)
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)

# Visualizing the clusters
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of clients'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
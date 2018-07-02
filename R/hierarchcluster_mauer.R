# Hierarchical Clustering

# Importing the dataset
dataset <- read.csv('Mall_Customers.csv')
X <- dataset[, 4:5]

# Using the dendrogram to find the optimal number of clusters
# looking for the largest vertical bar without a horizontal bar that can go through it
dendrogram <- hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean distances')

# Fitting hierarchical clustering to the dataset
hc <- hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc <- cutree(tree = hc, k = 5)
y_hc

# Visualizing the hierarchical clustering results
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of clients'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
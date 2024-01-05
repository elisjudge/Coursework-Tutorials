# Read in the Data
zz<-read.table("Data/lettersdata.txt")
zz<-as.matrix(zz)

# Plot the Data
plot(zz,
     main = "Scatterplot: SIT",
     pch = 21,
     col = "black",
     bg = "blue",
     cex = 1.2,
     xaxt = 'n', 
     yaxt = 'n',
     xlab = '', 
     ylab = '')


# Run the K-means
cl <- kmeans(zz, 4, nstart = 25)

plot(zz,
     main = "Scatterplot: SIT - Kmeans = 4",
     col = 'black', 
     bg = cl$cluster, 
     pch=21,
     cex = 1.2,
     xaxt = 'n', 
     yaxt = 'n',
     xlab = '', 
     ylab = '')

points(cl$centers, 
       col = 1:5, 
       pch = 8,
       cex = 1.8
)

# Compute the Total Within Sum Of Squares (TOTWSS)

#Initialize Matrix with 2 columns: One for the K, the other for the TOTWSS
totwss <- matrix(0, nrow = 19, ncol = 2)
totwss[,1] <- 2:20 # Assign 2:20 to first column

#Vectorize the K-means function such that it is applied to each number of K (Faster than for loop)
totwss[,2] <- unlist(lapply(2:20, function(i) kmeans(zz, centers=i)$tot.withinss))  

plot(totwss, 
     main="Kmeans: Total Within Sum of Squares (TOTWSS) by K",
     xlab= "K",
     ylab= "TOTWSS",
     col = 'black', 
     bg = 'yellow', 
     pch=21,
     cex = 1.2,
     axes = FALSE) #Clears axes

# Create Custom Axes

# Create X axis: Set ticks to start at 2 and go up by 2.
axis(1, at = seq(2, 20, by = 2))

# Create Y Axis: Set ticks to start at 0 and go up by 500.
axis(2, at = seq(0, 3000, by = 500))

# Redraw the Box
box()

# Perform Spectral Clustering

# 1. Create Similarity Matrix

dZZ<-as.matrix(dist(zz)) # compute eucleadean distances
cParam = 1 # parameter of similarity function
S<-exp(-dZZ/cParam) #compute similarity matrix

# 2. Define Function for Affinity Matrix

#S-distance matrix and k-no of neighbours
AffMat <- function(S, k) {
  n <- nrow(S)
  AM <- matrix(0, nrow = n, ncol = n)
  
  for (i in 1:n) {
    top_k_indices <- order(S[i, ], decreasing = TRUE)[1:k]
    AM[i, top_k_indices] <- S[i, top_k_indices]
    AM[top_k_indices, i] <- AM[i, top_k_indices]
  }
  
  AM
}

# 3. Create Affinity Matrix
kVal=26   
A<-AffMat(S,kVal)

# 4. Compute degree of Affinity Matrix
D <- diag(apply(A, 1, sum)) # sum rows

# 5. Create Un-Normalized Laplasian Matrix 
L <- D - A

# 6. Compute eigenvalues and eigenvectors
eigL <-eigen(L)

plot(eigL$values,
     main = "Eigenvalue Plot",
     ylab= "Eigenvalue",
     col = 'black', 
     bg = 'pink', 
     pch=21,
     cex = 0.98)

tail(eigL$values, 10)

# 7. Run kmeans on the eignvectors.
k<-4
Z<- eigL$vectors[,(ncol(eigL$vectors)-k+1):ncol(eigL$vectors)]

cl2 <- kmeans(Z, k, nstart=25)


plot(zz, 
     main = "ScatterPlot: SIT - Spectral Clustering K=4, kVal=26",
     col='black',
     bg=cl2$cluster,
     pch=21,
     cex = 1.2,
     xaxt = 'n', 
     yaxt = 'n',
     xlab = '', 
     ylab = ''
)
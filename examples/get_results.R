methods_NbCLust <- c("ward.D", 
                     "ward.D2", 
                     "single", 
                     "complete", 
                     "average", 
                     "mcquitty", 
                     "median", 
                     "centroid", 
                     "kmeans")

results <- vector(mode = "list", length = length(methods_NbCLust) * length(datasets))

i <- 0
for(d in datasets) {
  for(m in methods_NbCLust) {
    print(d)
    print(m)
    print("---------------------------------------------")
    i <- i + 1
    set.seed(2020)
    results[[i]] <- NbClust(get(d), distance = "euclidean", min.nc=2, max.nc=8, method = m, index = "all")
  }
}
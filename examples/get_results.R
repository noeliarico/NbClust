shaped_results <- vector(mode = "list", length = length(methods_NbCLust) * length(datasets[8:14]))

i <- 0
for(d in datasets[8:13]) {
  for(m in methods_NbCLust) {
    print(d)
    print(m)
    print("---------------------------------------------")
    i <- i + 1
    set.seed(2020)
    shaped_results[[i]] <- NbClust(get(d), distance = "euclidean", min.nc=2, max.nc=15, method = m, index = "all")
  }
}
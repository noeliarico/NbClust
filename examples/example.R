## A 2-dimensional example
set.seed(1) 
x <- rbind(matrix(rnorm(100,sd=0.1),ncol=2),
                     matrix(rnorm(100,mean=1,sd=0.2),ncol=2), matrix(rnorm(100,mean=5,sd=0.1),ncol=2), matrix(rnorm(100,mean=7,sd=0.2),ncol=2))
res<-NbClust(x, distance = "euclidean", min.nc=2, max.nc=8, method = "complete", index = "ch")
res$All.index 
res$Best.nc 
res$Best.partition
## A 5-dimensional example
set.seed(1) x<-rbind(matrix(rnorm(150,sd=0.3),ncol=5),
                     matrix(rnorm(150,mean=3,sd=0.2),ncol=5),matrix(rnorm(150,mean=1,sd=0.1),ncol=5), matrix(rnorm(150,mean=6,sd=0.3),ncol=5), matrix(rnorm(150,mean=9,sd=0.3),ncol=5))
res<-NbClust(x, distance = "euclidean", min.nc=2, max.nc=10, method = "ward.D", index = "all")
res$All.index 
res$Best.nc 
res$All.CriticalValues 
res$Best.partition
## A real data example
data<-iris[,-c(5)] 
res<-NbClust(data, diss=NULL, distance = "euclidean", min.nc=2, max.nc=6, 
             method = "ward.D2", index = "kl")
res$All.index 
res$Best.nc 
res$Best.partition
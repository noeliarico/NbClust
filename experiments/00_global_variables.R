# Categories of the indexes ----------------------------------------------------

maximum <- c("kl",
             "ch",
             "ccc",
             "silhouette", 
             "ratkowsky",
             "ptbiserial",
             "gamma",
             "tau",
             "dunn")

minimum <- c("cindex",
             "db",
             "mcclain",
             "gplus",
             "sdindex",
             "sdbw")

weird <- c("hartigan", # Maximum difference between hierarchy levels of the index
           "scott", # Maximum difference between hierarchy levels of the index
           "marriot", # Max. value of second differences between levels of the index
           "trcovw", # Maximum difference between hierarchy levels of the index
           "tracew", # Maximum value of absolute second differences between levels of the index 
           "friedman", # Maximum difference between hierarchy levels of the index
           "rubin", # Minimum value of second differences between levels of the index
           "duda", # Smallest nc such that index > criticalValue
           "pseudot2", # Smallest nc such that index < criticalValue) 
           "beale", # nc such that critical value of the index >= alpha
           "ball", # Maximum difference between hierarchy levels of the index
           "gap", # "Smallest nc such that criticalValue >= 0"
           "frey", # the cluster level before that index value < 1.00
           "hubert", # Graphical method
           "dindex" # Graphical method
)


# Methods NbClust ---------------------------------------------------------

methods_NbCLust <- c("ward.D", 
                     "ward.D2", 
                     "single", 
                     "complete", 
                     "average", 
                     "mcquitty", 
                     "median", 
                     "centroid", 
                     "kmeans")

# Datasets ----------------------------------------------------------------

datasets <- c(# S datasets
              "data_s1", 
              "data_s2", 
              "data_s3", 
              "data_s4", 
              # A datasets
              "data_a1", 
              "data_a2", 
              "data_a3",
              # Shaped data
              "data_shape_aggregation",
              "data_shape_compound",
              #"data_shape_flame",
              "data_shape_jain",
              "data_shape_pathbased",
              "data_shape_R15",
              "data_shape_spiral")


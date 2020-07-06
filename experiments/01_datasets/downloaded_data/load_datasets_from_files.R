library(tidyverse)

# -------------------------------------------------------------------------
# http://cs.joensuu.fi/sipu/datasets/

# Synthetic 2-d data with N = 5000 vectors and k = 15 
# Gaussian clusters with different degree of cluster overlap

# @article{Ssets,
#   author  = {P. Fr\"anti and O. Virmajoki},
#     title   = {Iterative shrinking method for clustering problems},
#     journal = {Pattern Recognition},
#     year    = {2006},
#     volume  = {39},
#     number  = {5},
#     pages   = {761--765},
#     doi     = {10.1016/j.patcog.2005.09.012},
#     url     = {http://dx.doi.org/10.1016/j.patcog.2005.09.012}
# }

data_s1 <- read.table("experiments/01_datasets/downloaded_data/files/s1.txt")
data_s2 <- read.table("experiments/01_datasets/downloaded_data/files/s2.txt")
data_s3 <- read.table("experiments/01_datasets/downloaded_data/files/s3.txt")
data_s4 <- read.table("experiments/01_datasets/downloaded_data/files/s4.txt")

data_s1c <- data_s1 %>% bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/s1-label.txt", skip = 5, 
                                 col_names = "real_cluster", 
                                 col_types = cols(real_cluster = col_factor())))
data_s2c <- data_s2 %>% bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/s2-label.txt", skip = 5, 
                                 col_names = "real_cluster", 
                                 col_types = cols(real_cluster = col_factor())))
data_s3c <- data_s3 %>% bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/s3-label.txt", skip = 5, 
                                 col_names = "real_cluster", 
                                 col_types = cols(real_cluster = col_factor())))
data_s4c <- data_s4 %>% bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/s4-label.txt", skip = 5, 
                                 col_names = "real_cluster", 
                                 col_types = cols(real_cluster = col_factor())))

save(data_s1, data_s1c, file = "experiments/01_datasets/downloaded_data/objects/s1.RData")
save(data_s2, data_s2c, file = "experiments/01_datasets/downloaded_data/objects/s2.RData")
save(data_s3, data_s3c, file = "experiments/01_datasets/downloaded_data/objects/s3.RData")
save(data_s4, data_s4c, file = "experiments/01_datasets/downloaded_data/objects/s4.RData")

# Synthetic 2-d data with increasing number of clusters (k). 
# There are 150 vectors per cluster.

# @TECHREPORT{Asets,
#   author = {I. K\"arkk\"ainen and P. Fr\"anti},
#   title = {Dynamic local search algorithm for the clustering problem},
#   institution = {Department of Computer Science, University of Joensuu},
#   address = {Joensuu, Finland},
#   number = {A-2002-6},
#   year = {2002}
# }

data_a1 <- read.table("experiments/01_datasets/downloaded_data/files/a1.txt")
data_a2 <- read.table("experiments/01_datasets/downloaded_data/files/a2.txt")
data_a3 <- read.table("experiments/01_datasets/downloaded_data/files/a3.txt")

data_a1c <- data_a1 %>% 
            bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/a1-ga.txt", skip = 4, 
                            col_names = "real_cluster", 
                            col_types = cols(real_cluster = col_factor()))) %>%
            mutate(real_cluster = factor(real_cluster, levels = 1:20))
data_a2c <- data_a2 %>% 
  bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/a2-ga.txt", skip = 4, 
                     col_names = "real_cluster", 
                     col_types = cols(real_cluster = col_factor()))) %>%
  mutate(real_cluster = factor(real_cluster, levels = 1:35))
data_a3c <- data_a3 %>% 
  bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/a3-ga.txt", skip = 4, 
                     col_names = "real_cluster", 
                     col_types = cols(real_cluster = col_factor()))) %>%
  mutate(real_cluster = factor(real_cluster, levels = 1:50))

save(data_a1, data_a1c, file = "experiments/01_datasets/downloaded_data/objects/a1.RData")
save(data_a2, data_a2c, file = "experiments/01_datasets/downloaded_data/objects/a2.RData")
save(data_a3, data_a3c, file = "experiments/01_datasets/downloaded_data/objects/a3.RData")


datasets <- c("data_s1",
              "data_s2",
              "data_s3",
              "data_s4",
              "data_a1",
              "data_a2",
              "data_a3")

# dim064 <- read.table("experiments/01_datasets/downloaded_data/files/dim064.txt")
# dim128 <- read.table("experiments/01_datasets/downloaded_data/files/dim128.txt")
# dim256 <- read.table("experiments/01_datasets/downloaded_data/files/dim256.txt")
# dim512 <- read.table("experiments/01_datasets/downloaded_data/files/dim512.txt")
# dim1024 <- read.table("experiments/01_datasets/downloaded_data/files/dim1024.txt")
# 
# dim064c <- dim064 %>% 
#   bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/dim064-pa.txt", skip = 5, 
#                      col_names = "real_cluster", 
#                      col_types = cols(real_cluster = col_factor()))) %>%
#   mutate(real_cluster = factor(real_cluster, levels = 1:16))
# 
# dim128c <- dim128 %>% 
#   bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/dim128-pa.txt", skip = 5, 
#                      col_names = "real_cluster", 
#                      col_types = cols(real_cluster = col_factor()))) %>%
#   mutate(real_cluster = factor(real_cluster, levels = 1:16))
# 
# dim256c <- dim256 %>% 
#   bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/dim256-pa.txt", skip = 5, 
#                      col_names = "real_cluster", 
#                      col_types = cols(real_cluster = col_factor()))) %>%
#   mutate(real_cluster = factor(real_cluster, levels = 1:16))
# 
# dim512c <- dim512 %>% 
#   bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/dim512-pa.txt", skip = 5, 
#                      col_names = "real_cluster", 
#                      col_types = cols(real_cluster = col_factor()))) %>%
#   mutate(real_cluster = factor(real_cluster, levels = 1:16))
# 
# dim1024c <- dim1024 %>% 
#   bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/dim1024-pa.txt", skip = 5, 
#                      col_names = "real_cluster", 
#                      col_types = cols(real_cluster = col_factor()))) %>%
#   mutate(real_cluster = factor(real_cluster, levels = 1:16))
# 
# save(dim064, dim064c, file = "experiments/01_datasets/downloaded_data/objects/dim064.RData")
# save(dim128, dim128c, file = "experiments/01_datasets/downloaded_data/objects/dim128.RData")
# save(dim256, dim256c, file = "experiments/01_datasets/downloaded_data/objects/dim256.RData")
# save(dim512, dim512c, file = "experiments/01_datasets/downloaded_data/objects/dim512.RData")
# save(dim1024, dim1024c, file = "experiments/01_datasets/downloaded_data/objects/dim1024.RData")
# 
# unbalance <- read.table("experiments/01_datasets/downloaded_data/files/unbalance.txt")
# unbalancec <- unbalance %>% 
#   bind_cols(read_csv("experiments/01_datasets/downloaded_data/files/unbalance-gt.txt", skip = 4, 
#                      col_names = "real_cluster", 
#                      col_types = cols(real_cluster = col_factor()))) %>%
#   mutate(real_cluster = factor(real_cluster, levels = 1:8))
# save(unbalance, unbalancec, file = "experiments/01_datasets/downloaded_data/objects/unbalance.RData")

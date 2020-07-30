library(consensus)
set.seed(123)
data_example <- tibble(x = sample(1:4, 10, replace = TRUE),
                       y = sample(1:3, 10, replace = TRUE),
                       color = 1) %>% bind_rows(
                
                tibble(x = sample(1:4, 10, replace = TRUE),
                       y = sample(5:8, 10, replace = TRUE),
                       color = 2)       
                       ) %>% bind_rows(
                
                tibble(x = sample(6:10, 10, replace = TRUE),
                       y = sample(1:8, 10, replace = TRUE),
                       color = 3)           
                       )


ggplot(data_example, aes(x, y, color = color)) + 
  geom_point(size = 5)

set.seed(2020)
kmeans(data_example, center = 3)
set.seed(2020)
res <- NbClust(data_example[,-3], method = "kmeans")
# usar hartigan


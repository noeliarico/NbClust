for(d in datasets) {
  for(m in methods_NbCLust) {
    i <- 1
    r <- results[[i]]$Best.nc[1,] %>% # named vector with the best ks
      as.data.frame() %>% # vector to dataframe with column . and rownames (indices)
      rownames_to_column() %>% # create column for the indices
      rename(best_k = ".", index = rowname) # rename columns
    r %>% 
      # Create the pairwise combination of all the possible indices
      expand(first_index = index, second_index = index) %>% 
      # Add the best k according to the first index
      left_join(r %>% rename(first_best_k = best_k), 
                by = c("first_index" = "index")) %>%
      # Add the best k according to the second index
      left_join(r %>% rename(second_best_k = best_k), 
                by = c("second_index" = "index")) %>%
      # Compare if they are equal
      mutate(are_equal = first_best_k == second_best_k,
             # Add name of the dataset and the method
             method = m,
             dataset = d)
  }
}

# Bind all the results into a single dataframe compare_best_k
compare_best_k %>% 
  group_by(first_index, second_index) %>% # For each pair of indexes
  summarise(sum(are_equal)) # Count the number of datasets where the indexes have that result


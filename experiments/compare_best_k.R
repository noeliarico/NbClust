i <- 0 # index for the list results
compare_best_k <- vector(mode = "list", length = length(results))
for(d in datasets) {
  for(m in methods_NbCLust) {
    i <- i + 1 # index for the new results
    r <- results[[i]]$Best.nc[1,] %>% # named vector with the best ks
      as.data.frame() %>% # vector to dataframe with column . and rownames (indices)
      rownames_to_column() %>% # create column for the indices
      rename(best_k = ".", index = rowname) # rename columns
    # At this point r is a data.frame of columns -> index   best_k
    # --------------------------------------------> ...     ...
    compare_best_k[[i]] <- r %>% 
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

# At this point i gives the number of total combinations

compare_best_k <- Reduce(bind_rows, compare_best_k) 

# Bind all the results into a single dataframe compare_best_k
compare_best_k %>% 
  filter(first_index != second_index) %>% 
  filter(are_equal) %>%
  group_by(first_index, second_index) %>% # For each pair of indexes
  count() %>% 
  arrange(desc(n)) %>%
  #arrange(n) %>%
  ungroup() %>%
  # Remove duplicated combinations 
  # first_index, second_index
  # A            B
  # B            A
  filter(!duplicated(paste0(pmax(first_index, second_index), pmin(first_index, second_index))))



print(compare_best_k %>% 
  filter(first_index != second_index) %>% 
  filter(are_equal) %>%
  group_by(first_index, second_index, method) %>% # For each pair of indexes
  count() %>% 
  arrange(desc(n)) %>%
  #arrange(n) %>%
  ungroup() %>%
  # Remove duplicated combinations 
  # first_index, second_index
  # A            B
  # B            A
  filter(!duplicated(paste0(pmax(first_index, second_index), pmin(first_index, second_index)))), n = 100)



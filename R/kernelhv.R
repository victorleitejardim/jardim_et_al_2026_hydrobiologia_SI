library(BAT)
kernelhv <- function(site_scores1,  geom) {
  traitdf <- site_scores1 %>% select(PC1:PC3)
  
  commdf <- geom %>%
    select(point, year, sample) %>% 
    mutate(n = 1) %>%
    tidyr::pivot_wider(names_from = sample, values_from = n, values_fill = 0) %>%
    mutate(code = paste(point, year, sep = " ")) %>% 
    select(-point, -year) %>% 
    tibble::column_to_rownames("code")
  
  kerneltrait <- kernel.build(comm = commdf, trait = traitdf, distance = "euclidean")
  
  kerneltrait
}

dfkernel <- function(kerneltrait) {
  df_kernel <- data.table::data.table()
  names <- data.table::data.table()
  for(i in 1:length(kerneltrait@HVList)){
    names_i <- kerneltrait@HVList[[i]]@Name
    df_i <- kerneltrait@HVList[[i]]@RandomPoints %>%
      data.table::as.data.table() %>% 
      mutate(point = stringr::str_sub(names_i, end = -6)) %>%
      mutate(site = stringr::str_sub(names_i, end = -8)) %>%
      mutate(year = stringr::str_sub(names_i, start = -4)) %>%
      mutate(across(where(is.character), as.factor)) %>% 
      rename_with(tolower)
    df_kernel <- rbind(df_kernel, df_i) 
  }
  df_kernel
}

dfscores <- function(kerneltrait) {
  df_scores <- data.frame()
  names <- data.frame()
  for(i in 1:length(kerneltrait@HVList)){
    names_i <- kerneltrait@HVList[[i]]@Name
    df_i <- kerneltrait@HVList[[i]]@Data %>%
      as.data.frame() %>% 
      tibble::rownames_to_column("sp") %>% 
      mutate(point = stringr::str_sub(names_i, end = -6)) %>%
      mutate(site = stringr::str_sub(names_i, end = -8)) %>%
      mutate(year = stringr::str_sub(names_i, start = -4)) %>%
      rename_with(tolower)
    df_scores <- rbind(df_scores, df_i) 
  }
  df_scores
}

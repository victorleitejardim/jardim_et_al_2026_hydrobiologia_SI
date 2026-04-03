require(taxize)

homotax <- function(homoge, fauna) {
  homoge <- homoge %>% 
    add_row(taxon = "Liocarcinus navigator", homogenized_taxon = "Polybius navigator") %>% 
    add_row(taxon = "Liocarcinus corrugatus", homogenized_taxon = "Polybius corrugatus") %>% 
    add_row(taxon = "Liocarcinus pusillus", homogenized_taxon = "Polybius pusillus") %>%
    add_row(taxon = "Polycirrini", homogenized_taxon = "Polycirrus spp.") %>% 
    add_row(taxon = "Polynoidae", homogenized_taxon = "Remove") %>% 
    add_row(taxon = "Euclymeninae", homogenized_taxon = "Euclymene spp.") %>% 
    add_row(taxon = "Hesionidae", homogenized_taxon = "Hesione splendida")
    
  
  fauna <- fauna %>% 
    mutate(across(everything(), as.character))
  to_change <- homoge %>% 
    filter(homogenized_taxon != "Remove")
  
  # taxons to remove
  to_remove <- homoge %>% 
    filter(homogenized_taxon == "Remove")
  
  not.found <- NULL
  changed <- NULL
  
  for (i in 1:nrow(to_change)){
    # Check if the sp to be homogenized can be found
    if(to_change$taxon[i] %in% unique(fauna$sp)){
      # We change the ones found in the initial database
      fauna$sp[fauna$sp==to_change$taxon[i]] <- as.character(to_change$homogenized_taxon[i])
      changed <- c(changed,as.character(to_change$taxon[i])) 
    }else{
      # Warning message for sp to be changed that are not found in the dataset
      warning(paste("Caution, species", to_change$taxon[i],"not found"))
      # We save the sp not found
      not.found <- c(not.found,as.character(to_change$taxon[i]))
    }
  }
  
  
  prev_changed <- NULL
  for (i in 1:nrow(to_change)){
    if(to_change$homogenized_taxon[i] %in% unique(fauna$sp)){
      prev_changed <- c(prev_changed,as.character(to_change$homogenized_taxon[i])) 
    }
  }
  
  deleted <- NULL
  
  for (i in 1:nrow(to_remove)){
          if(to_remove$taxon[i] %in% unique(fauna$sp)){
            # On change l'espèce là ou on veut
            fauna <- fauna[-which(fauna$sp==to_remove$taxon[i]),]
            deleted <- c(deleted,as.character(to_remove$taxon[i])) 
          }else{
            # Si on ne trouve pas l'espèce dans la liste, on préviens qu'on ne l'a pas trouver
            warning(paste("Caution, sp", to_remove$taxon[i],"not found"))
            # On enregistre son nom
            not.found <- c(not.found,as.character(to_remove$taxon[i]))
          }
  }
  res <- list(changed = changed, deleted = deleted, not_found = not.found, prev_changed = prev_changed, fauna = fauna)
  return(res)
}

worms_id <- function(fauna_homo) {
  species_name <- unique(fauna_homo$sp)
  
  # Transform taxa's names so that worms can find it
  species_name <- str_replace(species_name, " sp\\.","")
  species_name <- str_replace(species_name, " spp\\.","")
  species_name <- str_replace(species_name, " cf\\. "," ")
  
  # We check the names in worms using the taxize package. Check option accepted = TRUE for only accepted scientific names, and ask = TRUE for when ambiguities are found.
  
  worms_id <- taxize::get_wormsid(species_name, searchtype = "scientific", accepted=TRUE, ask= TRUE,verbose=TRUE)
  
  # Let's save the ID's with the species' names
  species_id <- data.frame(species=species_name,worms_id=as.numeric(worms_id)) %>%
    mutate(worms_id = ifelse(species == "Grania", 137349, worms_id))
  species_id
}

worms_classif <- function(species_id, fauna) {
  class(species_id$worms_id) <- "wormsid"
  
  
  # Classification extraction
  classif <- taxize::classification(species_id$worms_id)
  
  # Transform it from list to dataframe
  classif <- as.list(classif)
  
  tmp <- plyr::ldply(classif, dplyr::as_tibble) 
  
  tmp <- tmp %>% select(1:3)
  
  colnames(tmp) <- c("worms_id","name","rank")
  
  
  # Spread the dataframe to have the different taxonomic levels as columns
  tmp <- reshape(tmp,idvar = "worms_id",v.names="name",timevar="rank",direction="wide")
  names(tmp) <- stringr::str_replace(names(tmp),"name.","")
  
  # Check for duplicated IDs in order to find possible identification problems
  plyr::ldply(classif, dplyr::as_tibble) %>% group_by(rank) %>% filter(duplicated(.id,rank)) %>% as.data.frame
  
  # Merge it with our species list
  class(species_id$worms_id) <- "character"
  
  sp_classif <- tmp %>% 
    # Taxonomic level selection 
    select(worms_id, Kingdom, Phylum, Class, Order, Family, Genus, Species) %>%
    # merge with our species list 
    full_join(species_id,.,by="worms_id") %>% 
    mutate(species_init=unique(fauna$sp)) %>% 
    # Get the original names
    mutate_if(is.character,as.factor)
  
  # Check for duplicates
  print(sp_classif %>% filter(duplicated(worms_id)))
  
  # Vérification des taxons pour lesquels on a pas de nom d'espèces associé dans WORMS
  print(sp_classif %>% filter(is.na(Species)) %>% arrange(species_init) %>% distinct(species_init))
  
  sp_classif <- sp_classif %>%
    select(worms_id:species_init)
  sp_classif
}

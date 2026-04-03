fill_traits <- function(traitsdf) {
  rv <- traitsdf %>%
    filter(sp == "Pista spp.") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Pista", rv[[cur_column()]]))) 
  
  rv <- traitsdf %>%
    filter(sp == "Polycirrus spp.") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Polycirrus", rv[[cur_column()]]))) 
  
  rv <- traitsdf %>%
    filter(sp == "Aponuphis bilineata") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Aponuphis", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Euchone rubrocincta") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Euchone", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Polydora spp.") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Polydora", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Eupolymnia nebulosa") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Eupolymnia", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Streptodonta pterochaeta") %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Streptodonta", rv[[cur_column()]])))
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Eupolymnia", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Paraonidae spp.") %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Cirrophorus nikebianchii", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Trichobranchus glacialis") %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Octobranchus lingulatus", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Myrianida spp.") %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Amblyosyllis spectabilis", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Nicolea venustula") %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Lysilla loveni", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Sabellidae spp.") %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Perkinsiana rubra", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Harmothoe spp.") %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Polynoe sp.", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Serpula vermicularis") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Serpula concharum", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Ampharete spp.") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Ampharete oculicirrata", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Caulleriella bioculata") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Caulleriella viridis", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Eurysyllis tuberculata") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Eurysyllis mercuryi", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Streblosoma bairdi") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Streblosoma intestinale", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Bispira volutacornis") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., genus == "Bispira", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Acromegalomma spp.") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Acromegalomma pseudogesae", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Sphaerodoridae spp.") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Sphaerodorum abyssorum", rv[[cur_column()]])))
  
  rv <- traitsdf %>%
    filter(sp == "Sphaerodoridae spp.") %>%
    slice(1) %>%
    select(size_inf2:long_life_span)
  
  traitsdf <- traitsdf %>% mutate(across(size_inf2:long_life_span, ~ replace(., sp == "Sphaerodorum cantonei", rv[[cur_column()]])))
  
  traitsdf
}



library(targets)
library(tarchetypes)
library(crew)
library(qs)
library(patchwork)
library(dplyr)
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# Set target-specific options such as packages:
tar_option_set(
  # format = "qs",
  packages = c(
    "dplyr",
    "tidyr",
    "ggplot2",
    "ggvegan",
    "vegan",
    "knitr",
    "geomorph", #3D
    "Morpho", #3D
    "Rvcg", #3D
    "ggrepel",
    "patchwork",
    "stringr",
    "BAT",
    "hypervolume"),
  controller = crew_controller_local(workers = 3,
                                     seconds_idle = 5,
                                     garbage_collection = TRUE,
                                     tasks_max = 1),
  workspace_on_error = TRUE,
  error = "null",
  memory = "transient",
  garbage_collection = TRUE
  # resources = tar_resources(qs = tar_resources_qs(preset = "fast"))
  )

file.sources <- list.files(
  here::here("R"),
  pattern = "*.R$",
  full.names = TRUE,
  ignore.case = TRUE
)
sapply(file.sources, source, .GlobalEnv)
#------- All the following commented code refers to the analysis of 3D meshes which cannot be uploaded to github due to the large file size -------



# ply.files <- list.files(
#   here::here("data", "fixmeshfull"),
#   pattern = "*.ply$",
#   full.names = TRUE,
#   ignore.case = TRUE
# )
# 
# ply.files <- data.frame(path = ply.files, names = stringr::str_sub(ply.files, start= -12, end = -5))


#----mapped----
# mapped <- tar_map(
#   values = ply.files,
#   names = "names",
#   tar_target(plymod, ply2mesh(path, readcol = TRUE)),
#   tar_target(cleanmod, cleanmesh(plymod)),
#   tar_target(geometric, geovcg(cleanmod))
# )
#----complexity 3d----
# list(mapped,
#      tar_combine(combined_geometric, 
#                   mapped[["geometric"]],
#                   command = list(!!!.x)),
#      tar_target(geom, Reduce(rbind, combined_geometric) %>% 
#                mutate(sample = stringr::str_split_i(names(combined_geometric), pattern = "_", 2)) %>% 
#                mutate(site = stringr::str_sub(sample, start = 1L, end = 3L)) %>% 
#                mutate(site = recode(site,
#                                     "MBE" = "Belle-Ile",
#                                     "MCM" = "Camaret",
#                                     "MME" = "Meaban",
#                                     "MRZ" = "Rozegat",
#                                     "MPP" = "Saint-Brieuc",
#                                     "MGL" = "Glenan",
#                                     "MBK" = "Keraliou",
#                                     "MMO" = "Molene",
#                                     "MTR" = "Trevignon",
#                                     "MMX" = "Morlaix"
#                                     )
#                ) %>% 
#                mutate(point = stringr::str_sub(sample, start = 4L, end = 4L)) %>% 
#                mutate(point = paste(.$site, .$point, sep = " ")) %>%
#                mutate(year = stringr::str_sub(sample, start = -2, end = -1)) %>% 
#                 mutate(year = paste("20", .$year, sep = "")) %>% 
#                mutate(rsv = surf/vol) %>% 
#                mutate(l = pmax(dx, dy, dz)) %>% 
#                mutate(i = apply(.[3:5], 1, function(x) rev(sort(x))[2])) %>% 
#                mutate(s = pmin(dx, dy, dz)) %>%
#                  mutate(sphe = ((s^2)/(l*i))^(1/3)) %>%
#                mutate(compact = ((pi^(1/3))*((6*vol)^(2/3)))/surf) %>%
#                  mutate(dr1 = s/l) %>%
#                  mutate(dr2 = ((l-i)/(l-s))) %>%
#                  mutate(dr3 = i/l) %>% 
#                mutate_if(is.character, as.factor) %>% 
#                select(site, point, sample, everything())),
#   tar_target(samples, geom %>% 
#                distinct(site, point, sample, year) %>%
#                group_by(site, point, year) %>%
#                summarise(count = n()) %>%
#                ungroup() %>%
#                mutate(state = factor(case_when(count==12 ~ "Good", count < 12 ~ "Sample(s) missing", count > 12 ~ "Too many samples")))),
#   tar_target(sampleplot, ggplot(samples,
#                                 aes(x=year,y=point,fill=state)) +
#                geom_tile(alpha=0.5) +
#                scale_fill_manual(values=c("palegreen3","lightblue", "indianred")) +
#                geom_text(aes(label=count)) +
#                theme(text=element_text(size =15), axis.text.x = element_text(angle = 90, size = 15), legend.position = "bottom")),

#----pca 3d----
  list(tar_target(geomfile, here::here("data", "macrofauna_maerl.RData"), format = "file"),
       tar_target(geom, load.data(geomfile)),
       tar_target(pca3d, vegan::rda(geom %>% select(sample, 
                                               surf,
                                               vol,
                                               l,
                                               # i,
                                               # s,
                                               # dr1,
                                               # dr2,
                                               # dr3,
                                               # fd,
                                               sphe,
                                               compact,
                                               convexity,
                                               rsv) %>%
                                 mutate(surf = log(surf),
                                        vol = log(vol),
                                        l = log(l)) %>% 
                                 tibble::column_to_rownames("sample"),
                               scale = TRUE)),
  tar_target(metadata, geom %>%
               select(site, point, sample, year) %>%
               tibble::column_to_rownames("sample")),
  tar_target(site_scores1, as.data.frame(vegan::scores(pca3d, scaling = 1, display="sites", choices = c(1:3))) %>% cbind(metadata)),
  tar_target(site_scores2, as.data.frame(vegan::scores(pca3d, scaling = 2, display="sites", choices = c(1:3))) %>% cbind(metadata)),
  tar_target(sp_scores2, as.data.frame(vegan::scores(pca3d, scaling = 2, display = "species", choices = c(1:3)))),
  tar_target(sp_scores1, as.data.frame(vegan::scores(pca3d, scaling = 1, display = "species", choices = c(1:3)))),
  tar_target(var_axes, round(pca3d$CA$eig/sum(pca3d$CA$eig)*100,2)),
  tar_target(sitesplot, ggplot()+
               ggpubr::stat_chull(data = site_scores1,
                            mapping = aes(x = PC1,
                                          y = PC2,
                                          fill = site,
                                          colour = site),
                            geom="polygon",
                            alpha=0.1,
                            linetype = 2,
                            linewidth = .75)+
               geom_point(data = site_scores1,
                          mapping = aes(x = PC1,
                                        y = PC2,
                                        colour = site,
                                        shape = year),
                          alpha = .7,
                          size = 1.5)+
               scale_colour_manual(values = pal)+
               scale_fill_manual(values = pal)+
               theme_light()+
               theme(aspect.ratio = 1)+
               xlab(paste(names(var_axes)[1],": ",var_axes[1],"%"))+
               ylab(paste(names(var_axes)[2],": ",var_axes[2],"%"))
             ),
  tar_target(speciesplot, ggplot()+
               geom_point(data = site_scores2,
                          mapping = aes(x = PC1,
                                        y = PC2,
                                        colour = site,
                                        shape = year),
                          alpha = .7,
                          size = 1.5)+
               geom_segment(data = sp_scores2,
                            aes(x = 0, y = 0,
                                xend = PC1,
                                yend = PC2),
                            colour="black")+
               geom_text_repel(data=sp_scores2, aes(x = PC1,
                                                   y= PC2,
                                                   label = rownames(sp_scores2)),
                               fontface="bold",
                               colour="black",
                               segment.colour="black")+
               scale_colour_manual(values = pal)+
               scale_fill_manual(values = pal)+
               theme_light()+
               theme(aspect.ratio = 1)+
               xlab(paste(names(var_axes)[1],": ",var_axes[1],"%"))+
               ylab(paste(names(var_axes)[2],": ",var_axes[2],"%"))
  ),
  tar_target(pcabiplot, sitesplot + theme(legend.position = "none") + speciesplot + plot_layout(guides = "collect", axes = "collect")),
#----geo mFD----
  tar_target(geomcomm, geom %>%
             select(point,
                    year,
                    sample) %>% 
             mutate(n = 1) %>%
             tidyr::pivot_wider(names_from = sample,
                                values_from = n,
                                values_fill = 0) %>%
             mutate(code = paste(point,
                                 year,
                                 sep = " ")) %>% 
             select(-point,
                    -year) %>% 
             tibble::column_to_rownames("code")),
  tar_target(geomfdalpha,
         mFD::alpha.fd.multidim(sp_faxes_coord = as.matrix(site_scores1 %>%
                                                             select(PC1:PC3)),
                                asb_sp_w = as.matrix(geomcomm))),
#----fauna----
  tar_target(faunafile, here::here("data", "macrofauna_maerl.RData"), format = "file"),
  tar_target(homogefile, here::here("data", "homoge_07_06_24.RData"), format = "file"),
  tar_target(homoge, load.data(homogefile)),
  tar_target(rawfauna, load.data(faunafile)),
  tar_target(faunafull, rawfauna %>%
               mutate(across(.cols = everything(),
                             ~str_replace(., "-i", "-I"))) %>% 
               rename(n = results) %>% 
               mutate(replicate = stringr::str_sub(collections, start = -1, end = -1)) %>% 
               select(point, site, replicate, year, season, sp, n) %>%
               mutate(replicate = as.numeric(replicate)) %>% 
               filter(replicate <= 3) %>%
               mutate_if(is.character, as.factor) %>% 
               droplevels()),
  tar_target(fauna, homotax(homoge, faunafull)[["fauna"]]),
  tar_target(wormsid, worms_id(fauna)),
  tar_target(class, worms_classif(wormsid, fauna) %>%
               rename_with(tolower) %>%
               rename(sp = species_init) %>%
               filter(class == "Polychaeta")
               ),
  tar_target(poly, fauna %>% 
             left_join(class) %>%
             filter(class == "Polychaeta")),
  tar_target(polysamples, poly %>% 
             distinct(site, year, point, replicate) %>%
             group_by(site, year, point) %>%
             summarise(count = n()) %>%
             ungroup() %>%
             mutate(state = factor(case_when(count==3 ~ "Good", count < 3 ~ "Sample(s) missing", count > 3 ~ "Too many samples")))),
  tar_target(psamplesplot, 
             ggplot(polysamples,
                                  aes(x=year,y=point,fill=state)) +
               geom_tile(alpha=0.5) +
               scale_fill_manual(values=c("palegreen3","lightblue", "indianred")) +
               geom_text(aes(label=count)) +
               theme(text=element_text(size =15), axis.text.x = element_text(angle = 90, size = 15), legend.position = "bottom")),
  tar_target(traitsdf, read.csv2(here::here("data", "trait.mat.11.22.csv"))),
  tar_target(traits, traitsdf %>%
             rename_with(tolower) %>%
             rename(sp = species_init) %>% 
             mutate(worms_id = as.factor(worms_id)) %>% 
             select(-worms_id:-species) %>% 
             mutate(across(everything(), stringi::stri_trim_both))),
  tar_target(polytraits,
             fill_traits(class %>%
                           left_join(traits))),
  tar_target(polydens, poly %>% 
               mutate(n = as.numeric(n)) %>% 
               group_by(point, site,year,season,sp) %>% 
               summarise(n = sum(n)) %>% 
               ungroup() %>% 
               pivot_wider(names_from = sp,
                           values_from = n,
                           values_fill = 0) %>% 
               mutate(across(where(is.numeric),
                             ~./(polysamples$count*0.3))) %>%
               mutate(code = paste(.$point, .$year)) %>% 
               tibble::column_to_rownames("code")),
  
#----traits----
  tar_target(ptraits, polytraits %>% 
               tibble::column_to_rownames("sp") %>%
               select(-worms_id:-species, 
                      -bioturb_r, #remove uninformative category
                      -hermaphrodite,
                      -gonochoric,
                      -ends_with("span"), #remove life_span trait
                      -starts_with("dev"), #remove development mode 
                      -ends_with("parous")) %>% #remove reprod mode
               mutate(across(everything(), as.numeric))),
  tar_target(gdis, gawdis::gawdis(ptraits,
                                  w.type = "equal",
                                  groups = c(
                                    rep(1, 7), #max size
                                    rep(2, 8), #feeding method
                                    rep(3, 2), #food size
                                    rep(4, 2), #sediment position
                                    rep(5, 5), #living habit
                                    rep(6, 4), #daily movement capacity
                                    rep(7, 5) #bioturbation
                                    # rep(8, 2), #sexual differentiation
                                    # rep(9, 4), #develop mode
                                    # rep(10,2) #reprod frequency
                                    # rep(11,3), #life span
                                  ),
                                  fuzzy = c(1:11))),
  tar_target(pdens, polydens %>%
               select(-point:-season) %>% 
               filter(specnumber(.)>6)),
  tar_target(qfsp, mFD::quality.fspaces(sp_dist = gdis,
                                        fdendro = "average",
                                        maxdim_pcoa = 10,
                                        deviation_weighting = c("absolute"),
                                        fdist_scaling = FALSE)),
  tar_target(fdalpha, mFD::alpha.fd.multidim(sp_faxes_coord = as.matrix(qfsp$details_fspaces$sp_pc_coord),
                                                 asb_sp_w = as.matrix(pdens))),
#----environnement----
  tar_target(envfile, here::here("data", "env.RData"), format = "file"),
  tar_target(envload, load.data(envfile)),
  tar_target(mgranfile, here::here("data", "mgran.RData"), format = "file"),
  tar_target(mgran, load.data(mgranfile)),
  tar_target(granulofile, here::here("data", "granulo_12_06_24.RData"), format = "file"),
  tar_target(granuload, load.data(granulofile)),
  tar_target(granulo, granuload %>%
               select(code, mud, sand, gravel, si)),
  tar_target(env, envload %>% 
               mutate(year = as.factor(stringr::str_sub(date,1,4))) %>% 
               mutate(site = as.factor(stringr::str_sub(point,end = -3))) %>% 
               # mutate(across(where(is.character), as.factor),
               #        across(starts_with("fp"), log10),
               #        across(starts_with("cur"), log10)) %>%
               mutate(code = paste(.$point, .$year, sep = " ")) %>%
               left_join(granulo) %>% 
               left_join(mgran) %>%
               tibble::column_to_rownames("code")),
#----pallette---
  tar_target(pal, c("#4477AA", "#8ECDDE", "#44AA99", "#858c64", "#e8bb5a",  "#EE8866", "#d44e65", "#FFAABB", "#7b538c", "#80898f" ))
)

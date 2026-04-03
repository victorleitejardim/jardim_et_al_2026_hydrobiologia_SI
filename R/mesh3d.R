require(Morpho)
require(Rvcg)

#' read.ply
#' read all ply files in a folder as 3dmesh objects in R and get the sample names
#'
#' @param ply.source 
#'
#' @return 
#' @export
read.ply <- function(ply.source){
  plymod <- sapply(ply.source, FUN =ply2mesh, readcol = TRUE, USE.NAMES = TRUE, simplify = FALSE)
  names(plymod) <- stringr::str_sub(names(plymod), start= -12, end = -5)
  # save(plymod, file = here::here("modnames.RData"))
  plymod
}

cleanmesh <- function(plymod){
    newmod <- vcgIsotropicRemeshing(plymod, TargetLen = .1)
    newmod <- vcgClean(newmod, sel = 0:7, iterate = TRUE)
    
  newmod
}

geovcg <- function(plymod){
  geometric <- data.frame(
                                 surf = vcgArea(plymod),
                                 vol = vcgVolume(plymod),
                                 dx = abs(max(plymod$vb[1,]) - min(plymod$vb[1,])),
                                 dy = abs(max(plymod$vb[2,]) - min(plymod$vb[2,])),
                                 dz = abs(max(plymod$vb[3,]) - min(plymod$vb[3,])),
                                 convexity = habtools::convexity(plymod),
                                 packing = habtools::packing(plymod)
                                 )
  geometric
}

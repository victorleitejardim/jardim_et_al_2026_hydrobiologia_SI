box.cox.chord <- 
  function(mat, 
           bc.exp=0){ 
    # Internal function
    vec.norm <- function(vec) sqrt(sum(vec^2))
    #
    chck <- apply(mat, 1, sum)
    if(any(chck == 0)) stop("Rows",which(chck==0)," of the data matrix sum to 0")
    #
    # Apply the user-selected Box-Cox exponent (bc.exp) to the frequency data
    if(bc.exp==0) {
      tmp <- log(mat+1)
    } else { 
      tmp <- mat^bc.exp 
    }
    row.norms <- apply(tmp, 1, vec.norm)
    #
    # Apply the chord transformation to matrix "tmp" before returning it
    res <- sweep(tmp, 1, row.norms, "/")
  }
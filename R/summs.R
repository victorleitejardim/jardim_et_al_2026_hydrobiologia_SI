summs <- function(list_lm, names = NULL) {
  summ_df <- c("")
  hux <- huxtable::huxreg(list_lm,
                          statistics = c(
                            N = "nobs",
                            DF = "df.residual",
                            AIC = "AIC",
                            BIC = "BIC",
                            R2 = "r.squared",
                            `Adjusted\\\\R2` = "adj.r.squared",
                            `F` = "statistic",
                            `p-value` = "p.value"
                          ),
                          stars = NULL,
                          bold_signif = .05,
                          error_pos = "below")
  hux_df <- as.data.frame(hux)[-1,] %>% 
    mutate(across(.cols = -names, .fns = ~str_remove_all(.x, pattern = "\\(|\\)"))) %>% 
    mutate(across(.cols = -names, .fns = ~round(as.numeric(.x), 2) )) %>% 
    mutate(names = str_replace(names, "_", "--"),
           names = paste("\\makecell{", names, "}", sep = ""))
  for (i in 1:length(list_lm)) {
    call <- str_remove_all(string = deparse1(list_lm[[i]]$call, width.cutoff = 20), pattern = "lm\\(formula = |glm\\(formula = |, data = semtable\\)|data = semtable\\)")
    call <- str_replace(string = call, pattern = "\\),", replacement = "\\)")
    summ_df <- c(summ_df, call)
    summ_df
  } 
  hux_df[is.na(hux_df)] <- ""
  if (is.null(names)){
    colnames(hux_df) <- summ_df
  }else{
    colnames(hux_df) <- names
  }
  
  kable(hux_df, row.names = FALSE, escape = FALSE)
}


#' @author Victor Leite Jardim
#' 
#' @date 2026/04/03

## Install Dependencies (listed in DESCRIPTION) ----
remotes::install_deps(upgrade = "never")

## Run Project ----
targets::tar_make()
quarto::quarto_render(input = "A_trait_diversity.qmd", output_file = "A_trait_diversity.pdf")
quarto::quarto_render(input = "B_habitat_complexity.qmd", output_file = "B_habitat_complexity.pdf")
quarto::quarto_render(input = "C_hydrosedimentary_stress.qmd", output_file = "C_hydrosedimentary_stress.pdf")
quarto::quarto_render(input = "D_SEM.qmd", output_file = "D_SEM.pdf")
quarto::quarto_render(input = "E_multivariate_regression_tree.qmd", output_file = "E_multivariate_regression_tree.pdf")
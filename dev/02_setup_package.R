# Dev tools
renv::install(c(
  'devtools',
  'git2r',
  'knitr',
  'remotes',
  'roxygen2',
  'pacman',
  'styler',
  'testthat',
  'usethis'
))
# Package dependencies
renv::install(c(
  'arrow',
  'dplyr',
  'drake',
  'rlang',
  'readr',
  'readxl',
  'reticulate',
  'tibble',
  'tidyr'
))

local({
  # Create base package information
  root_dir <- base::getwd()
  base::setwd('..')
  usethis::create_package('locus', open = FALSE)
  base::setwd(root_dir)

  # Use {magrittr} %>% pipe
  devtools::document()
  usethis::use_pipe()
  devtools::document()

  # Edit description
  usethis::use_description(fields = list(
    `Authors@R` = 'person("Brian", "Vancil", email = "brian@vancil.name", role = c("aut", "cre"), comment = c(ORCID = "https://orcid.org/0000-0003-1145-3681"))',
    `Title` = "Location-based Datasets for the U.S.",
    `Description` = "Location-based datasets for the U.S. related to population, quality of life, social determinants of health, and climate susceptibility"
  ))

  # Set license
  usethis::use_gpl3_license(name = "Brian Vancil")

  # Lifecycle badge
  usethis::use_lifecycle_badge(stage = 'Experimental')

  # Documentation
  usethis::use_package_doc()

  # Use packages
  usethis::use_package('arrow')
  usethis::use_package('dplyr')
  usethis::use_package('drake')
  usethis::use_package('readr')
  usethis::use_package('readxl')
  usethis::use_package('reticulate')
  usethis::use_package('rlang')
  usethis::use_package('tibble')
  usethis::use_package('tidyr')

  # Commit initial package setup
  devtools::document()
  git2r::add(path = '*')
  git2r::commit(message = 'initial package setup')

  # Setup packages used by this package
  usethis::use_tidy_style(strict = TRUE)

  # Add tests
  usethis::use_testthat()
  usethis::edit_file('tests/testthat/test_locus.R')
  devtools::test()

  # Commit tests
  devtools::document()
  git2r::add(path = '*')
  git2r::commit(message = 'added trivial test')

  # Add data directory
  usethis::use_data_raw()
})



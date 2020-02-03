if (!base::file.exists('renv.lock')) {
  if (!base::require('renv')) utils::install.packages('renv')
  renv::init()
}

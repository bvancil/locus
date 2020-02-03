# This gets around a bug in {remotes}.
cat('if (base::file.exists("renv/activate.R")) {
  base::source("renv/activate.R")
}
', file = '.Rprofile')

# Use this version if you have launched RStudio with your
# system Python in the path.
# TODO: Make it actually work.

library('reticulate')

# Print out configuration before we configure things.
# This should point to your system python.
reticulate::py_config()

# Just run RStudio as normally (not with the `./dev/rstudio.sh` script)
if (base::system('python -m pipenv --venv', intern = FALSE) > 0L) {
  # No virtual env has been set up yet
  base::system('python -m pipenv --python 3.7')
  base::system('python -m pipenv install --dev')
} else {
  base::message('Using existing pipenv virtual environment')
}

venv_list <- reticulate::virtualenv_list()
print(venv_list)
venv_name <- venv_list[base::grep('^locus-', venv_list)]

python_path <- base::system('python -m pipenv --py', intern = TRUE)
# Neither option for `required` actually sets Python to the virtual environment.
reticulate::use_python(python_path, required = TRUE)

# The option `required = TRUE` checks that this is a virtualenv, which always fails because it looks for the wrong files.
venv_path <- base::system('python -m pipenv --venv', intern = TRUE)
# reticulate::use_virtualenv(venv_path, required = TRUE)
reticulate::use_virtualenv(venv_name, required = TRUE)


reticulate::py_config()

# Following https://developers.arcgis.com/labs/python/download-data/


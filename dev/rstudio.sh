PROJECT=locus.Rproj
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    COMMAND="RStudio"
elif [[ "$OSTYPE" == "darwin" ]]; then
    COMMAND="open"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    COMMAND="start"
elif [[ "$OSTYPE" == "msys" ]]; then
    COMMAND="start"
elif [[ "$OSTYPE" == "win32" ]]; then
    # Unknown
    COMMAND="ls"
elif [[ "$OSTYPE" == "freebsd" ]]; then
    # Unknown
    COMMAND="ls"
else
    # Unknown
    COMMAND="ls"
fi
echo Running: pipenv run $COMMAND $PROJECT
pipenv run $COMMAND $PROJECT

#!/bin/sh
  
  ls /dot-cli
  #proof that we can access the repo from within the script
  cat /github/workspace/README.md
  
  echo "$@";  # will echo all args
  shift;  # will remove first arg from the "$@"
  echo "$@";  # will echo all args except first one

  var=$(bash /dot-cli/run-java.sh "$@" )  
  echo "var: $var"
  echo "exit code: $?"

  cat "${QUARKUS_LOG_FILE_PATH}"

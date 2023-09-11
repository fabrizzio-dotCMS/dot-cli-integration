#!/bin/sh
  #bash "./dot-cli/run-java.sh" "$@"

  ls /dot-cli
  
  var=$(bash /dot-cli/run-java.sh "$@" )
  echo "var: $var"
  echo "exit code: $?"

  cat /github/workspace/README.md

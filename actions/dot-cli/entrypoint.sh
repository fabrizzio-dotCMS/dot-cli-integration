#!/bin/sh
  #bash "./dot-cli/run-java.sh" "$@"
  var=$(bash ./dot-cli/run-java.sh "$@" )
  echo "var: $var"
  echo "exit code: $?"
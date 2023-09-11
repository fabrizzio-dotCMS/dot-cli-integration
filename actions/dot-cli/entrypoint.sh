#!/bin/sh
  
  ls /dot-cli

  echo "Proof that we can access the repo from within the script."
  cat /github/workspace/README.md
  

  #tkn="$1"
  #echo "Safe pass is :: $tkn"  

  #Replace the safe-pass with the value passed in the docker workflow action
  #sed -i -e  "s/plchldr/$tkn/g" "${DOT_SERVICES_HOME}dot-service.yml"

  #echo "$@";  # will echo all args
  #shift;  # will remove first arg from the "$@"
  #echo "$@";  # will echo all args except first one

  var=$(bash /dot-cli/run-java.sh "$@" )  
  echo "var: $var"
  echo "exit code: $?"

  cat "${QUARKUS_LOG_FILE_PATH}"

  echo "Repository after cli run ::: " 

  ls /github/workspace/contents/

  echo $GITHUB_WORKSPACE

  echo ":::::::" 

  ls /home/runner/work/_temp/_github_home

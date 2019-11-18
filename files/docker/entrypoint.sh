#!/bin/bash

source /docker/tools.sh

log_path="/var/log/docker"
mkdir -p $log_path
log_file="$log_path/entrypoint.log"


function run_d(){
  local folder="/docker/entrypoint.d"
  for file in $(2>/dev/null ls $folder/*.{sh,py}); do
    echo2 "[ENTRYPOINT] $file starts"
    $file
    echo2 "[ENTRYPOINT] $file ends"
  done
}

function main() {
  echo2 "[ENTRYPOINT] starts with:$@"

  run_d

  echo2 "[ENTRYPOINT] ends"

  [[ "$KEEP_RUNNING" == "1" ]] \
  && echo2 "KEEP_RUNNING " && tail -f /dev/null \
  || echo2 "Please set env KEEP_RUNNING=1 if you wanna keep running."
}

main $@ >> $log_file

#!/bin/bash

source /docker/tools.sh

function main(){

  local folder="/docker/run-once.d"
  for file in $(2>/dev/null ls $folder/*.{sh,py}); do
    local run_log=$file".log"

    [[ ! -f $run_log ]] && $file | tee $run_log 
  done

}


main $@ >> /var/log/docker/run-once.log

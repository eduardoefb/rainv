#!/bin/bash

function start(){
   while :; do
      sleep ${SLEEP_TIME}
      bash -x ${SCRIPT_DIR}/check.sh >> ${SCRIPT_DIR}/update.log 2>>${SCRIPT_DIR}/update.log
   done
}

function stop(){
   p=`ps -ef | grep radb_service.sh | grep -v grep | awk '{print $2}'`
   kill -9 ${p}
   rm -f ${SCRIPT_RUNNING_FILE} 2>/dev/null
   exit 0
}

function usage(){
	cat << EOF
	Usage:
	${0} <starat|stop|restart>
		
EOF
    exit 1
}

export SLEEP_TIME=5
source /opt/nokia/nedata/scripts/var.conf

case ${1} in
   start)
      start&
      sleep 1            
      if [ `ps -ef | grep radb_service.sh | grep -v grep | awk '{print $2}' | wc -l` -gt 0 ]; then
         exit 0
      else
         exit 1
      fi
      
      ;;
      
   stop)
      stop&
      exit 0
      ;;
      
   restart)
      stop && start&
      exit 0
      ;;
               
   *)
      usage
esac



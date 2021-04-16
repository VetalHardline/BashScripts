#!/bin/bash

serviceName="Cool web server"
logFile="/var/log/servak.log"
pidFile="/tmp/servak.pid"

start(){
        [[ -f $pidFile ]] && echo "$serviceName already started!" && exit 2
        echo "Starting webserver :3"
        python3 /servak/webserver.py &>> $logFile &
        echo $! > $pidFile
}

stop(){
        [[ ! -f $pidFile ]] && echo "$serviceName is not started!" && exit 3
        echo "Stopping webserver :3"
        pid=`cat $pidFile`
        kill $pid
        rm -f $pidFile
}

case $1 in
        start|stop) $1;;
        *) echo "Wrong command! Use: start or stop"; exit 1;;
esac

exit 0

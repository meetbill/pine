#!/bin/bash
########################################################################
f_yellow='\033[00;33m'
f_red='\033[00;31m'
f_green='\033[00;32m'
f_reset='\033[00;0m'

function p_warn {
    echo -e "${f_yellow}[WRN]${f_reset} ${1}"
}

function p_err {
    echo -e "${f_red}[ERR]${f_reset} ${1}"
}

function p_ok {
    echo -e "${f_green}[OK ]${f_reset} ${1}"
}

ROOT_PATH=`S=\`readlink "$0"\`; [ -z "$S"  ] && S=$0; dirname $S`
cd ${ROOT_PATH}
########################################################################
mkdir -p ./g_server/{config,run,log}
GUNICORN="python ./gunicorn"
PID=./g_server/run/pine.pid
CONF=./g_server/config/gunicorn.conf
APP="pine.wsgi:application"

if [[ ! -d p_lib  ]]
then
    tar -zxf ./p_lib.tar.gz
fi

function count_proc()
{
    PROC_COUNT=$(ps -ef | grep ${GUNICORN} | grep ${APP} | grep -vc grep)
}


case "$1" in
    start)
        $GUNICORN -c  $CONF $APP -p ${PID} && p_ok "Starting pine" || p_err "Starting  pine"
        ;;
    stop)
        [[ ! -e ${PID} ]] && p_err "pid is not exists"  && exit 1
        kill -15 $(cat ${PID}) && p_ok "Stopping pine" || p_err "Stopping  pine"
        ;;
    force-reload|restart)
        bash ./$0 stop
        bash ./$0 start
        ;;
    status)
        count_proc
        [[ ${PROC_COUNT} -gt 0  ]] && p_ok "Pine is running" || p_warn "Pine is not running"
        ;;
    reload)
        kill -HUP   `cat $PID` && exit 0 || exit $?
        ;;
    *)
        echo "Usage: bash ./run.sh {start|stop|restart|force-reload|status}"
        exit 1
        ;;
esac

exit 0

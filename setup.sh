#!/bin/bash
#########################################################################
# File Name: setup.sh
# Author: meetbill
# mail: meetbill@163.com
# Created Time: 2018-04-06 21:48:02
#########################################################################

########################################################################
f_yellow='\e[00;33m'
f_red='\e[00;31m'
f_green='\e[00;32m'
f_reset='\e[00;0m'

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

[[ -d ./pine_tpl/p_lib ]] && rm -rf ./pine_tpl/p_lib && p_ok "clearning p_lib" || p_err "clearning p_lib"
[[ -d ./pine_tpl/collect_static ]] && rm -rf ./pine_tpl/collect_static && p_ok "clearning collect_static" || p_err "clearning collect_static"
[[ -d ./pine_tpl/g_server/log ]] && rm -rf ./pine_tpl/g_server/log && p_ok "clearning log" || p_err "clearning log"

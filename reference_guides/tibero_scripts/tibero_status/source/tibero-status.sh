#!/bin/bash

####################################################################################
#AUTHOR: Matthew Koziel
#COMPANY: TmaxSoft
#SCRIPT: tibero-status
#DATE: 2020/02/01
#DESCRIPTION: This script allow the user to check the status of Tibero, to double 
#             check that everything is normal
####################################################################################

tbsvr_status=$(ps -ef | grep -w tbsvr | grep -v "color=auto" | grep TVSAM | awk '{print $10}')
#echo ${tbsvr_status}

if [ "${tbsvr_status}" = NORMAL ]
then
    echo "Tibero status: NORMAL"
    echo "Tibero is up and running!"
else
    if [ "${tbsvr_status}" = MOUNT ]
    then
        echo "Tibero status: ${tbsvr_status}"
        echo "Tibero did not boot properly"
    else
        echo "Tibero is down!"
    fi
fi

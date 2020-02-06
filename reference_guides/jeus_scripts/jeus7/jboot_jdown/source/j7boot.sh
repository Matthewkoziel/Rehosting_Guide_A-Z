#!/bin/bash

####################################################################################
#AUTHOR: Clement Deltel
#COMPANY: TmaxSoft
#SCRIPT: j7boot
#DATE: 2019/11/08
#DESCRIPTION: This script's purpose is to boot the Jeus Domain Admin Server
#             as well as the ofminer, ofgw, and ofmanager servers.
####################################################################################

# If you have the following error running this script:
# syntax error near unexpected token `$'{\r''
#
# Run first the command: dos2unix j7boot.sh

####################################################################################
#FUNCTION: start_server
#DESCRIPTION: Checks if the passed server is running using ps and then boot it.
####################################################################################
start_server(){
	server_name="$1"

	# If the server we're checking is nodemanager, we need to use a different command to check
	# that the process is already running or not
	if [ "${server_name}" = "nodemanager" ]
	then
		server_running=$(ps -ef | grep jeus7 | grep nodemanager | wc -l)
	else
		server_running=$(ps -ef | grep domain | grep jeus_domain | grep ${server_name} | wc -l)
	fi

	# Boot process
	if [ "${server_running}" != "1" ]
	then
		echo "
		>> The server ${server_name} is not running, the status is ${server_running}
		"
		if [ "${server_name}" = "adminServer" ]
		then
			# Domain Admin Server boot
			echo "Starting Domain Admin Server: ${server_name}"
			startDomainAdminServer -domain $DOMAIN_NAME -u ${jeus_admin} -p ${jeus_admin_pass}
		elif [ "${server_name}" = "nodemanager" ]
		then
			# Node Manager boot
			echo "Starting Node Manager: ${server_name}"
			echo "Please press the key ENTER after couple seconds to be able to continue"
			nohup startNodeManager > $JEUS_HOME/nodemanager/logs/JeusNodeManager.log &
		else
			# OFGateway, OFManager, OFMiner boot
			echo "Starting Managed Server: ${server_name}"
			startManagedServer -domain $DOMAIN_NAME -server ${server_name} -u ${jeus_admin} -p ${jeus_admin_pass}
		fi
	else
		# In case the server is already running
		echo "Server ${server_name} is already running, skipping boot process"
	fi
}

####################################################################################
#FUNCTION: main
####################################################################################
main(){
	source $JEUS_HOME/scripts/.j7_user_pass
	start_server adminServer
	start_server nodemanager
	start_server ofgw_svr
	start_server ofmgr_svr
	start_server ofminer_svr
	sleep 3
	jps
	echo "All servers booted successfully!"
}
main

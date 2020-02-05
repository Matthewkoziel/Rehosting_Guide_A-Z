#!/bin/bash

####################################################################################
#AUTHOR: Clement Deltel
#COMPANY: TmaxSoft
#SCRIPT: j7down
#DATE: 2019/11/08
#DESCRIPTION: This script's purpose is to shutdown the Jeus Domain Admin Server
#             as well as the ofminer, ofgw, and ofmanager servers.
####################################################################################

# If you have the following error running this script:
# syntax error near unexpected token `$'{\r''
#
# Run first the command: dos2unix j7down.sh

####################################################################################
#FUNCTION: stop_server
#DESCRIPTION: Checks if the passed server is running using ps and then shut it down.
####################################################################################
stop_server(){
	server_name="$1"
	port_number="$2"

	# Retrieve hostname
	HOSTNAME=$(hostname)

	# If the server we're checking is nodemanager, we need to use a different command to check
	# that the process is already running or not
	if [ "${server_name}" = "nodemanager" ]
	then
		server_running=$(ps -ef | grep jeus7 | grep nodemanager | wc -l)
	else
		server_running=$(ps -ef | grep domain | grep jeus_domain | grep ${server_name} | wc -l)
	fi

	# Shutdown process
	if [ "${server_running}" = "1" ]
	then
		echo "
		>> The server ${server_name} is running, the status is ${server_running}
		"
		if [ "${server_name}" = "adminServer" ]
		then
			# Domain Admin Server shutdown
			echo "Shutdown Domain Admin Server: ${server_name}"
			jeusadmin -u ${jeus_admin} -p ${jeus_admin_pass} local-shutdown
			#stopServer -host ${host_dom_admin} -u ${jeus_admin} -p ${jeus_admin_pass}
		elif [ "${server_name}" = "nodemanager" ]
		then
			# Node Manager shutdown
			echo "Shutdown Node Manager: ${server_name}"
			stopNodeManager -host localhost -port ${port_number}
		else
			# OFGateway, OFManager, OFMiner shutdown
			echo "Shutdown Managed Server: ${server_name}"
			stopServer -host "${HOSTNAME}:${port_number}" -u ${jeus_admin} -p ${jeus_admin_pass}
		fi
	else
		# In case the server is already shutdown
		echo "Server ${server_name} is already down, skipping shutdown process"
	fi
}

####################################################################################
#FUNCTION: main
####################################################################################
main(){
	source $JEUS_HOME/scripts/.j7_user_pass
	stop_server ofgw_svr 9746
	stop_server ofmgr_svr 9756
	stop_server ofminer_svr 9766
	# Depending on your configuration, you may comment the following line
	stop_server nodemanager 7730
	stop_server adminServer
	sleep 3
	jps
	echo "All servers shutdown successfully!"
}
main

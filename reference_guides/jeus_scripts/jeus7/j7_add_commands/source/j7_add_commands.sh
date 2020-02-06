#!/bin/bash

####################################################################################
#AUTHOR: Clement Deltel
#COMPANY: TmaxSoft
#SCRIPT: j7_add_commands
#DATE: 2019/11/08
#DESCRIPTION: This script's purpose is to create several scripts to launch JEUS
#             servers with simple commands
####################################################################################

# If you have the following error running this script:
# syntax error near unexpected token `$'{\r''
#
# Run first the command: dos2unix j7_add_commands.sh

# Port usage in this scripts
pn_node_mgr=7730
pn_ofgw_svr=9746
pn_ofmgr_svr=9756
pn_ofminer_svr=9766
# Retrieve hostname
HOSTNAME=$(hostname)

cd ${JEUS_HOME}/scripts

echo "==================================================
DomainAdminServer scripts generation"
echo "source ${JEUS_HOME}/scripts/.j7_user_pass
startDomainAdminServer -domain \${DOMAIN_NAME} -u \${jeus_admin} -p \${jeus_admin_pass}" > dsboot
echo "source ${JEUS_HOME}/scripts/.j7_user_pass
jeusadmin -u \${jeus_admin} -p \${jeus_admin_pass} local-shutdown" > dsdown
echo "Done! Now you can use dsboot and dsdown commands.
=================================================="

echo "NodeManager scripts generation"
echo "nohup startNodeManager > ${JEUS_HOME}/nodemanager/logs/JeusNodeManager.log &" > nmboot
echo "stopNodeManager -host localhost -port ${pn_node_mgr}" > nmdown
echo "Done! Now you can use nmboot and nmdown commands.
=================================================="

echo "OFGateway scripts generation"
echo "source ${JEUS_HOME}/scripts/.j7_user_pass
startManagedServer -domain \${DOMAIN_NAME} -server ofgw_svr -u \${jeus_admin} -p \${jeus_admin_pass}" > msboot_ofgw_svr
echo "source ${JEUS_HOME}/bin/.j7_user_pass
stopServer -host \${HOSTNAME}:${pn_ofgw_svr} -u \${jeus_admin} -p \${jeus_admin_pass}" > msdown_ofgw_svr
echo "Done! Now you can use msboot_ofgw_svr and msdown_ofgw_svr commands.
=================================================="

echo "OFManager scripts generation"
echo "source ${JEUS_HOME}/scripts/.j7_user_pass
startManagedServer -domain \${DOMAIN_NAME} -server ofmgr_svr -u \${jeus_admin} -p \${jeus_admin_pass}" > msboot_ofmgr_svr
echo "source ${JEUS_HOME}/scripts/.j7_user_pass
stopServer -host \${HOSTNAME}:${pn_ofmgr_svr} -u \${jeus_admin} -p \${jeus_admin_pass}" > msdown_ofmgr_svr
echo "Done! Now you can use msboot_ofmgr_svr and msdown_ofmgr_svr commands.
=================================================="

echo "OFMiner scripts generation"
echo "source ${JEUS_HOME}/scripts/.j7_user_pass
startManagedServer -domain \${DOMAIN_NAME} -server ofminer_svr -u \${jeus_admin} -p \${jeus_admin_pass}" > msboot_ofminer_svr
echo "source ${JEUS_HOME}/scripts/.j7_user_pass
stopServer -host \${HOSTNAME}:${pn_ofminer_svr} -u \${jeus_admin} -p \${jeus_admin_pass}" > msdown_ofminer_svr
echo "Done! Now you can use msboot_ofminer_svr and msdown_ofminer_svr commands.
=================================================="

echo "Making all the files executable..."
chmod +x {dsboot,dsdown,nmboot,nmdown,msboot_ofgw_svr,msdown_ofgw_svr,msboot_ofmgr_svr,msdown_ofmgr_svr,msboot_ofminer_svr,msdown_ofminer_svr}
echo "Done!"

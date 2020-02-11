#!/bin/bash

####################################################################################
#AUTHORS: Matthew Koziel, Charlie Kim, Ian Kang, Clement Deltel
#COMPANY: TmaxSoft
#SCRIPT: versions+licenses_check
#DATE: 2019/06/09
#UPDATE_1: 2019/06/14
#UPDATE_2: 2019/11/11
#DESCRIPTION: This script's purpose is to check the version and the license for all
#             OpenFrame products and to store the information into two text files.
####################################################################################

# If you have the following error running this script:
# syntax error near unexpected token `$'{\r''
#
# Run first the command: dos2unix versions+licenses_check.sh

####################################################################################
#FUNCTION: check_return_code
#DESCRIPTION: This is for the logs, it checks the return code of the last executed 
# command and spits it out into the log directory specified in the environment 
# setup. If anything fails, it exits.
####################################################################################
check_return_code(){
  rc=$1
  string_=$2

  if [[ $rc == 0 ]];
  then
    echo "$string_ : SUCCESSFUL" >> ${log_dir}/${basename_var}.${date}.out
  else
    echo "$string_ : FAILED" >> ${log_dir}/${basename_var}.${date}.err
    exit 100
  fi
}

####################################################################################
#FUNCTION: get_unique_files
#DESCRIPTION: This function gets the unique files.
####################################################################################
get_unique_files(){
  cd "$1"
  check_return_code $? "cd $1"
  if [ "$1" = "$lib_dir" ]; then
    unique_files="$(ls | cut -d"." -f1-2 | sort -u)"
  else
    unique_files="$(ls | cut -d'.' -f1 | sort -u)"
  fi
  #echo $unique_files
}

####################################################################################
#FUNCTION: offile_on_unique
#DESCRIPTION: This function runs offile on all of the unique files.
####################################################################################
offile_on_unique(){
  echo "$1" >> $output_file
  for item in $unique_files
  do offile $item >> $output_file
  check_return_code $? "offile $item >> $output_file"
  done
  echo "
  
  " >> $output_file
}

####################################################################################
#FUNCTION: version_check
#DESCRIPTION: This function check the version of all OpenFrame products and store
#             the results in the file called version_check.txt.
####################################################################################
version_check(){
  work_dir=$(pwd)

  log_dir="${OPENFRAME_HOME}/log/scripts/"
  basename_var=$(basename $0)
  date=$(date +%Y%m%d)
  bin_dir="${OPENFRAME_HOME}/bin"
  core_appbin_dir="${OPENFRAME_HOME}/core/appbin"
  lib_dir="${OPENFRAME_HOME}/lib"
  util_dir="${OPENFRAME_HOME}/util"
  output_file="${work_dir}/versions_check.txt"
  if [[ -f $output_file ]]
  then 
    rm $output_file
    check_return_code $? "rm $output_file"
    touch $output_file
    check_return_code $? "touch $output_file"
  fi

  # ProObject and ISPF home folders
  po7_home=/opt/tmaxui/proobject7
  ispf_home=/opt/tmaxui/ispf_migration

  echo "
    ===============================================
    |              VERSIONS CHECK                 |
    ===============================================
  " | tee $output_file

  # Tibero
  if [[ -d $TB_HOME ]]
  then
    echo "Tibero"
    echo "
    -----------------------------------------------
            Tibero                                
    -----------------------------------------------
    " >> $output_file
    tbboot -v | grep Tibero >> $output_file
    #tbboot -p >> $output_file
    #tbooot -cs >> $output_file
  else
    echo "Tibero is installed on a different server, skipping Tibero version retrieval"
  fi

  # OpenFrame
  echo "OpenFrame components: Base, Batch, TACF, OSC, HiDB, OSI (if installed)"
  
  if [[ -d $OPENFRAME_HOME ]]
  then
    echo "
    -----------------------------------------------
              OpenFrame components
    -----------------------------------------------
    " >> $output_file
    ofversion >> $output_file

    echo "More details about these products"
    # TMAX
    echo "More details about TMAX" >> $output_file
    tmboot -V >> $output_file
    # OSC
    if [[ -d $OPENFRAME_HOME/osc ]]
    then
      echo "More details about OSC" >> $output_file
      oscboot -version >> $output_file
    fi
  fi

  # Prosort
  if [[ -d $PROSORT_HOME ]]
  then
    echo "Prosort"
    echo "
    -----------------------------------------------
              Prosort
    -----------------------------------------------
    " >> $output_file
    prosort -v >> $output_file
  fi

  # Protrieve
  if [[ -d $PROTRIEVE_HOME ]]
  then
    echo "Protrieve"
    echo "
    -----------------------------------------------
              Protrieve
    -----------------------------------------------
    " >> $output_file
    protp -v >> $output_file
    echo "Revision of this program:"
    protp -e >> $output_file
  fi

  # Compiler ofcobol
  if [[ -d $OFCOB_HOME ]]
  then
    echo "Compiler: OFCOBOL"
    echo "
    -----------------------------------------------
              OFCOBOL
    -----------------------------------------------
    " >> $output_file
    ofcob --version >> $output_file
  fi

  # Compiler ofpli
  if [[ -d $OFPLI_HOME ]]
  then
    echo "Compiler: OFPLI"
    echo "
    -----------------------------------------------
              OFPLI
    -----------------------------------------------
    " >> $output_file
    ofpli --version >> $output_file
  fi

  if [[ -d $OFASM_HOME ]]
  then
    echo "Compiler: OFASM"
    echo "
    -----------------------------------------------
              OFASM
    -----------------------------------------------
    " >> $output_file
    ofasm --version >> $output_file
  fi

  # JEUS 7 Products
  if [[ -d $JEUS_HOME ]]
  then
    echo "JEUS 7, OFGateway, OFManager OFMiner"
    echo "
    -----------------------------------------------
              JEUS 7
    -----------------------------------------------
    " >> $output_file
    jeusadmin --fullversion >> $output_file

    # OFGateway
    if [[ -d $OFGW_HOME ]]
    then
      echo "
      OFGateway" >> $output_file
      cat $OFGW_HOME/webterminal/scripts/version.js | grep ofwt_version | sed -e 's/^[ \t]*//' >> $output_file
    fi

    # OFManager
    if [[ -d $OFMANAGER_HOME ]]
    then
      echo "
      OFManager" >> $output_file
      # This is working on customer environment
      #cat $OFMANAGER_HOME/resources/target/js/data.js | grep ofmanagerVersion >> $output_file
      # This is working on my own VM
      cat $OFMANAGER_HOME/resources/js/settings/versioninfo/versioninfo.js | grep OFMANAGER | sed -e 's/^[ \t]*//' >> $output_file
    fi

    # OFMiner
    if [[ -d $OFMINER_HOME ]]
    then
      echo "
      OFMiner" >> $output_file
      cat $OFMINER_HOME/info/versioninfo.properties | grep ofminer >> $output_file
    fi
  fi

  # OF Studio
  if [[ -d $OFGDB_HOME ]]
  then
    echo "OF Studio"
    echo "
    -----------------------------------------------
              OF Studio
    -----------------------------------------------
    " >> $output_file
    gdbserver --version >> $output_file
  fi

  # JEUS 8, ProObject and ISPF
  if [[ -d $JEUS_HOME/../jeus8 ]]
  then
    echo "JEUS 8, ProObject 7, ISPF"
    echo "
    -----------------------------------------------
              JEUS 8
    -----------------------------------------------
    " >> $output_file
    tmp=`su - ofjeus8 -c "jeusadmin --fullversion"`
    echo $tmp >> $output_file

    # ProObject7
    if [[ -d $po7_home ]]
    then
      echo "
      Pro Object 7" >> $output_file
      ls $po7_home/_for_jeus | grep proobject-runtime >> $output_file
      ls -l $po7_home/application/of8/servicegroup/ispf/ispf* >> $output_file
      ls -l $po7_home/application/of8/common/dto/ispf-common* >> $output_file
      ls -l $po7_home/application/of8/common/lib/ispf-common* >> $output_file
      ls -l $po7_home/application/of8/event/ispf-websocket* >> $output_file
    fi

    # ISPF
    if [[ -d $ispf_home ]]
    then
      echo "
      ISPF" >> $output_file
      ls -l $ispf_home/parser/lib/*messageParser.jar >> $output_file
      ls -l $ispf_home/parser/lib/*panelParser.jar >> $output_file
      ls -l $ispf_home/parser/lib/*skelparser.jar >> $output_file
      ls -l $ispf_home/parser/bin/*clist_parser >> $output_file
    fi
  fi

  # Other products
  if [[ -d $OPENFRAME_HOME ]]
  then
    echo "offile"
    echo "
    -----------------------------------------------
              offile
    -----------------------------------------------
    " >> $output_file
    get_unique_files $bin_dir   
    offile_on_unique $bin_dir 

    get_unique_files $core_appbin_dir   
    offile_on_unique $core_appbin_dir 
    
    get_unique_files $lib_dir
    offile_on_unique $lib_dir
    
    get_unique_files $util_dir
    offile_on_unique $util_dir
  fi

  cd $work_dir
  echo "
             version_check.txt created!         
  "

}

####################################################################################
#FUNCTION: license_check
#DESCRIPTION: This function check the license of all OpenFrame products and store
#             the results in the file called license_check.txt.
####################################################################################
license_check(){

  output_file="licenses_check.txt"

  echo "
  ===============================================
  |              LICENSES CHECK                 |
  ===============================================
  " | tee $output_file

  # Tibero
  if [[ -d $TB_HOME ]]
  then
    echo "Tibero"
    # If you have oframe user only, use the following line
    #TIBERO_EX_DATE=`tbboot -l | grep Expiration | awk '{print $3}'`
    # If you have an oftibr user for Tibero, use the two following lines
    tmp=`su - oftibr -c "tbboot -l | grep Expiration"`
    TIBERO_EX_DATE=`echo $tmp | awk '{print $3}'`
    echo "TIBERO   Expiration date:     ${TIBERO_EX_DATE}" >> $output_file
  else
    echo "Tibero is installed on a different server, skipping Tibero license retrieval"
  fi

  if [[ -d $OPENFRAME_HOME ]]
  then
    # TMAX
    echo "TMAX"
    echo "-------------------------------------------------------------" >> $output_file
    tmp=`tmadmin -i $OPENFRAME_HOME/core/license/license.dat | grep Expiration | awk '{print $3}'`
    TMAX_EX_DATE=`date -d$tmp +%Y/%m/%d`
    echo "TMAX     Expiration date:     ${TMAX_EX_DATE}" >> $output_file

    # Base
    echo "Base"
    echo "-------------------------------------------------------------" >> $output_file
    tmp=`tjesmgr LICENSE BASE | grep Expiration | awk '{print $3}'`
    BASE_EX_DATE=`date -d$tmp +%Y/%m/%d`
    echo "BASE     Expiration date:     ${BASE_EX_DATE}" >> $output_file

    # Batch
    echo "Batch"
    tmp=`tjesmgr LICENSE TJES | grep Expiration | awk '{print $3}'`
    BATCH_EX_DATE=`date -d$tmp +%Y/%m/%d`
    echo "BATCH    Expiration date:     ${BATCH_EX_DATE}" >> $output_file

    # TACF
    echo "TACF"
    tmp=`tjesmgr LICENSE TACF | grep Expiration | awk '{print $3}'`
    TACF_EX_DATE=`date -d$tmp +%Y/%m/%d`
    echo "TACF     Expiration date:     ${TACF_EX_DATE}" >> $output_file

    # OSC
    if [[ -d $OPENFRAME_HOME/osc ]]
    then
      echo "OSC"
      tmp=`tjesmgr LICENSE OSC | grep Expiration | awk '{print $3}'`
      OSC_EX_DATE=`date -d$tmp +%Y/%m/%d`
      echo "OSC      Expiration date:     ${OSC_EX_DATE}" >> $output_file
    else
      echo "OSC is not installed, skipping licenses retrieval"
    fi

    # HiDB
    if [[ -d $OPENFRAME_HOME/hidb ]]
    then
      echo "HiDB"
      tmp=`tjesmgr LICENSE HIDB | grep Expiration | awk '{print $3}'`
      HIDB_EX_DATE=`date -d$tmp +%Y/%m/%d`
      echo "HiDB     Expiration date:     ${HIDB_EX_DATE}" >> $output_file
    else
      echo "HiDB is not installed, skipping licenses retrieval"
    fi

    # OSI
    if [[ -d $OPENFRAME_HOME/osi ]]
    then
      echo "OSI"
      tmp=`tjesmgr LICENSE OSI | grep Expiration | awk '{print $3}'`
      OSI_EX_DATE=`date -d$tmp +%Y/%m/%d`
      echo "OSI      Expiration date:     ${OSI_EX_DATE}" >> $output_file
    else
      echo "OSI is not installed, skipping licenses retrieval"
    fi
  fi

  # Prosort
  if [[ -d $PROSORT_HOME ]]
  then
    echo "Prosort"
    echo "-------------------------------------------------------------" >> $output_file
    # TODO This first line is working on my VM but not if the server is using a non demo license
    DURATION=`grep demo_duration $PROSORT_HOME/license/license.xml | awk -F"[<>]" '{print $3}'`
    TEM_EX_DATE=`grep issue_date $PROSORT_HOME/license/license.xml | awk -F"[<>]" '{print $3}'`
    PROSORT_EX_DATE=$(date +%Y/%m/%d -d "$TEM_EX_DATE + ${DURATION} day")
    echo "PROSORT  Expiration date:     ${PROSORT_EX_DATE}" >> $output_file
    echo "PROSORT  Duration:            ${DURATION} days" >> $output_file
  fi

  # Protrieve
  #if [[ -d $PROTRIEVE_HOME ]]
  #then
    #echo "Protrieve"
    #echo "-------------------------------------------------------------" >> $output_file
    # TODO No command for Protrieve so far
  #fi

  # OFCOBOL
  if [[ -d $OFCOB_HOME ]]
  then
    echo "OFCOBOL"
    echo "-------------------------------------------------------------" >> $output_file
    tmp=`ofcob --license | grep Expiration | awk '{print $3}'`
    OFCOB_EX_DATE=`date -d$tmp +%Y/%m/%d`
    echo "OFCOBOL  Expiration date:     ${OFCOB_EX_DATE}" >> $output_file
  fi

  # OFPLI
  if [[ -d $OFPLI_HOME ]]
  then
    echo "OFPLI"
    tmp=`ofpli --license | grep Expiration | awk '{print $3}'`
    OFPLI_EX_DATE=`date -d$tmp +%Y/%m/%d`
    echo "OFPLI    Expiration date:     ${OFPLI_EX_DATE}" >> $output_file
  fi

  # JEUS 7
  if [[ -d $JEUS_HOME ]]
  then
    echo "JEUS"
    echo "-------------------------------------------------------------" >> $output_file
    tmp=`jeusadmin -licenseinfo | grep DUE | awk '{print $4}'`
    JEUS_EX_DATE=`date -d$tmp +%Y/%m/%d`
    echo "JEUS     Expiration date:     ${JEUS_EX_DATE}" >> $output_file

    # OFGateway
    if [[ -d $OFGW_HOME ]]
    then
      echo "OF Gateway"
      OFGW_EXP_DATE=`grep expireDate $OFGW_HOME/../../logs/JeusL* |sort -r | head -n 1 | awk -F"[:]" '{print $6 $8}' | awk '{print $6,$2,$3}'`
      tmp=`echo $OFGW_EXP_DATE | awk '{print $3$2$1}'`
      OFGW_EXP_DATE=`date -d$tmp +%Y/%m/%d`
      echo "OFGW     Expiration date:     ${OFGW_EXP_DATE}" >> $output_file
    fi

    # OFManager
    if [[ -d $OFMANAGER_HOME ]]
    then
      echo "OF Manager"
      OFMGR_EXP_DATE=`grep expireDate $OFMANAGER_HOME/logs/ofmanager* |sort -r | head -n 1 | awk -F"[:]" '{print $6 $8}' | awk '{print $6,$2,$3}'`
      tmp=`echo $OFMGR_EXP_DATE | awk '{print $3$2$1}'`
      OFMGR_EXP_DATE=`date -d$tmp +%Y/%m/%d`
      echo "OFMGR    Expiration date:     ${OFMGR_EXP_DATE}" >> $output_file
    fi

    # OFMiner
    if [[ -d $OFMINER_HOME ]]
    then
      echo "OF Miner"
      # This is working on customer environment
      OFMINER_EXP_DATE=`grep expireDate $JEUS_HOME/domains/jeus_domain/servers/ofminer_svr/logs/JeusServer* | tail -n 1 | awk '{print $7}'`
      # This is working on my own VM
      # TODO No command on my own VM so far
      echo "OFMiner  Expiration date:     ${OFMINER_EXP_DATE}" >> $output_file
    fi
  fi

  # OF Studio
  #if [[ -d $OFGDB_HOME ]]
  #then
    #echo "OF Studio"
    #echo "-------------------------------------------------------------" >> $output_file
    # TODO No command for OFStudio so far
  #fi

  # Earliest date for license renewal
  sed 's/=//g; s/-//g; /^$/d' licenses_check.txt | grep Expiration > tmp.txt
  echo >> $output_file
  echo "===============================================">> $output_file
  echo "The order for licenses expiration is:
  " >> $output_file
  sort -k3 tmp.txt >> $output_file
  EARLIEST_DATE=`sort -k3 tmp.txt  | head -n 1 | awk '{print $4}'`
  echo "===============================================" | tee -a $output_file
  echo "The earliest date for license expiration is ${EARLIEST_DATE}." | tee -a $output_file
  echo "Make sure to ask for license renewal 2 weeks prior this date." | tee -a $output_file
  rm tmp.txt

  echo "
             license_check.txt created!         
  "
}

####################################################################################
#FUNCTION: main
####################################################################################
main(){
  echo "Tibero, OpenFrame and JEUS 7 are up and running? (y:n)"; read user_answer_1

  case ${user_answer_1} in
    "y" | "Y")
    echo "
    Good!
    "
    if [[ ! -d ${OPENFRAME_HOME}/log/scripts ]]
    then
      mkdir ${OPENFRAME_HOME}/log/scripts
    fi
    version_check
    license_check
    echo "
    Done!
    "
    ;;
    "n" | "N")
    echo "Please start Tibero, OpenFrame and JEUS 7 first"
    exit -1
    ;;
    *)
    echo "Invalid answer"
    exit -2
    ;;
  esac
}
main
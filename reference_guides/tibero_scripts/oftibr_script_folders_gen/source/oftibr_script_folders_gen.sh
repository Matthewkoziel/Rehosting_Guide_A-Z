#!/bin/bash

####################################################################################
#AUTHOR: Clement Deltel
#COMPANY: TmaxSoft
#SCRIPT: oftibr_script_folders_gen
#DATE: 2020/01/24
#DESCRIPTION: This script's purpose is to create scripts folder non automatically
#             generated by Tibero installation.
####################################################################################

# If you have the following error running this script:
# syntax error near unexpected token `$'{\r''
#
# Run first the command: dos2unix oftibr_script_folders_gen.sh

####################################################################################
#FUNCTION: folder_generation
#DESCRIPTION: generate scripts folder, for custom scripts for instance, that
#             are not generated by Tibero installation.
#
# NOTICE: Feel free to add new folders if necessary for your environement.
####################################################################################
folder_generation(){
  output_file=$1

  echo "
##############################################################################
#                   SCRIPTS FOLDER                                           #
##############################################################################" >> $output_file
  # Tibero
  if [ ! -d $TB_HOME/scripts/custom ]
  then
    mkdir $TB_HOME/scripts/custom
    echo 'export PATH=$TB_HOME/scripts/custom:$PATH' >> $output_file
    echo "scripts/custom folder in TB_HOME generated!"
    if [[ -d $HOME_DIRECTORY/tmaxsw/scripts/tibero ]]
    then
      echo "Copy of your custom scripts to $TB_HOME/scripts/custom"
      cp $HOME_DIRECTORY/tmaxsw/scripts/tibero/* $TB_HOME/scripts/custom
    fi
  else
    echo "The folder already exist!"
  fi
  
  . ~/.bash_profile
  echo "
  Please run the command echo \$PATH. If it is not up to date, please execute the bash profile
  "
}

####################################################################################
#FUNCTION : main
####################################################################################
main(){
  folder_generation ~/.bash_profile
}
main
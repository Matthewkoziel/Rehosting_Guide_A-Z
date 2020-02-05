#!/bin/bash

####################################################################################
#AUTHOR: Clement Deltel
#COMPANY: TmaxSoft
#SCRIPT: licenses_optimization
#DATE: 2019/17/12
#DESCRIPTION: This script's purpose is to replace all license files for OpenFrame 
# products (unless Tibero) by symbolic links that point to the same folder.
#
# It is not mandatory but for future replacement of expired licenses, it is easier 
# to replace only one folder than each license file one by one.
####################################################################################
echo "
Starting removing license files and creating symbolic links instead...

Please verify below if everything looks correct:
"
#====================
# OpenFrame products
#====================
if [ -d $OPENFRAME_HOME ]
then
  #==========
  # TMAX
  #==========
  if [ -f $OPENFRAME_HOME/core/license/license.dat ] || [ -L $OPENFRAME_HOME/core/license/license.dat ]
  then
      rm $OPENFRAME_HOME/core/license/license.dat
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/tmax/license.dat $OPENFRAME_HOME/core/license/license.dat
      echo "TMAX"
      ls -lh --color $OPENFRAME_HOME/core/license
  fi

  # Base
  if [ -f $OPENFRAME_HOME/license/licbase.dat ] || [ -L $OPENFRAME_HOME/license/licbase.dat ]
  then
      rm $OPENFRAME_HOME/license/licbase.dat
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/openframe/licbase.dat $OPENFRAME_HOME/license/licbase.dat
  fi
  # Batch
  if [ -f $OPENFRAME_HOME/license/lictjes.dat ] || [ -L $OPENFRAME_HOME/license/lictjes.dat ]
  then
      rm $OPENFRAME_HOME/license/lictjes.dat
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/openframe/lictjes.dat $OPENFRAME_HOME/license/lictjes.dat
  fi
  # TACF
  if [ -f $OPENFRAME_HOME/license/lictacf.dat ] || [ -L $OPENFRAME_HOME/license/lictacf.dat ]
  then
      rm $OPENFRAME_HOME/license/lictacf.dat
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/openframe/lictacf.dat $OPENFRAME_HOME/license/lictacf.dat
  fi
  # OSC 
  if [ -d $OPENFRAME_HOME/osc ]
  then
    if [ -f $OPENFRAME_HOME/license/licosc.dat ] || [ -L $OPENFRAME_HOME/license/licosc.dat ]
    then
        rm $OPENFRAME_HOME/license/licosc.dat
        ln -s $HOME_DIRECTORY/tmaxsw/licenses/openframe/licosc.dat $OPENFRAME_HOME/license/licosc.dat
    fi
  fi
  # HiDB
  if [ -d $OPENFRAME_HOME/hidb ]
  then
    if [ -f $OPENFRAME_HOME/license/lichidb.dat ] || [ -L $OPENFRAME_HOME/license/lichidb.dat ]
    then
        rm $OPENFRAME_HOME/license/lichidb.dat
        ln -s $HOME_DIRECTORY/tmaxsw/licenses/openframe/lichidb.dat $OPENFRAME_HOME/license/lichidb.dat
    fi
  fi
  # OSI
  if [ -d $OPENFRAME_HOME/osi ]
  then
    if [ -f $OPENFRAME_HOME/license/licosi.dat ] || [ -L $OPENFRAME_HOME/license/licosi.dat ]
    then
        rm $OPENFRAME_HOME/license/licosi.dat
        ln -s $HOME_DIRECTORY/tmaxsw/licenses/openframe/licosi.dat $OPENFRAME_HOME/license/licosi.dat
    fi
  fi
  echo; echo "OpenFrame products"
  ls -lh --color $OPENFRAME_HOME/license
fi

#==========
# Prosort
#==========
if [ -d $PROSORT_HOME ]
then
  if [ -f $PROSORT_HOME/license/license.xml ] || [ -L $PROSORT_HOME/license/license.xml ]
  then
      rm $PROSORT_HOME/license/license.xml
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/prosort/license.xml $PROSORT_HOME/license/license.xml
      echo; echo "prosort"
      ls -lh --color $PROSORT_HOME/license
  fi
fi
#==========
# Protrieve
#==========
if [ -d $PROTRIEVE_HOME ]
then
  if [ -f $PROTRIEVE_HOME/license/licprot.dat ] || [ -L $PROTRIEVE_HOME/license/licprot.dat ]
  then
      rm $PROTRIEVE_HOME/license/licprot.dat
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/licprot.dat $PROTRIEVE_HOME/license/licprot.dat
      echo; echo "protrieve"
      ls -lh --color $PROTRIEVE_HOME/license
  fi
fi

#==========
# Compilers
#==========
# OFCOBOL
if [ -d $OFCOB_HOME ]
then
  if [ -f $OFCOB_HOME/license/licofcob.dat ] || [ -L $OFCOB_HOME/license/licofcob.dat ]
  then
      rm $OFCOB_HOME/license/licofcob.dat
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/licofcob.dat $OFCOB_HOME/license/licofcob.dat
      echo; echo "ofcobol"
      ls -lh --color $OFCOB_HOME/license
  fi
fi
# OFPLI
if [ -d $OFPLI_HOME ]
then
  if [ -f $OFPLI_HOME/license/licofpli.dat ] || [ -L $OFPLI_HOME/license/licofpli.dat ]
  then
      rm $OFPLI_HOME/license/licofpli.dat
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/licofpli.dat $OFPLI_HOME/license/licofpli.dat
      echo; echo "ofpli"
      ls -lh --color $OFPLI_HOME/license
  fi
fi

#==========
# JEUS 7
#==========
if [ -d $JEUS_HOME ]
then
  # JEUS itself
  if [ -f $JEUS_HOME/license/license ] || [ -L $JEUS_HOME/license/license ]
  then
      rm $JEUS_HOME/license/license
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/license $JEUS_HOME/license/license
      echo; echo "jeus 7"
      ls -lh --color $JEUS_HOME/license
  fi
  #OF Gateway
  if [ -d $OFGW_HOME ]
  then
    if [ -f $OFGW_HOME/ofgwconf/license/OFGWLicense ] || [ -L $OFGW_HOME/ofgwconf/license/OFGWLicense ]
    then
        rm $OFGW_HOME/ofgwconf/license/OFGWLicense
        ln -s $HOME_DIRECTORY/tmaxsw/licenses/OFGWLicense $OFGW_HOME/ofgwconf/license/OFGWLicense
        echo; echo "ofgw"
        ls -lh --color $OFGW_HOME/ofgwconf/license
    fi
  fi
  # OF Manager
  if [ -d $OFMANAGER_HOME ]
  then
    if [ -f $OFMANAGER_HOME/license/OFManagerLicense ] || [ -L $OFMANAGER_HOME/license/OFManagerLicense ]
    then
        rm $OFMANAGER_HOME/license/OFManagerLicense
        ln -s $HOME_DIRECTORY/tmaxsw/licenses/OFManagerLicense $OFMANAGER_HOME/license/OFManagerLicense
        echo; echo "ofmanager"
        ls -lh --color $OFMANAGER_HOME/license
    fi
  fi
  # OF Miner
  if [ -d $OFMINER_HOME ]
  then
    if [ -f $OFMINER_HOME/license/OFMinerLicense ] || [ -L $OFMINER_HOME/license/OFMinerLicense ]
    then
        rm $OFMINER_HOME/license/OFMinerLicense
        ln -s $HOME_DIRECTORY/tmaxsw/licenses/OFMinerLicense $OFMINER_HOME/license/OFMinerLicense
        echo; echo "ofminer"
        ls -lh --color $OFMINER_HOME/license
    fi
  fi
fi

#==========
# JEUS 8
#==========
if [ -d $JEUS_HOME/../jeus8 ]
then
    # JEUS itself
  if [ -f $JEUS_HOME/../jeus8/license/license ] || [ -L $JEUS_HOME/../jeus8/license/license ]
  then
      rm $JEUS_HOME/../jeus8/license/license
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/license $JEUS_HOME/../jeus8/license/license
      echo; echo "jeus 8"
      ls -lh --color $JEUS_HOME/../jeus8/license
  fi
fi

#==========
# OFStudio
#==========
if [ -d $OFGDB_HOME ]
then
  if [ -f $OFGDB_HOME/license/OpenStudioLicense ] || [ -L $OFGDB_HOME/license/OpenStudioLicense ]
  then
      rm $OFGDB_HOME/license/OpenStudioLicense
      ln -s $HOME_DIRECTORY/tmaxsw/licenses/OpenStudioLicense $OFGDB_HOME/license/OpenStudioLicense
      echo; echo "ofstudio"
      ls -lh --color $OFGDB_HOME/license
  fi
fi

echo "
Done! All licenses updated.
"

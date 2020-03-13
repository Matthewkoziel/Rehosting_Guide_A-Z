# dstool.conf (Dataset Tool Configuration)

Contains settings for dataset related tool programs such as Command section in OFManager, dsload, dsview, dsmigin, etc.This configuration file is separated by each tool, including a common section which will cover all tools below.

# Table of Contents

- [COMMON](#1-common "Common settings for tools in dstool.conf")
- [COBGENSCH](#2-cobgensch "cobgensch settings")
- [DSLOAD](#3-dsload "dsload settings")
- [DSVIEW](#4-dsview "dsview settings")
- [DSMIGIN](#5-dsmigin "dsmigin settings")
- [DSCREATE](#6-dscreate "dscreate settings")
- [OFRDMSVR](#7-ofrdmsvr "ofrdmsvr settings")
- [OFRUISVR](#8-ofruisvr "ofruisvr settings")
- [OFRDSEDT](#9-ofrdsedt "ofrdsedt settings")
- [SPFEDIT](#10-spfedit "spfedit settings")

## 1. Common

Currently, there are no default values set in the COMMON configuration portion of this tool.

## 2. COBGENSCH

- ODO_MIN_ZERO_AVAILABLE=NO

Set the Occurs Depending On minimum to zero (YES|NO)

*Recommendation:* Leave it as default (NO)

## 3. DSLOAD

- SIZE_LIMIT=1000000

Used to limit the maximum size of datasets processed by dsload. 

*Recommendation:* Leave it as default (1000000). If a specific dataset requires a new maximum, change this value to be just larger than the dataset size.

***

- LOAD_DIR=${OPENFRAME_HOME}/temp

This is the default export location for the dsload tool. It is recommended to use the ```[-t <target>]``` option in the dsload tool to explicitly specify where a dataset should be loaded to, but in the event that it is not, it will end up in the LOAD_DIR.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/temp)

***

- DELIMITER=\r\n

If the ```[-d <delimiter>]``` option is not specified in dsload, it will be defaulted to the delimiter specified above. For Linux, the common delimiter is "\r\n"

*Recommendation:* Leave it as default (\r\n)

## 4. DSVIEW

NOCATALOG_VIEW=YES

This setting allows non-VSAM datasets to still be viewed, even if they're not cataloged. This can be handy when trying to view a dataset using spfedit, but the dataset is not cataloged. If you still wish to see it, you can  use dsview.

*Recommendation:* Leave it as default (YES)

## 5. DSMIGIN

Currently, there are no default values set in the DSMIGIN configuration portion of this tool.

## 6. DSCREATE

- RECAT_UPDATE_DSATTR=YES

Option to update the attributes of a dataset when the RECATALOG option is used

*Recommendation:* Leave it as default (YES)

## 7. OFRDMSVR

- CHECK_EXPIRE_DATE=YES

Option to delete datasets after they expire

*Recommendation:* Leave it as default (YES)

***

- APPLY_GDG_MEMBER=YES

Option to delete GDS datasets after they expire

*Recommendation:* Leave it as default (YES)

***

- CALL_SERVICE_INTERVAL=180

Time interval between attempts to call service from the ofrdmsvr server process (in minutes)

*Recommendation:* Leave it as default (180) 

## 8. OFRUISVR

- DSCREOWNER=MASTER

Option to change the owner of datasets created with the TACF token when creating a dataset through the ofruisvr server process.

* MASTER: Does not change the OWNER of the created dataset. The OWNER is set to the user ID who started the ofruisvr. (DEFAULT)
* USER: Changes the OWNER of the created dataset into the ID of the user who are using the TACF token.

*Recommendation:* Leave it as default (MASTER)

***

- COMMAND_LIST

List of commands that can be executed using the OFRUISVRCOMMAND service of the ofruisvr server process. If not specified, ANY command can be executed.

*Recommendation:* Check with the customer on what commands they will allow their employees to execute from OFManager. Examples include:

  - dslist
  - dscreate
  - dsdelete
  - offile

***

- DSVIEW_LOCKING_DATASET=NO

Option to execute a lock on a dataset when using dsview

*Recommendation:* Change this to value to (NO). When executing an spfedit to only browse a dataset, the ```-b``` option should be passed. dsview can be used similarly once this value is changed to NO.

## 9. OFRDSEDT

Currently, there are no default values set in the OFRDSEDT configuration portion of this tool.

## 10. SPFEDIT

- RECORD_READ_COUNT=1024

Specifies the number of records to be loaded to the memory whenever spfedit reads a dataset. 

*Recommendation:* Leave it as default (1024)

***

- END_KEY_FUNC_DEL_EOL=YES

Option to delete data starting from the current cusor position to the end of the record when you press <End> from the dataset EDIT page.

Recommandation: Leave it as default (YES)

***

- F12_KEY_FUNC_RETRIEVE=YES

Option to retrieve the last command entered on the Primary Command line when <F12> is pressed from the Dataset EDIT/BROWSE page.

Recommndation: Leave it as default (YES)

***

- REPLACE_CREATE_NEEDED=YES

Option to create a new dataset when there is no dataset to replace while executing the REPLACE command.

*Recommendation:* Leave it as default (YES)
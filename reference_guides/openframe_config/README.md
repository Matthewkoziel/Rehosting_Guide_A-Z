# OpenFrame Configuration Files

Below are the configuration files which OpenFrame uses to operate and match the configuration of the customer's mainframe. All of the configuration files will end in ```.conf``` and can be found in $OPENFRAME_HOME/config folder. This may be the most challenging part of a rehosting project, as getting all of the configurations correct on the first attempt may prove to be difficult. Each of the below items are items that are found in the default configuration files and should be brought to light with the customer. Each and every configuration below must be set as it is on the mainframe, or OpenFrame will not operate as expected. By completing the below section diligently, you can reduce the amount of time it takes to rehost a mainframe dramatically.

**Note: Many of the below configurations may remain as default, but as OpenFrame expands and adapts, these default values may change in the given configuration files. It is recommended that each and every configuration file is set to Mainframe standards**

# Table of Contents 

- [Batch Related](#1-batch-related "Configuration Files related to BATCH")
  - [ds.conf](#11-dataset-configuration-dsconf "Dataset Configuration")
    - [DATASET_DIRECTORY](#111-dataset-directory "Location settings for Dataset Schema files")
    - [DATASET_RESOURCE](#112-dataset-resource "Memory Resources for Datasets")
    - [DATASET_DEFAULT](#113-dataset-default "Default Values for Datasets")
    - [DATASET_LOCK](#114-dataset-lock)
  - [dstool.conf](#12-dataset-tool-configuration-dstoolconf "Dataset Tool Configuration")
    - [COMMON](#121-common "Common settings for tools in dstool.conf")
    - [COBGENSCH](#122-cobgensch "cobgensch settings")
    - [DSLOAD](#123-dsload "dsload settings")
    - [DSVIEW](#124-dsview "dsview settings")
    - [DSMIGIN](#125-dsmigin "dsmigin settings")
    - [DSCREATE](#126-dscreate "dscreate settings")
    - [OFRDMSVR](#127-ofrdmsvr "ofrdmsvr settings")
    - [OFRUISVR](#128-ofruisvr "ofruisvr settings")
    - [OFRDSEDT](#129-ofrdsedt "ofrdsedt settings")
    - [SPFEDIT](#1210-spfedit "spfedit settings")
  - [cpm.conf](#13-cpm-configuration-cpmconf "EBCDIC to ASCII conversion settings")
    - [DEFAULT_CODEPAGE](#131-default-codepage "Default conversion file settings for CPM")
  - [ezaci.conf](#14-ezaci-configuration-ezaciconf "EBCDIC to ASCII in COBOL configuration")
    - [E2A](#141-e2a "EBCDIC to ASCII")
    - [A2E](#142-a2e "ASCII to EBCDIC")
  - [ezplus.conf](#15-ezplus-configuration-ezplusconf "EZPLUS Configuration for EZTPA00 Utility")
    - [EZV](#151-ezv "EZPLUS work area")
  - [ftp.conf](#16-ftp-configuration-ftpconf "FTP Configuration")
    - [DIRECTORY](#161-directory "Directory Configuration")
    - [UNIT](#162-unit "Unit Configuration")
    - [DATASET_DEFAULT](#163-dataset-default "Dataset FTP Default Configuration")
    - [ERROR](#164-error "FTP Error Configuration")
    - [COMMAND_OPERATION](#165-command-operation "Command Operation FTP Configuration")
    - [OPTION](#166-option "FTP Option Confiugration")
  - [idcams.conf](#17-idcams-configuration-idcamsconf "IDCAMS Configuration")
    - [DEFAULT_USER](#171-default-user "Default Configuration for IDCAMS")
    - [TACF](#172-tacf "Security Configuration for IDCAMS")
    - [AMS](#173-ams "AMS Configuration")
  - [ikjeft01.conf](#18-ikjeft01-configuration-ikjeft01conf "IKJEFT01 Utility Configuration")
    - [SHARED_OBJECT](#181-shared-object "Shared Object Configuration")
    - [REPORT_DBCONN](#182-report-dbconn "Database Configuration for IKJEFT01")
    - [TACF](#183-tacf "IKJEFT01 TACF Rules")
  - [isrsupc.conf](#19-isrsupc-configuration-isrsupcconf "Configuration for ISRSUPC Utility")
    - [LINECMP](#191-linecmp)
  - [keyseq.conf](#110-keyseq-configuration-keyseqconf "Key Sequence Configuration")
    - [DSNAME](#1101-dsname "Keyseq based on dsname")
    - [PREFIX](#1102-prefix "Keyseq based on prefix")
    - [SUFFIX](#1103-suffix "Keyseq based on suffix")
  - [print.conf](#111-printer-configuration-printconf "Printer Configuration")
    - [SSPRT](#1111-ssprt "Samsung Printer Configuration")
    - [PRINTERX](#1112-printerx "PRINTERX Configuration")
    - [INTRDR](#1113-intrdr "Internal Reader Configuration")
    - [PMSVR](#1114-pmsvr "TP Scheduling Time Interval")
    - [WRITER](#1115-writer "Writer Configurations")
  - [sort.conf](#113-sort-configuration-sortconf "Sort Configuration")
    - [WORKSPACE](#1131-workspace "Sort Workspace Configuration")
    - [OPTION](#1132-option "Sort Options Configuration")
    - [PATH](#1133-path "Sort Path Configuration")
    - [SEQUENCE](#1134-sequence "Sort Sequence Configuration")
  - [textrun.conf](#114-textrun-configuration-textrunconf "Textrun Configuration")
    - [DEFAULT_USER](#1141-default-user "Textrun Default User Configuration")
    - [EXIT_CODE](#1142-exit-code "Textrun Exit Code Configuration")
    - [MONITORING](#1143-monitoring "Textrun Monitoring Configuration")
    - [AUTOEDIT](#1144-autoedit "Control-M Autoedit Configuration")
    - [OPTION](#1145-option "Textrun Options Configuration")
  - [tjclrun.conf](#115-tjclrun-configuration-tjclrunconf "Tjclrun Configuration")
    - [JOB](#1151-job "Tjclrun JOB Configuration")
    - [PERFORM](#1152-perform "Tjclrun PERFORM Configuration")
    - [DD](#1153-dd "Tjclrun DD Configuration")
    - [DDTAB](#1154-ddtab "Tjclrun DDTAB Configuration")
    - [SYSLIB](#1155-syslib "Tjclrun SYSLIB Configuration")
    - [PRELOAD](#1156-preload "Tjclrun PRELOAD Configuration")
    - [PGM](#1157-pgm "Tjclrun PGM Configuration")
    - [DBCONN_INFO](#1158-dbconn-info "Tjclrun DBCONN Configuration")
    - [ACCOUNT](#1159-account "Tjclrun ACCOUNT Configuration")
    - [TACF](#11510-tacf "Tjclrun TACF Configuration")
    - [AMS](#11511-ams "Tjclrun AMS Configuration")
    - [JCL](#11512-jcl "Tjclrun JCL Configuration")
    - [OPTION](#11513-option "Tjclrun OPTION Configuration")
    - [DEBUG](#11514-debug "Tjclrun DEBUG Configuration")
  - [tjes.conf](#116-tjes-configuration-tjesconf "TJES Configuration")
    - [NODEINFO](#1161-nodeinfo "TJES Node Configuration")
    - [JOBDEF](#1162-jobdef "TJES JOB Def Configuration")
    - [JOBCLASS](#1163-jobclass "TJES JOB CLASS Configuration")
    - [JOBGDEF](#1164-jobgdef "TJES JOB Group Configuration")
    - [SCHEDULING](#1165-scheduling "TJES Scheduling Configuration")
    - [RESOURCE](#1166-resource "TJES Resource Configuration")
    - [PROCLIB](#1167-proclib "TJES PROCLIB Configuration")
    - [DYNAMIC_LIBRARY](#1168-dynamic-library "TJES Dynamic Library Configuration")
    - [LOG](#1169-log "TJES Log Configuration")
    - [SPOOL](#11610-spool "TJES Spool Configuration")
    - [INTRDR](#11611-intrdr "TJES Internal Reader Configuration")
    - [INITDEF](#11612-initdef "TJES Initiator Definition Configuration")
    - [OUTCLASS](#11613-outclass "TJES OUTPUT CLASS Configuration")
    - [OUTDEF](#11614-outdef "TJES OUTPUT Queue Configuration")
    - [TACF](#11615-tacf "TJES TACF Configuration")
    - [OPRMSG](#11616-oprmsg "OPRMSG Configuration")

# 1. Batch Related

**General Information:** For anything commented out, the default values shown will be used. For the majority of the commented out settings, the default values will be sufficient. If you must investigate the options in more detail, please consult the manuals.

## 1.1 Dataset Configuration (ds.conf)

This configuration file stores general configuration settings for datasets used in OpenFrame.

More information about ds.conf can be found in the manual: OpenFrame_Base_Fix#3_Data Set Guide_v2.1.3_en.pdf

### 1.1.1 Dataset Directory

Stores information on where the schema files should be pulled from for dsmigin/dsmigout.

Recommendation: Leave it as default ($OPENFRAME_HOME/schema)

### 1.1.2 Dataset Resource

Shared Memory Key for dataset allocation information

Recommendation: Leave it as default (61482)

### 1.1.3 Dataset Default

Default information regarding datasets

- DEFAULT_VOLSER=DEFVOL

It's unlikely the customer has a default volume called DEFVOL in the mainframe, recommend to change this to their main volume. To create a volume, check the voladd tool #TODO

*** 

- SPOOL_VOLSER=VSPOOL

This describes the name of the Spool's Volume Serial. 

Recommendation: Leave it as default (VSPOOL)

***

- NVSM_BUFFER_SIZE=512

Size of the non-vsam dataset buffer in Kilobytes. 

Recommendation: Leave it as default (512)

***

- NVSM_EXTENT_LIMIT=50

Maximum Extent number of the non-vsam dataset

Recommendation: Find mainframe equivalent and set value equal. (Default=50)

***

- DSALC_SLOT_COUNT=65535

Maximum number of slots allocated for a dataset. Must be a number between 256 and 65535. 

Recommendation: Leave it as default (65535)

***

- CHECK_DSAUTH_V2=NO

This option checks the permissions in the dataset allocation. Can be easier to handle if we leave this on NO at the start of the project, then change it to YES later.

Recommendation: Leave it as default (NO), Then change it to YES in production.

***

- USE_BDAM_AS_TSAM=NO

Use Tibero/TSAM as BDAM.

Recommendation: Leave it as default (NO)

*** 

- SET_PDS_SIZE_TOTAL=NO

Calculate size of a PDS by adding up the sizes of all members

Recommendation: Ask the customer what they would prefer

***

- PASSED_NEW_DATASET_DISP=KEEP

  #TODO

***

- SET_OUTPUT_DCB_TO_SMS=NO

Specifies the DCB information of an output dataset for utilities such as SORT and IEBGENER to the SMS class following ACS rules, or to the DCB information of the input dataset.

Recommendation: Leave it as default (NO)

***

- SET_GDG_DATASET_SORT_TYPE=LIFO

Sets the GDG Dataset sort type to Last in - First Out

Recommendation: Leave it as default (LIFO)

***

- GDG_SCRATCH_DEFAULT

Sets the GDG scratch setting to either NOSCRATCH or SCRATCH.

Recommendation: Leave it as default (NOSCRATCH)

***

- UPDATE_GENERATION_AT_END_OF_STEP=YES

Updates the GDG generation at the end of a JOB step

Recommendation: Leave it as default (YES)

***

- SAME_RELATIVE_GDSNUM_IN_JOB

  #TODO

Recommendation: Leave it as default (YES)

***

- DELETE_GDS_AT_END_OF_STEP=YES

  #TODO

Recommendation: Leave it as default (YES)

### 1.1.4 Dataset Lock

- LOCK_FLAG=LOCK

Send LOCK related client requests such as lock, unlock, lock clear, and lock list query to the lock server.

  * LOCK: Sends to the lock server
  * NOLOCK: Does not send to the lock server

Recommendation: Leave it as default (LOCK)

***

- REQUEST_RETRYINTERVAL=5

Retry Interval for failed lock client requests

Recommendation: Leave it as default (5)

***

- DBCONN=LOCK_ODBC

ODBC connection name (odbc-section-name) used to connect to the database. The odbc-section-name must be specified in the ofsys.conf file.

Recommendation: Check the ofsys.conf file. In cases where the ODBC connection was set in a standard, default manner, the name will be LOCK_ODBC.

## 1.2 Dataset Tool Configuration (dstool.conf)

Contains settings for dataset related tool programs such as Command section in OFManager, dsload, dsview, dsmigin, etc.This configuration file is separated by each tool, including a common section which will cover all tools below.

### 1.2.1 Common

Currently, there are no default values set in the COMMON configuration portion of this tool.

### 1.2.2 COBGENSCH

- ODO_MIN_ZERO_AVAILABLE=NO

Set the Occurs Depending On minimum to zero (YES|NO)

Recommendation: Leave it as default (NO)

### 1.2.3 DSLOAD

- SIZE_LIMIT=1000000

Used to limit the maximum size of datasets processed by dsload. 

Recommendation: Leave it as default (1000000). If a specific dataset requires a new maximum, change this value to be just larger than the dataset size.

***

- LOAD_DIR=${OPENFRAME_HOME}/temp

This is the default export location for the dsload tool. It is recommended to use the ```[-t <target>]``` option in the dsload tool to explicitly specify where a dataset should be loaded to, but in the event that it is not, it will end up in the LOAD_DIR.

Recommendation: Leave it as default (${OPENFRAME_HOME}/temp)

***

- DELIMITER=\r\n

If the ```[-d <delimiter>]``` option is not specified in dsload, it will be defaulted to the delimiter specified above. For Linux, the common delimiter is "\r\n"

Recommendation: Leave it as default (\r\n)

### 1.2.4 DSVIEW

NOCATALOG_VIEW=YES

This setting allows non-VSAM datasets to still be viewed, even if they're not cataloged. This can be handy when trying to view a dataset using spfedit, but the dataset is not cataloged. If you still wish to see it, you can  use dsview.

Recommendation: Leave it as default (YES)

### 1.2.5 DSMIGIN

Currently, there are no default values set in the DSMIGIN configuration portion of this tool.

### 1.2.6 DSCREATE

- RECAT_UPDATE_DSATTR=YES

Option to update the attributes of a dataset when the RECATALOG option is used

Recommendation: Leave it as default (YES)

### 1.2.7 OFRDMSVR

- CHECK_EXPIRE_DATE=YES

Option to delete datasets after they expire

Recommendation: Leave it as default (YES)

***

- APPLY_GDG_MEMBER=YES

Option to delete GDS datasets after they expire

Recommendation: Leave it as default (YES)

***

- CALL_SERVICE_INTERVAL=180

Time interval between attempts to call service from the ofrdmsvr server process (in minutes)

Recommendation: Leave it as default (180) 

### 1.2.8 OFRUISVR

- DSCREOWNER=MASTER

Option to change the owner of datasets created with the TACF token when creating a dataset through the ofruisvr server process.

* MASTER: Does not change the OWNER of the created dataset. The OWNER is set to the user ID who started the ofruisvr. (DEFAULT)
* USER: Changes the OWNER of the created dataset into the ID of the user who are using the TACF token.

Recommendation: Leave it as default (MASTER)

***

- COMMAND_LIST

List of commands that can be executed using the OFRUISVRCOMMAND service of the ofruisvr server process. If not specified, ANY command can be executed.

Recommendation: Check with the customer on what commands they will allow their employees to execute from OFManager. Examples include:

  - dslist
  - dscreate
  - dsdelete
  - offile

***

- DSVIEW_LOCKING_DATASET=NO

Option to execute a lock on a dataset when using dsview

Recommendation: Change this to value to (NO). When executing an spfedit to only browse a dataset, the ```-b``` option should be passed. dsview can be used similarly once this value is changed to NO.

### 1.2.9 OFRDSEDT

Currently, there are no default values set in the OFRDSEDT configuration portion of this tool.

### 1.2.10 SPFEDIT

- RECORD_READ_COUNT=1024

Specifies the number of records to be loaded to the memory whenever spfedit reads a dataset. 

Recommendation: Leave it as default (1024)

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

Recommendation: Leave it as default (YES)

## 1.3 CPM Configuration (cpm.conf)

The cpm.conf configuration file contains the settings for conversion process from EBCDIC to ASCII and ASCII to EBCDIC.

### 1.3.1 DEFAULT_CODEPAGE

- EBC2ASC=${OPENFRAME_HOME}/cpm/EBCASCUS.cpm

Sets the EBCDIC to ASCII cpm file. There are many different cpm files in ${OPENFRAME_HOME}/cpm which can be modified using the cpmmgr tool. Learn more about the cpmmgr tool here: #TODO

Recommendation: Leave it as default (${OPENFRAME_HOME}/cpm/EBCASCUS.cpm)

***

- ASC2EBC=${OPENFRAME_HOME}/cpm/ASCEBCUS.cpm

Sets the ASCII to EBCDIC cpm file. 

Recommendation: Leave it as default (${OPENFRAME_HOME}/cpm/ASCEBCUS.cpm)

***

- SO=0A42

Sets the SO hexa code for SOSI characters in mainframe.

Recommendation: Confirm with customer the SOSI values and set accordingly

***

- SI=0A41

Sets the SI hexa code for SOSI characters in mainframe

Recommendation: Confirm with customer the SOSI values and set accordingly

## 1.4 EZACI Configuration (ezaci.conf)

ezaci.conf configuration file is an API configuration file used when using ASCII and EBCDIC code in COBOL. In COBOL code, you may see the following:

```COBOL
CALL 'EZACIA2E' USING <target-data>
      <target-data-length>
      <convert-cpm-table-name>
      RETURNING <retrun-code>.
```

Check to make sure the libofezaci.so file is linked in ${OPENFRAME_HOME}/lib.

### 1.4.1 E2A

- US=EBCASCUS.cpm

Recommendation: Check to make sure your cpm file is linked to the EBCASCUS.cpm file. If there is a custom file used instead, you will have to change this configuration to use the same cpm file here.

### 1.4.2 A2E

- US=ASCEBCUS.cpm

Recommendation: Check to make sure your cpm file is linked to the ASCEBCUS.cpm file. If there is a custom file used instead, you will have to change this configuration to use the same cpm file here.

## 1.5 EZPLUS Configuration (ezplus.conf)

ezplus.conf is a configuration file for the EZTPA00 utility which is used to execute CA-Easytrieve Plus scripts entered as SYSIN from JCL.

### 1.5.1 EZV

- WORK_DIR=${OPENFRAME_HOME}/temp/ezwork

Specifies a work area for calling ProTrieve from EZTPA00. It is used to temporarily save the script to transfer to ProTrieve.

Recommendation: Leave it as default (${OPENFRAME_HOME}/temp/ezwork)

## 1.6 FTP Configuration (ftp.conf)

This configuration file has settings related to the FTP utility in OpenFrame. Please do not confuse this configuration file with the Linux FTP tool.

### 1.6.1 DIRECTORY

- FTP_WORK_DIR=${OPENFRAME_HOME}/volume_default

Sets the work directory that is used for the FTP program to send data to the FTP server. If there is no entry, or nothing is specified, the [DIRECTORY] TEMP_DIR from the ofsys.conf is specified by default.

Recommendation: Check with the customer what volume you wish to send FTP'd files to.

### 1.6.2 UNIT

- DEFAULT=3380

Sets the default unit to be used for the FTP utility to send and receive datasets. If there is no entry, or nothing is specified, the value from the DEFAULT_VOLSER parameter, under [DATASET_DEFAULT] in ds.conf is used.

### 1.6.3 DATASET_DEFAULT

- CHECK_DSAUTH_V2=YES

Determines whether to check permission to allocate datasets.

  * YES: Checks permission for the dataset
  * NO:  Does not check permission for the dataset (DEFAULT)

Recommendation: Leave it as default until near ready for production.

### 1.6.4 ERROR

These are just messages that can be returned to the user for various errors.

Recommendation: Leave them all as default.

### 1.6.5 COMMAND_OPERATION

- PUT_COND=N

Determines how to process the PUT command if the dataset does not exist. If there is no entry, or nothing is specified, NO is specified by default.

Recommendation: Leave it as default (N)

### 1.6.6 OPTION

- SECURE_FTP=N

Option to use SFTP mode. If set to Y, the FTP utility uses secured connection (port 22) with unix program lftp. If N, the FTP utility uses normal connection (port 21) with unix program ftp.

If there is no entry, or nothing is specified, this is set to N

Recommendation: If the customer is on a private network, you can leave this as N. If their security team requires all FTP's to be SFTP's, then you should enable this.

- USE_EXIT=Y

Option to exit with return code of ERROR(R00016) instead of 0 when an error, which is defined in the ERROR statement, occurs while using FTP and EXIT statement is specified in the JCL (EXIT statement is specified in PARM).

Recommendation: Leave it as default (Y)

- FTP_HANDLE_DATASET=Y

  #TODO

Recommendation: Leave it as default (Y)

## 1.7 IDCAMS Configuration (idcams.conf)

The IDCAMS utility uses the idcams.conf configuration file in ${OPENFRAME_HOME}/config. When IDCAMS is used by TACF, it will prompt for Username, Group name, and Password which can be defined in the configuration file as well as other features.

### 1.7.1 DEFAULT_USER

- USERNAME
- GROUPNAME
- PASSWORD

Defines the username, groupname, and password for bypassing the prompt by storing the above information. However, if you execute the IDCAMS as a JOB step, the configuration itself is bypassed.

### 1.7.2 TACF

- CHECK_DSAUTH=NO

When TACF is used with IDCAMS, setting the CHECK_DSAUTH to YES performs a permission check upon each access to the dataset from IDCAMS functional commands.

### 1.7.3 AMS

Currently, there are no default values set in the AMS configuration portion of this tool.

## 1.8 IKJEFT01 Configuration (ikjeft01.conf)

Configuration file for the IKJEFT01 utility.

### 1.8.1 SHARED_OBJECT

- DB_USE=YES

Sets whether the database is used or not.

Recommendation: Leave it as default (YES)

- SYSTEM=DBPA

Sets the default database system name

Recommendation: Leave it as default (DBPA)

- DLOPEN_GLOBAL

Option to use externam variables in batch application

Recommendation: Leave it as default (NO)

### 1.8.2 REPORT_DBCONN

- MODULE=${OPENFRAME_HOME}/lib/IKCONN.so

Specifies the shared object module for logging. The extension IKCONN.so for the module is either IKCONN.so or IKCONN.sl according to system devices. Check the IKCONN module extension in the ${OPENFRAME_HOME}/lib directory. 

Recommendation: Leave it as default (${OPENFRAME_HOME/lib/IKCONN.so}). Double check that the extension is correct in ${OPENFRAME_HOME}/lib directory.

- SYSTEM:${SYSTEM_NAME}

The below settings can be changed to match the type of database for the SYSTEM defined in the SHARED_OBJECT section of this configuration file.

* DBTYPE=TIBERO
* DBAUTH=INDIVIDUAL
* DATABASE=
* INSTANCE=
* USERNAME=
* PASSWORD=

Recommendation: If you are using Tibero, the default information provided should be enough. If you are using a different database, make sure you get this information from the database administrator and fill it out here.

### 1.8.3 TACF

- CHECK_PGMAUTH=NO

Checks TACF authorization when IKJEFT01 access a dataset.

Recommendation: Leave it as default (NO). Check with customer to see if they want to change this during production time.

## 1.9 ISRSUPC Configuration (isrsupc.conf)

This configuration file is for the ISRSUPC utilities.

### 1.9.1 LINECMP

- USE_FAST_COMPARE=NO

  #TODO

## 1.10 KEYSEQ Configuration (keyseq.conf)

Dataset Key Sequence Configurations for indexed datasets (VSAM KSDS, or ISAM Datasets) used in OpenFrame. This configuration file specifies whether ASCII or EBCDIC order is used to arrange a datasets key order.

Key sequenced is determined by three rules

* Dataset Name
* Prefix of dataset name
* Suffix of dataset name

If it conforms to all three rules, the priority of the rules is dtermined by the order that they are listed. If a dataset conforms to multiple rules, the rule that matches the most number of characters in the name is selected.

- % : denotes exactly one alphanumeric character
- * : denotes one or more characters within a qualifier

### 1.10.1 DSNAME

Under DSNAME you can specify a full dataset name and set the sort order equal to EBCDIC or ASCII 

Example: 

```
PROD.BILL.%%%%.*=EBCDIC
```

Recommendation: Check with the customer if this is required. It's possible they will want to set up a number of rules, or none. 

### 1.10.2 PREFIX

Selects a key sequence using the prefix of the dataset name

Example:

```
PROD.BILL.=EBCDIC
SYS1.=ASCII
```

Recommendation: Check with the customer if this is required, and set accordingly.

### 1.10.3 SUFFIX

Selects a key sequence using the suffix of the dataset name

Example:

```
.DATA.A1=ASCII
.DATA.B1=EBCDIC
```

Recommendation: Check with the customer if this is required, and set accordingly.

## 1.11 PRINTER Configuration (print.conf)

Allows you to define class, command, and driver for printers. Printers can be defined for each or multiple classes. When a JOB completes, the spool dataset is registered in the OUTPUTQ as an output unit. Then, depending on the classes you have defined in print.conf, it will be sent to that printer.

### 1.11.1 SSPRT

Samsung Printer Configurations

No Configuration settings for this yet

### 1.11.2 PRINTERX

In this section, we can define a printer with the following format:

```bash
[PRINTERX]
  CLASS=
  COMMAND=
  DRIVER_PATH=
```

- PRINTERX

You should rename the X in PRINTER*X* to a 1-byte character between A-Z or 0-9.

- CLASS

You can specify any class letter(s) or number(s) here:

Example: 

```bash
CLASS=AB
```

```bash
CLASS=4
```

- COMMAND

For default printer, you should use the command ```cat```

For an LRS printer, you should use the command ```LRS.sh``` which should be placed in ${OPENFRAME_HOME}/bin directory

<details>
  <summary>Source code for the LRS.sh</summary>

```bash
#!/bin/sh

_FullPath=`echo ${1}`
echo " File Name [" ${_FileName} "]"                                       ### DEBUG
#
_VPSX_SPOOL="/opt/lrs/lrsq/vpsx_spooler_linux.exe"
_VPSX_CONF="/opt/lrs/lrsq/vpsx_spooler_controlfile_linux"

#Martin wanted to have MAXLL as NULL
sed -i 's/MAXLL=.*/MAXLL=/g' ${3}

#cp ${1} ~/

#echo "${_VPSX_SPOOL} -i ${1} -ec ${2} -cc ${3} -control  ${_VPSX_CONF} -d"               ### DEBUG
${_VPSX_SPOOL} -i ${1} -ec ${2} -cc ${3} -control  ${_VPSX_CONF} -d

#${_VPSX_SPOOL} -i ${1} -ec ${2} -cc ${3} -control  ${_VPSX_CONF} -d
```
</details>

- DRIVER_PATH

For default printer, you should use the path: ${OPENFRAME_HOME}/lib/libdfltprt.so

For an LRS printer, you should use the path: ${OPENFRAME_HOME}/lib/liblrsprt.so

### 1.11.3 INTRDR

- DRIVER_PATH=${OPENFRAME_HOME}/lib/libirdrprt.so

Defines the library file path for the internal reader

Recommendation: Leave this as default (${OPENFRAME_HOME}/lib/libirdrprt.so)

### 1.11.4 PMSVR 

- INTERVAL = 50000

Specifies TP scheduling time interval of the ofrpmsvr server (in microseconds)

Recommendation: Leave it as default (50000)

- THRESHOLD = 100

Set the print process retry threshold value

Recommendation: Leave it as default (100)

### 1.11.5 WRITER

No Configurations for this section yet

  #TODO

## 1.12 RETURN CODE Configuration (rc.conf)

Specifies which programs to stop JOB execution for certain return codes by specific number or range.

### 1.12.1 PGM_NAME

Allows for stopping a JOB based on a specific program name

Examples:

- IKJEFT01=8-4095

If IKJEFT01 finishes with a Return Code of anything between 8 and 4095, the JOB will stop at this step.

- IKJEFT01=4,8-4095

If IKJEFT01 finishes with a Return Code of 4, or anything between 8 and 4095, the JOB will stop at this step.

Recommendation: Check with the customer for which programs/utilities they wish to set up a return code configuration for.

### 1.12.2 PGM_TYPE

Allows for stopping a JOB based on a program type.

Examples:

- ALL=16-4095

Recommendation: Check with the customer for which program types they wish to set up a return code configuration for.

## 1.13 SORT Configuration (sort.conf)

This configuration file is for the DFSORT (SYNCSORT, PROSORT) utilities.

### 1.13.1 WORKSPACE

- USE=NO

Sets whether to use the workspace specified in the configuration file. (If set to NO, you may skip this WORKSPACE section)

Recommendation: Leave it as default (NO)

- COUNT=3

Specifies the number of workspaces to use, the default value is 3, and the number can be set up to 10. Each workspace should be numbered from 0 to 9 if using all 10.

Recommendation: Leave it as default (3)

- WORKSPACEX=${OPENFRAME_HOME}/temp/sort0

The X in WORKSPACEX signifies a number starting at 0 working up to 9. Specifies the path of the workspace when USE is set to YES

Recommendation: Leave it as default (Set the path in ${OPENFRAME_HOME}/temp and number the sorts from 0 to 9 with respect to the WORKSPACE number)

### 1.13.2 OPTION

- STABLE_SORT=YES

Specifies whether to use stable sort or not. This setting is for SYNCSORT, and the default is YES. If you use ProSort, use the setting of the ProSort tip file or EQUALS/NOEQUALS

Recommendation: Leave it as default (YES)

- MEMORY_LIMIT=512

Sets the maximume size of memory that SORT can use. If set to 0, it means unlimited. For ProSort, recommendation is between 64 and 512 MB.

Recommendation: Leave it as default (512)

- SEQUENCE=ASCII

Specifies a sort order. This option is for SYNCSORT.

Recommendation: Change this to EBCDIC

- SOLRF=YES

Specifies which length will be used when the SORTOUT record length is not set 

Recommendation: Leave it as default (YES)

- FSZEST=NO

Option to ignore the SIZE option in an OPTION statement.

```
YES: ignore the SIZE option
NO:  Do not ignore the SIZE option
```

Recommendation: Leave it as default (NO)

### 1.13.3 PATH

Currently no configuration changes needed for this section.

### 1.13.4 SEQUENCE

Currently no configuration changes needed for this section.

## 1.14 TEXTRUN Configuration (textrun.conf)

TEXTRUN Tool Configuration file.

### 1.14.1 DEFAULT_USER

Specifies a default user for TEXTRUN if no user is specified.

- USERNAME=${USERNAME}

Specifies the username

Recommendation: Do not specify a user. This will require the user to enter their username

- PASSWORD=${PASSWORD}

Specifies the password

Recommendation: Do not specify a password. This will require the user to enter their password

- GROUPNAME

Specifies the groupname

Recommendation: Do not specify a group name. 

### 1.14.2 EXIT_CODE

- USE_RC_CODE=YES

When set to YES, return codes corresponding to the JOB termination state are enabled

Possible status's include:

```
STOP
FLUSH
```

Recommendation: Leave it as default (YES)

- STOP=253

If STOP status is equal to 253, if the JOB ends with STOP status, the return code 253 will be sent

Recommendation: Set STOP equal to 253

- FLUSH=254

If FLUSH status is equal to 254, if the JOB ends with FLUSH status, the return code 254 will be sent

Recommendation: Set FLUSH equal to 254

### 1.14.3 MONITORING

- RETRY_COUNT=

Specifies the number of times to retry a connection to the JOB monitoring server, in the event the connection is lost. If this option is not specified, the default retry count is set to 3.

Recommendation: Leave it as default (<BLANK>)

- RETRY_INTERVAL

Sets the time interval (in seconds) between attempts to reconnect to a monitoring service. If this option is not specified, the default time interval is 3 seconds.

Recommendation: Leave it as default (<BLANK>)

### 1.14.4 AUTOEDIT

- USE=NO

Specifies whether or not to use the AUTOEDIT syntax of CONTROL-M.

Recommendation: Leave it as default (NO)

### 1.14.5 OPTION

- RUN_NODE=*

This option sets the default node to be used with the -n option is not given during JOB submission. The default value is an asterisk(\*), meaning that a JOB can be executed on any node.

Recommendation: Check with the customer to see if they have a preference on which node a JOB should be run on by default. If they have no preference, then use the asterisk (\*)

- LOG=Y

Logs the TEXTRUN commands in ${OPENFRAME_HOME}/log/cmd

Recommendation: Leave it as default (Y)

## 1.15 TJCLRUN Configuration (tjclrun.conf)

This configuration file determines many of the default values and settings built around batch JOBs. This is a very important configuration file and should be looked at carefully.

### 1.15.1 JOB

If the minimum required parameters for JCL JOBs are omitted, the default values from this configuration file are used.

- CLASS = L

If the class parameter is ommited from the job data, the default job class value is assigned (this attribute is required). Can be any single letter (A-Z) or number (0-9)

Recommendation: Check with the customer what default CLASS they prefer, and set accordingly.

- MSGCLASS = A

If the MSGCLASS parameter is ommited in the job data, the default job MSGCLASS value is assigned (This attribute is required). Can be any single letter (A-Z) or number (0-9)

Recommendation: Check with the customer what default MSGCLASS they prefer, and set accordingly.

- MSGLEVEL[1] = 1

If the first sub-parameter of the MSGLEVEL in the job data is omitted, the default MSGLEVEL value is used (this attribute is required). Can be any number (0-2)

Recommendation: Leave it as default (1)

- MSGLEVEL[2] = 1

If the second sub-parameter of the MSGLEVEL i n the JOB data is omitted, the default MSGLEVEL value is used (This attribute is required). Can be either 0 or 1.

```
0 : Dataset allocation results or log messages are not printed to SYSMSG for the JOB spool.
1 : The dataset allocation results and log messages are printed.
```

Recommendation: Leave it as default (1)

- TIME=NOLIMIT

If the TIME parameter in the job data is omitted, the default job time value is used. If this is not specified, 0 means that the default is set as no time limit (This attribute is optional). The options for this value are described below:

```
minutes: Sets a value between 0 and 357912 in minutes
seconds: Sets a value between 0 and 59 in seconds
NOLIMIT: Has no limit for TIME
MAXIMUM: Uses the maximum value 357912
```

Recommendation: Change this value from NOLIMIT to a set amount of time in minutes. If you want to set it for 1 minute and 10 seconds, it should be like TIME=(1,10)

### 1.15.2 PERFORM

Specifies whether to indicate CPU usage priority and configures CPU priorities

- USE_PERFORM = NO

Specifies whether or not the PERFORM parameter will be used to indicate CPU usage priority (This attribute is optional). If this element is not specified, PERFORM parameters will be ignored in JCL.

Recommendation: Leave it as default (NO)

- <PERFORM_VALUE> = <NICE_VALUE>

A table that maps PEROFRM values to CPU priorities. If USE_PERFORM is set to YES, this must be set as well. PERFORM supports a range of values from 1-999; CPU priorities in UNIX (NICE values) range from 0-39. All values within the mappting table must adhere to these limits.

Here's a little information on NICE_VALUES and Priorities in Linux: [Process "Niceness" vs "Priority"](https://askubuntu.com/questions/656771/process-niceness-vs-priority "From askubuntu.com")

### 1.15.3 DD

Specifies the length of records in the instream-dataset and the count limit of records that can be written in a spool dataset in JCL

- INSDSET_LRECL = 80

Specifies the length of records in the instream-dataset in JCL (This attribute is optional). If the instream-dataset is shorter than the specified length, the dataset will be padded with spaces. If the instream-dataset is longer than the specified length, excess data will be truncated (default: 80)

Recommendation: Leave it as default (80)

- OUTLIM = 0

Specifies the count limit of records that can be written in a spool dataset in JCL (This attribute is optional). A value between 0 and 16777215 can be specified. If the value is less than 0 or greater than 16777215, 0 or 16777215 is used, respectively. If 0 is specified, record count has no limit. If this element is not specified, the default value is 0.

Recommendation: Leave it as default (0)

### 1.15.4 DDTAB

Defines the maximum possible number of JCL DD data used in JCL (including JCL procedures) when tjclrun executes jobs.

- DDTAB_MAX = 1024

Defines the maximum possible number of JCL DD data used in JCL (including JCL procedures) when tjclrun executes jobs (This attribute is optional). The default is 512, and the maximum is 65535. For example, if DDTAB_MAX is set to 1024, up to 1024 D of data (including the JCL procedures called from the job or INPJCL) can be used in a single job. Anything larger is regarded as a possible error and the job will shut down abnormally. The error message "No free DD entry in ddtab" is printed to the SYSMSG. In this case, DDTAB_MAX value can be raised to avoid the error.

Recommendation: Leave it as default (1024)

### 1.15.5 SYSLIB

Configures the default directories for lower level batch execution programs or common library files when tjclrun is run.

- BIN_PATH=${OPENFRAME_HOME}/bin:${OPENFRAME_HOME}/util:${COBDIR}/bin:/usr/local/bin:/bin:${PROTRIEVE_HOME}/bin

Specifies the binary file paths, separated by colon (:). Each customer will have different paths, but anything related to ${OPENFRAME_HOME} should be the same for all environments.

Recommendation: You will need to check the paths for each of these sections, and may be different customer to customer.

- LIB_PATH=${OPENFRAME_HOME}/lib:${OPENFRAME_HOME}/core/lib:${TB_HOME}/client/lib:${COBDIR}/lib:/usr/lib:/lib:/lib/i686:/usr/local/lib:${PROSORT_HOME}/lib:${OFCOB_HOME}/lib:${ODBC_HOME}/lib:${OFPLI_HOME}/lib:${OFASM_HOME}/lib:${PROTRIEVE_HOME}/lib

Specifies the libary file paths, separated by colon (:). Each customer will have different paths, but anything related to ${OPENFRAME_HOME} should be the same for all environments.

Recommendation: You will need to check the paths for each of these sections, and may be different customer to customer.

- COB_PATH=${COBPATH}

Specifies a COBOL directory path.

Recommendation: You will need to check the paths for each of these sections, and may be different customer to customer.

### 1.15.6 PRELOAD

  #TODO

### 1.15.7 PGM

Determines whether or not to invoke the batch program which is compiled as common libraries, using the utilitiy program PGMRTW00 by tjclrun (This attribute is optional).

- USE_PGMRTS00=NO

```
YES : tjclrun invokes the PGMRTS00 utility if the pgoram is not executable and dynamically loads the batch program compiled as common libraries by PGMRTS00.
NO  : tjclrun can only invoke programs compiled as an executable (default)
```

Recommendation: Leave it as default (NO)

### 1.15.8 DBCONN_INFO

Database Connection Information

- DATABASE=

Specifies the name of the Database

Recommendation: Leave it as default (<BLANK>)

- USERNAME= 

Specifies the default username of the Database

Recommendation: Leave it as default (<BLANK>)

- PASSWORD=

Specifies the password of the default user of the Database

Recommendation: Leave it as default (<BLANK>)

### 1.15.9 ACCOUNT

Determines whether the process owner of the invoked batch program should be set to the USER parameter value defined in the JCL.

- SETUID = NO

```
YES : the tjclrun program should be installed as root. Programs invoked during the job process are to be processed as defined by the user in the JCL job. Also, the files and other resources created during the job process ar checked against the job user.
NO  : The operator who booted the TJES system, especially the Runner slot process owner becomes the process owner of any batch programs invoked during tjclrun or job steps. In this case, this user cannot operate as another user with the USER parameter in the JCL job data. All OS level ownerships are checked as the operator and the process owner is also the OS userid of the same operator (DEFAULT).
```

Recommendation: Leave it as default (NO)

### 1.15.10 TACF

Determines whether or not to check the TACF access authority among the TACF support features by tjclrun and the TACF execution authority for the main utility programs in the TACF support features.

- CHECK_DSAUTH=NO

Determines whether or not to check the TACF access authority among the TACF support features by tjclrun (This attribute is optional). 

Recommendation: Leave it as default (NO)

- CHECK_UTAUTH=NO

Determines whether or not to check the TACF execution authority for the main utility programs in the TACF support featurues (This attribute is optional). 

Recommendation: Leave it as default (NO)

### 1.15.11 AMS

Decides whether to keep the connection with AMS while the Runner is running, or to cut and connect whenever needed (This attribute is optional).

- CONNECTION=KEEP

The option to cut and connect whenever needed is NOKEEP while the option to keep the connection with AMS is KEEP.

Recommendation: Leave it as default (KEEP)

### 1.15.12 JCL

Decides whether to omit '//SYSIN DD \*' in the input stream dataset for TRAIL (the end part) of the JCL file

- IGNORE_TRAIL=YES

If the end part of the file is not a JCL line in mainframe, //SYSIN DD * is omitted in the input stream dataset (This attribute is optional). An empty line or unecessary lines are often added in OpenFrame. For this case, the attribute determines whether to ignore the trailing part of the JCL file or to regard as an input stream dataset omitting '//SYSIN DD \*'.

```
YES : The trailing part is ignored and removed (DEFAULT)
NO  : It is treated as the input stream dataset omitting 'SYSIN DD *' line
```

Recommendation: Leave it as default (YES)

- SYMBOL_DELIM=NO

  #TODO

- PASSWORD_ENCRYPT=NO

Option to encrypt a PASSWORD value within INPJCL in JOBSPOOL to "\*" (Default is NO). Note, that this setting is not applied if the line that includes a PASSWORD value is in a comment.

Recommendation: Change this to value to (YES)

### 1.15.13 OPTION

Decides whether to use the largest or the last return code (RC) of a JOB when tjclrun is terminated

- USE_MAX_RC=NO

Deceides whether to use the largest or the last return code of a JOB when tjclrun is terminated (This attribute is optional).

```
YES : The largest RC among RCs of the processed steps is used as the RC of the job.
NO  : The RC of the last processed step is used as RC of the job (DEFAULT)
```

Recommendation: Change this value to (YES)

- PGM_NOT_FOUND=ERROR

Decides whether to throw an error or to flush a job if specified program does not exist in JOB STEP (This attribute is optional).

```
ERROR : Throw an error
FLUSH : Flush a job (DEFAULT)
```

Recommendation: Change this value to (ERROR)

- IGNORE_USER_ABEND=YES

  #TODO

- PUT_DD_INFO

  #TODO

### 1.15.14 DEBUG

Determines whether to print and process profile information to analyze tjclrun performance (This attribute is optional).

- PROFILE=NO

```
YES : The printed log includes date information per process step to help analyze performance.
NO  : The messages are not included. It is recommended that this is not set to YES unless the performance of tjclrun is being analyzed (DEFAULT)
```

Recommendation: Leave it as default (NO)

## 1.16 TJES Configuration (tjes.conf)

OpenFrame's Tmax Job Entry System (TJES) Configuration File. 

### 1.16.1 NODEINFO

Configures information on nodes

- NODENAME=NODE1

Defines the current node name.

Recommendation: Leave it as default (NODE1)

- NODELIST=NODE1

Defines all node names. Node names are separated by semicolon (;).

Recommendation: If you have installed any additional OpenFrame nodes, add them to this list.

### 1.16.2 JOBDEF

This section manages JOBs in TJES.

- STARTNUM=1

Specifies the starting number for a JOBID. 

Recommendation: Leave it as default (1)

- ENDNUM=99999

Specifies the ending JOBID. Therefore, the largest JOBID can be JOB99999 and it would start at JOB00001 with the above settings.

Recommendation: Leave it as default (99999)

- FULL_WARNING=80

Configures the boundary rate (in percent) of the JOBQ before displaying a warning about a full jOBQ. The boundary can be an integer between 0 and 99.

Recommendation: Ask the customer what percent they would like to set.

### 1.16.3 JOBCLASS

This section is for the default properties of the TJES job class.

- ${CLASS}=${STATUS}

We can specify a class here and give a status of either START or HOLD. Any class between A-Z or 0-9 can be given in the CLASS portion, where the STATUS portion can either be START or HOLD. If not specified, START is given to the class.

Recommendation: Check with the customer if there are any JOB classes that are put on HOLD status. They should be defined in this configuration. If the CLASS starts with START, you need not define it.

### 1.16.4 JOBGDEF

### 1.16.5 SCHEDULING

- DUPL_JOBNAME=NO

Decides whether to execute the job with the same JOBNAME concurrently (Default: NO)

Recommendation: Leave it as default (NO)

- PRTYJECL=YES

Defines whether to use the priority in the submitted JCL. (Default: YES)

Recommendation: Leave it as default (YES)

-PRTYJOB=YES

Defines whether to use the priorirty of the submitted JCL (Default: NO)

Recommendation: Change this to (YES)

-PRTYHIGH=10

Defines the maximum value for the priority attribute. Values higher than the maximum value will be ignored. It can be an integer from 0 to 10.

Recommendation: Leave it as default (10)

- PRTYLOW=5

Defines the minimum allowable value for the priority attribute. Values lower than the minimum will be ignored. It can be an integer from 0 to 10.

Recommendation: Leave it as default (5)

- PRTYRATE=1440

Defines a number used in calculating the aging per day rate. The job priority incremements by 1 after a certain amount of time passes. That amount of time is calculated by dividing 86400 seconds by the PRTYRATE given. If you specify 1440 seconds, the job priority will increase by 1 every 60 seconds.

You can specify any number between 0 to 86400

Recommendation: Leave it as default (1440)

- INTERVAL=1

Defines the interval to schedule the scheduler in seconds (Default: 1)

Recommendation: Leave it as default (1)

### 1.16.6 RESOURCE

This section describes the UNIX resources used in the TJES.

- SHMKEY=62039

Configures the shared memory key to communicate between obmjinit and tjclrun in TJES

Recommendation: Leave it as default (62039)

- DBCONN=BASE_ODBC

The ODBC connection named used to access a system database. This name must be defined in the [odbc-section-name] section of ofsys.conf. 

Recommendation: Check your ODBC connection settings. If everything is default, it will most likely be BASE_ODBC.

### 1.16.7 PROCLIB

This section describes the dataset required to operate a JOB.

- JCLLIB=SYS1.JCLLIB:${JCL_PATH}

If executing a JCL without the specific path, the JCL will be executed based on the priority list given above.

Recommendation: Change this to fit the customer's requirements. Customers will most likely have a PDS they execute JCL from by prirority.

- USERLIB=SYS1.USERLIB:${COB_PATH}

This list is a concatenation of the COBOL PDSs used for Batch. Similar to JCLLIB, it is priority based, and seperated by colon (:).

Recommendation: Change this to fit the customer's requirements. Customers will most likely have multiple COBOL PDSs and whichever is priority should come first in the list, and visa versa.

-PROC00=SYS1.PROCLIB:${PROC_PATH}

Similar to JCLLIB and USERLIB, this is where Procedures are called from on a priority basis separated by colon (:)

Recommendation: Change this to fit the customer's requirements. Customers may have multiple Procedure PDSs so they should be listed on priority basis.

### 1.16.8 DYNAMIC_LIBRARY

- TEMPLIB=SYS1.TEMPLIB

Specifies the TEMP Libraries. This is the name of the PDS dataset to be used for temporarily saving the existing library when the user library is modified.

Recommendation: You should be able to leave this as default, but check with the customer if they have a similar PDS name on the mainframe that they use. If so, change SYS1.TEMPLIB to that PDS name.

### 1.16.9 LOG

- JOBLOG=${OPENFRAME_HOME}/log/joblog/job.log

Assigns a file path for the JOBLOG which logs the status of the changes of the JOBs

Recommendation: Leave it as default (${OPENFRAME_HOME}/log/joblog/job.log)

- SUBMITLOG=${OPENFRAME_HOME}/log/submitlog/submit.log

Assigns a file path of SUBMITLOG which logs the JCL submit trials and results.

Recommendation: Leave it as default (${OPENFRAME_HOME}/log/submitlog/submit.log)

### 1.16.10 SPOOL

- SPOOL_VOLUME_SER=VSPOOL

This defines SPOOL VOLUME SERIAL defined in the volume.conf configuration file.

Recommendation: Check what the customer wants to name the spool volume serial and assign this variable as well as define it in volume.conf configuration file.

- SPOOL_BACKUP_DIR=${OPENFRAME_HOME}/spbackup

Defines the directory for storing the spool backup data when using the BACKUP feature.

Recommendation: Leave it as default (${OPENFRAME_HOME}/spbackup)

- SPOOL_UNPACK_DIR=${OPENFRAME_HOME}/spunpack

Defines the directory used for decompressed spools from backups

Recommendation: Leave it as default (${OPENFRAME_HOME}/spunpack)

- USE_DATABASE=NO

  #TODO

- SYSOUT_AS_A_FILE=NO

  #TODO

### 1.16.11 INTRDR

- HOLD=NO

Defines whether the job status should be set to HOLD when the JCL is submitted by an internal reader

Recommendation: Leave it as default (NO)

- NODENAME=NODE1

Defines which node to execute the job when the JCL is submitted by an internal reader

Recommendation: If you have more than one node, you should check which node will be your main node to submit JCL to if submitted by an internal reader.

- USERNAME=${USERNAME}

Sets which user is to receive the TACF certificate when the JCL is submitted using an internal reader

Recommendation: Specify a Username that the customer already uses on the mainframe.

- GROUPNAME=${GROUPNAME}

Defines which user group is to receive the TACF certificate when the JCL is submitted using an internal reader.

Recommendation: Specify a group that the customer already uses on the mainframe

- PASSWORD=${PASSWORD}

Sets the password for the user to receive the TACF certification when the JCL is submitted using an internal reader

Recommendation: Check with the customer what the user's password will be and set it here.

- ENPASSWD=****

This attribute encrypts the user password to receive the TACF certificate when the JCL is submitted using an internal reader

*Either the PASSWORD or ENPASSWD field should be configured, not both. To configure only one or the other, Add a pound symbol (#) before the line to comment it.*

### 1.16.12 INITDEF

This section describes the initial configuration values of the RUNNER in TJES.

- INITNUM=${VALUE}

Defines the total slot count of the node. Usually, 11 is defined, but there is no limit for the number of slots, except for the size of the memory installed on the machine. One runner will reqire a 256 bytes of memory to be allocated by obmjinit. It's recommended to use less than 500 slots and manage it as CLASS ACTIVE, and INACTIVE.

Recommendation: Run the JCL described in the initiator_config section of this guide on the mainframe to determine the ACTIVE initiators and how many are required for OpenFrame.

[Link to Initiator Configuration JCL](./initiator_config/README.md)

### 1.16.13 OUTCLASS

### 1.16.14 OUTDEF

### 1.16.15 TACF

### 1.16.16 OPRMSG

***
***
***

* **ofosc.seq**
* **ofstudio.conf**
* **ofsys.seq**

  Base: Contains general system settings for OpenFrame (Mainly those regarding the system directory structure)


* **osc._servername_.conf**

  OSC: This file contains environment variables that apply to the OSC application server named _servername_. If the OSC application server name is OSC00001, then the file name will become osc.OSC00001.conf. Some of the environment variables in osc._servername_.conf can also be found in the osc.conf file, possibly with different values. Where duplicates exist, the value in the osc._servername_.conf always takes precedence. Below is sections of the OSC._servername_.conf in more detail:

  <details><summary>Click here for more information about osc._servername_.conf</summary>
    <p>

    - CPM: Specifies the CCSID number which will be used by the OSC application server and the TN3270 client.
      - REGION_CCSID: Specifies the CCSID number that the OSC application server will use. A maximum of one CCSID can be specified.
      - 3270_CCSID: Specifies the CCSID number that the TN3270 emulator will use. A maximum of two CCSIDs can be specified. If a 1-byte character code page and a 2-byte character code page are used together, as with the Japanese language, two CCSIDs must be set together. CCSID is an abbreviation for Coded Character Set Identifier, which is used by IBM to identify a specific encoding of a specific code page. CCSID enables transmission of data between the OSC application server and the TN3270 emulator. The OSC application server uses ASCII strings while the TN3270 emulator uses EBCDIC strings. Therefore, it is necessary for the OSC application to convert strings either to receive or sent them. During the conversation, the server refers to CCSID values specified in the [CPM] section.
      - The following are the most communly used values
        - 37: COM EUROPE EBCDIC
        - 290: JAPANESE EBCDIC
        - 300: JAPAN DB EBCDIC
        - 437: USA PC-DATA
        - 933: KOREAN MIX EBCDIC
        - 943: JAPAN OPEN
        - 949: KOREA KS PC-DATA

        For more information about CCSID, visit https://www-01.ibm.com/software/globalization/ccsid/ccsid_registered.html

        Below is an example of the [CPM] section:

        ```
        [CPM]
        REGION_CCSID=437
        3270_CCSID=37
        ```

    - CPM_FLAG: Sets CPM flag options used when converting EBCDIC to ASCII or visa versa.
      - EBCDIC_TO_ASCII: Flag used when converting EBCDIC to ASCII
        - CPM_CONVERT_SOSI_TO_NULL: convert SOSI to NULL. (Default). 
        - CPM_CONVERT_SOSI_TO_SPACE: convert SOSI to SPACE.
      - ASCII_TO_EBCDIC: Flag used when converting ASCII to EBCDIC
        - CPM_CONVERT_SOSI_TO_NULL: convert SOSI to NULL. (Default).
        - CPM_CONVERT_SOSI_TO_SPACE: convert SOSI to SPACE

        Below is an example of the [CPM_FLAG] section:

        ```
        [CPM_FLAG]
        EBCDIC_TO_ASCII=CPM_CONVERT_SOSI_TO_NULL
        ASCII_TO_EBCDIC=CPM_CONVERT_SOSI_TO_NULL
        ```

    - GENERAL: Contains startup, operation, and resource information for the OSC application server.
      - ACBLIB_DSNAME: Specifies the name of the data set where ACBLIB information is stored when DL/I is used in OSC.
      - CBLPSHPOP: Specifies whether or not the PUSH/POP functions will be used for handler information, in cases where other programs are called from in a COBOL program with the CALL command.
      - CWA_SIZE: Sets the size of the shared memory block where the COmmon Work Area (CWA) information is stored (decimal, bytes).
      - FREEKB: Specifies whether to disable keyboard lock when shutting down a transaction (Default: NO)
      - GMTEXT: Sets the message used in GMTRAN (maximum of 246 characters, excluding quotation marks). (Default: 'OpenFrame OSC System')
      - GMTRAN: Specifies the ID of a transaction to be automatically executed when a terminal connects for the first time (Default: CSGM)
      - IMSID: Specifies an OSI Control region name that manages DB information when DL/I is used in OSC.
      - JOBID: Designates the JOB ID for the OSC system. A JOB ID is composed of 3 letters (do not use JOB) and 5 numbers. A unique value must be set in all the regions of OSC, and there must not be a duplicate value. The specified JOB ID is used as a directory name created under the ${OPENFRAME_HOME}/spool directory, when OSC uses spool data. When the SPOOL WRITE command is used, the spool data will be stored in the directory which has the same name as the specified JOBID. When the WRITEQ TD command is used, data will be created in a directory named 'JOBID' and the SPR ID of the server process that executed the command.
      - JOBNAME: Specifies a JOB name for the OSC region (8 Byte String).
      - MAPDIR: Specifies the directory where OSC maps will be stored. If no MAPDIR is specified, OSC uses ${OPENFRAME_HOME}/osc/region/{Region name}/map
      - MC: Specifeis whether or not the Transaction Monitoring function of OSC will be used
      - MSGCLASS: Specifies the default SYSOUTCLASS of TPEFILE(OUTPUT) among EXTRA TDQ
      - NOUSE: Specifies modules that will NOT be used by the OSC system. To specify more than one module, seperate module names with commas. 
        - DL: DL/I function
        - DS: Data set access function (If specified, file, TSQ, TDQ and Spool cannot be used)
        - MS: MSC access function.
        - NC: NCS (Named Counter Server) access function.
        - SA: SAF (TACF) access function
        - SP: Spool Access Function
        - TS: TSQ access function
        - AS: OFASM module
    - SAF: Contains security-related environment variables.
    - SD: Contains environment variables related to system definition data sets used by the OSC application server.
    - TDQ: Contains environment variables related to the Transient Data Queue (TDQ).
    - TSQ: Contains environment variables related to the Temporary Storage Queue (TSQ)
    - TRANCLASS: Contains environment variables related to the Tranclass of a region.
  </p></details>

* **osc.conf**

  OSC: used to configure the TSAM and OSC system settings that are common to all OpenFrame OSC regions. This eliminates the need to individually configure duplicate settings in each osc._servername_.conf file 

  <details><summary>Click here for more information about osc.conf</summary>
    <p>

    - Sections:

      - GENERAL: Contains information related to starting up and operating OSC regions. Also contains resource information settings.
        - SYSTEM_LOGLVL: Sets the log level of the OSC SYSTEM (#TODO: Example Range)
        - NCS_FILE: Designates a temporary file which stores information used by the Named Counter Service (NCS).
        - NCS_WRITE_COUNT: Specifies whether to manage the information used in in a disk (AUX), or in memory (MAIN). (Default Value: AUX)
        - NCS_WRITE_COUNT: Stores a value in NCS_FILE for every specified count and increments a value in a unit specified in a count when NCS_STORAGE=AUX. Specifies a value in multiples of 1 or 10.
        - XA_TSAM_DB: Specifies OPENINFO value in the DB section of a Tmax configuration file to support TSAM-XA.
        - ASMTBL: Enables loading ASM tables to shared memory. (Default value: NO)
        - DBCONN: odbc-section-name in ofsys.conf (#TODO: Create link)
      - TSAM_CLIENT: Contains connection information used for managing user VSAM data sets in an OSC system.
        - USERNAME: Username used to connect to TSAM
        - PASSWORD: Password (plaintext string) used to connect to TSAM. If ENPASSWD is also specified, ENPASSWD will take precedence.
        - ENPASSWD: Encrypted password (hexadecimal) used to connect to TSAM
        - DATABASE: Tibero database connection address used by TSAM. TB_SID registered in tbnet_alias.tbr of Tibero is used

          Example of TSAM_CLIENT section:

          ```
          [TSAM_CLIENT]
          USERNAME=oframe
          PASSWORD=tmax1234
          DATABASE=TVSAM
          ```

      - TSAM_BACKUP: Contains backup connection information that will be used if a connection to TSAM_CLIENT cannot be made
        - USERNAME: Username used to connect to TSAM
        - PASSWORD: Password (plaintext string) used to connect to TSAM. If ENPASSWD is also specified, ENPASSWD will take precedence.
        - ENPASSWD: Encrypted password (hexadecimal), used to connect to TSAM.
        - DATABASE: Tibero database connection address used by TSAM. The TB_SID registered in the Tibero file; tbnet_alias.tbr is used.
        - RETRY_COUNT: The number of times to try reconnecting to the backup address, if the connection to TSAM fails.
        - RETRY_INTERVAL: The interval (in seconds) between attempts to reconnect to the backup server.

        Example of TSAM_BACKUP section:

        ```
        [TSAM_BACKUP]
        USERNAME=oframe
        PASSWORD=tmax1234
        DATABASE=TVSAM
        RETRY_COUNT=10
        RETRY_INTERVAL=10
        ```

      - OSCMCSVR: Contains environment variables related to OSCMCSVR, on OSC system server
        - REGION: Specifies the number of regions that will use the monitoring function. This number must match the number of regions listed below.
        - REGION\__regionname_: _regionname_ is replaced by each OSC region name. Designates teh logged areas in the data section fields of the performance record. Each area is givin in the form of 'Offset-Length', and each offset must be specified sequentially.

        Example of OSCMCSVR section:

        ```
        [OSCMCSVR]
        REGION=2
        REGION_OSC00001=0-10,100-30
        REGION_OSC00002=100-50,200-10,300-65
        ```

      - OSCSCSVR: Contains environment variables related to oSCSCSVR, an OSC system server
          - BACKUP: Sets whether or not to back up unexpired scheduling information 
            - NONE: No Backups. (Default)
            - TSAM: Back up through a TSAM data set
          - BACKUP_DATASET: Specifies the data set where the scheduling information that has not expired will be backed up. This item has no effect if the backup item is set to NONE. The data set must be in KSDS format, with a 20 byte key field. Record length can be variable and must be between 20 and 32700 bytes long.
      - OSCOLSVR: Contains environment variables related to OSCOLSVR, an OSC system server
        - BUFFERING_SIZE: Specifies the buffering type and buffer size for the service logs. If the field is not specified, buffering is disabled and the size of the default buffer depends on the system. 
          - LINE: Characters are line buffered and are transmitted when a newline character is encountered.
          - size: Characters are block buffered and are transmitted in blocks of a specified size (bytes).
        - FLUSH_INTERNAL: Specifies the interval at which the buffered data are flushed. If the field is specified as 0, the buffered data are flushed immediately.

        Example of the OSCOLSVR section:

        ```
        [OSCOLSVR]
        BUFFER_SIZE=4096
        FLUSH_INTERVAL=0
        ```

      - OSCOSSVR: Contains environment variables related to OSCOSSVR, an OSC system server
        - DEPLOY_SOURCE_PATH: Source path of an OSC module to deploy

        Example of the OSCOSSVR section:

        ```
        [OSCOSSVR]
        DEPLOY_SOURCE_PATH=$OPENFRAME_HOME/rdom
        ```
  </p></details>

* **osc.lu.conf**
* **osc._REGION_.conf** 
  <details>
    <summary>Click here for more details about osc._REGION_.conf</summary>
      SYSID=NAME - NAME MUST BE UNIQUE
  </details>
* **osc.region.list**
* **osc._IMSID_.conf**

  OSI: Configuration file where items to be applied by IMSID in the OSI system are configured. If the actual environment configuration file name's IMSID is IMSA, then the file will be named "osi.IMSA.conf"

* **osi.conf**

  OSI: Configuration File which is mutually referred to in all the modules of the OSI system. It configures all the items which will be mutually applied to all the server types supported in OSI

* **osi.ofsys.seq**

  OSI: In the OSI system, the tmax servers which will start when osiboot is performed by specifying the name of Base, Batch and TACF, servers excluding the system server (control region), can be selected. Each server of the TN3270 Gateway is included.

* **osi.ofsys.seq_for_OSI_ONLY**
* **osi.ofsys.seq_orig**
* **saf.conf**

  Base: Contains the OpenFrame System Access control settings
  TACF: Specifies the basic information necessary for operations of TACF, specifies the authentication method used in TACF, specifies the configurations needed in SASVR, Specifies an output message for a previous user-defined error code when checking a password in a user created function (saf_exit).

* **smf.conf**
* **sms.conf**

We need to know the DEFAULT storage volume.

Default LRECL and RECFM of a created dataset. Defautls are LRECL=80 and RECFM=FB, we need to know if this is the same on the mainframe or not.

* **ssm.IMSADB2T.conf**
* **tacf.conf**

  TACF: When TACF is installed, the TACF configuration file tacf.conf is generated. This file contains basic TACF configuration information, specifies resource information for TACF ODBC connection, specifies whether TACF will check the group that users belong to when they attempt to access resources, and specifies to control whether RACF allows users to access datasets whos profiles are not registered in TACF.

* **tjes.conf**

  - JOBCLASS
      + What: Specifies what a JOB should do when submitted on OpenFrame. (START, HOLD, etc)
      + Where: ${OPENFRAME_HOME}/config/tjes.conf
      + How: Add a line after the existing JOBCLASS section for additional classes 
      + Example:
      <pre>
      [JOBCLASS]
      A=START
      B=HOLD
      <b>C=START</b></pre>

* **tjesmgr.conf**
* **tso.conf**
* **unit.conf**
* **volume.conf**
* **vtam.conf**

**Reference Documents:**
<details><summary>Click Here for Reference Documents</summary>

  * **Base:** OpenFrame_Base_7_Fix#3_Base_Guide_v2.14_en.pdf
  * **OSI:** OpenFrame_OSI_7.1_Administrator's_Guide_V2.1.1_en.pdf
  * **OSC:** OpenFrame_OSC_7_Fix#3_Administrator's_Guide_v2.1.5_en.pdf
  * **TACF:** OpenFrame_TACF_7_Fix#3_Administrator's_Guide_v2.1.4_en.pdf
  * **HiDB:** OpenFrame_HiDB_7.1_HiDB_Guide_v2.1.4_en.pdf

</details>
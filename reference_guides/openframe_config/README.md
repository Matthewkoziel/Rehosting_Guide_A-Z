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
  - [tjesmgr.conf](#117-tjesmgr-configuration-tjesmgrconf "TJESMGR Configuration")
    - [DEFAULT_OPTION](#1171-default-option "Default Options for TJESMGR")
    - [DEFAULT_USER](#1172-default-user "Default User for TJESMGR")
    - [TACF](#1173-tacf "TACF Configuration for TJESMGR")
  - [tso.conf](#118-time-sharing-option-configuration-tsoconf "TSO Configuration")
    - [COMMON](#1181-common "COMMON TSO Configurations")
    - [MAP](#1182-map "TSO MAP Configurations")
    - [TSOMGR](#1183-tsomgr "TSOMGR Configurations")
    - [LOGIN_PROC](#1184-login-proc "TSO Login Configurations")
    - [SMTP](#1185-smtp "TSO SMTP Configurations")
  - [unit.conf](#119-unit-configuration-unitconf "Unit Configurations for OpenFrame")
    - [HEADER](#1191-header "Define Max Number of Devices")
    - [DEVICE](#1192-device "Define Devices")
    - [ESOTERIC](#1193-esoteric "Device Groups")
  - [volume.conf](#120-volume-configuration-volumeconf "OpenFrame Volume Configuration")
    - [HEADER](#1201-header "Define Max Volumes")
    - [VOLUME](#1202-volume "Define Volumes")
    - [TABLESPACE](#1203-tablespace "Tablespace Configuration")
- [Online Related](#2-online-related "Configuration Files related to ONLINE Systems")
  - [OpenFrame Subsystem for CICS](#21-osc "OSC Configurations")

# 1. Batch Related

**General Information:** For anything commented out, the default values shown will be used. For the majority of the commented out settings, the default values will be sufficient. If you must investigate the options in more detail, please consult the manuals.

## 1.1 Dataset Configuration (ds.conf)

This configuration file stores general configuration settings for datasets used in OpenFrame.

More information about ds.conf can be found in the manual: OpenFrame_Base_Fix#3_Data Set Guide_v2.1.3_en.pdf

### 1.1.1 Dataset Directory

Stores information on where the schema files should be pulled from for dsmigin/dsmigout.

*Recommendation:* Leave it as default ($OPENFRAME_HOME/schema)

### 1.1.2 Dataset Resource

Shared Memory Key for dataset allocation information

*Recommendation:* Leave it as default (61482)

### 1.1.3 Dataset Default

Default information regarding datasets

- DEFAULT_VOLSER=DEFVOL

It's unlikely the customer has a default volume called DEFVOL in the mainframe, recommend to change this to their main volume. To create a volume, check the voladd tool #TODO

*** 

- SPOOL_VOLSER=VSPOOL

This describes the name of the Spool's Volume Serial. 

*Recommendation:* Leave it as default (VSPOOL)

***

- NVSM_BUFFER_SIZE=512

Size of the non-vsam dataset buffer in Kilobytes. 

*Recommendation:* Leave it as default (512)

***

- NVSM_EXTENT_LIMIT=50

Maximum Extent number of the non-vsam dataset

*Recommendation:* Find mainframe equivalent and set value equal. (Default=50)

***

- DSALC_SLOT_COUNT=65535

Maximum number of slots allocated for a dataset. Must be a number between 256 and 65535. 

*Recommendation:* Leave it as default (65535)

***

- CHECK_DSAUTH_V2=NO

This option checks the permissions in the dataset allocation. Can be easier to handle if we leave this on NO at the start of the project, then change it to YES later.

*Recommendation:* Leave it as default (NO), Then change it to YES in production.

***

- USE_BDAM_AS_TSAM=NO

Use Tibero/TSAM as BDAM.

*Recommendation:* Leave it as default (NO)

*** 

- SET_PDS_SIZE_TOTAL=NO

Calculate size of a PDS by adding up the sizes of all members

*Recommendation:* Ask the customer what they would prefer

***

- PASSED_NEW_DATASET_DISP=KEEP

  #TODO

***

- SET_OUTPUT_DCB_TO_SMS=NO

Specifies the DCB information of an output dataset for utilities such as SORT and IEBGENER to the SMS class following ACS rules, or to the DCB information of the input dataset.

*Recommendation:* Leave it as default (NO)

***

- SET_GDG_DATASET_SORT_TYPE=LIFO

Sets the GDG Dataset sort type to Last in - First Out

*Recommendation:* Leave it as default (LIFO)

***

- GDG_SCRATCH_DEFAULT

Sets the GDG scratch setting to either NOSCRATCH or SCRATCH.

*Recommendation:* Leave it as default (NOSCRATCH)

***

- UPDATE_GENERATION_AT_END_OF_STEP=YES

Updates the GDG generation at the end of a JOB step

*Recommendation:* Leave it as default (YES)

***

- SAME_RELATIVE_GDSNUM_IN_JOB

  #TODO

*Recommendation:* Leave it as default (YES)

***

- DELETE_GDS_AT_END_OF_STEP=YES

  #TODO

*Recommendation:* Leave it as default (YES)

### 1.1.4 Dataset Lock

- LOCK_FLAG=LOCK

Send LOCK related client requests such as lock, unlock, lock clear, and lock list query to the lock server.

  * LOCK: Sends to the lock server
  * NOLOCK: Does not send to the lock server

*Recommendation:* Leave it as default (LOCK)

***

- REQUEST_RETRYINTERVAL=5

Retry Interval for failed lock client requests

*Recommendation:* Leave it as default (5)

***

- DBCONN=LOCK_ODBC

ODBC connection name (odbc-section-name) used to connect to the database. The odbc-section-name must be specified in the ofsys.conf file.

*Recommendation:* Check the ofsys.conf file. In cases where the ODBC connection was set in a standard, default manner, the name will be LOCK_ODBC.

## 1.2 Dataset Tool Configuration (dstool.conf)

Contains settings for dataset related tool programs such as Command section in OFManager, dsload, dsview, dsmigin, etc.This configuration file is separated by each tool, including a common section which will cover all tools below.

### 1.2.1 Common

Currently, there are no default values set in the COMMON configuration portion of this tool.

### 1.2.2 COBGENSCH

- ODO_MIN_ZERO_AVAILABLE=NO

Set the Occurs Depending On minimum to zero (YES|NO)

*Recommendation:* Leave it as default (NO)

### 1.2.3 DSLOAD

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

### 1.2.4 DSVIEW

NOCATALOG_VIEW=YES

This setting allows non-VSAM datasets to still be viewed, even if they're not cataloged. This can be handy when trying to view a dataset using spfedit, but the dataset is not cataloged. If you still wish to see it, you can  use dsview.

*Recommendation:* Leave it as default (YES)

### 1.2.5 DSMIGIN

Currently, there are no default values set in the DSMIGIN configuration portion of this tool.

### 1.2.6 DSCREATE

- RECAT_UPDATE_DSATTR=YES

Option to update the attributes of a dataset when the RECATALOG option is used

*Recommendation:* Leave it as default (YES)

### 1.2.7 OFRDMSVR

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

### 1.2.8 OFRUISVR

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

### 1.2.9 OFRDSEDT

Currently, there are no default values set in the OFRDSEDT configuration portion of this tool.

### 1.2.10 SPFEDIT

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

## 1.3 CPM Configuration (cpm.conf)

The cpm.conf configuration file contains the settings for conversion process from EBCDIC to ASCII and ASCII to EBCDIC.

### 1.3.1 DEFAULT_CODEPAGE

- EBC2ASC=${OPENFRAME_HOME}/cpm/EBCASCUS.cpm

Sets the EBCDIC to ASCII cpm file. There are many different cpm files in ${OPENFRAME_HOME}/cpm which can be modified using the cpmmgr tool. Learn more about the cpmmgr tool here: #TODO

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/cpm/EBCASCUS.cpm)

***

- ASC2EBC=${OPENFRAME_HOME}/cpm/ASCEBCUS.cpm

Sets the ASCII to EBCDIC cpm file. 

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/cpm/ASCEBCUS.cpm)

***

- SO=0A42

Sets the SO hexa code for SOSI characters in mainframe.

*Recommendation:* Confirm with customer the SOSI values and set accordingly

***

- SI=0A41

Sets the SI hexa code for SOSI characters in mainframe

*Recommendation:* Confirm with customer the SOSI values and set accordingly

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

*Recommendation:* Check to make sure your cpm file is linked to the EBCASCUS.cpm file. If there is a custom file used instead, you will have to change this configuration to use the same cpm file here.

### 1.4.2 A2E

- US=ASCEBCUS.cpm

*Recommendation:* Check to make sure your cpm file is linked to the ASCEBCUS.cpm file. If there is a custom file used instead, you will have to change this configuration to use the same cpm file here.

## 1.5 EZPLUS Configuration (ezplus.conf)

ezplus.conf is a configuration file for the EZTPA00 utility which is used to execute CA-Easytrieve Plus scripts entered as SYSIN from JCL.

### 1.5.1 EZV

- WORK_DIR=${OPENFRAME_HOME}/temp/ezwork

Specifies a work area for calling ProTrieve from EZTPA00. It is used to temporarily save the script to transfer to ProTrieve.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/temp/ezwork)

## 1.6 FTP Configuration (ftp.conf)

This configuration file has settings related to the FTP utility in OpenFrame. Please do not confuse this configuration file with the Linux FTP tool.

### 1.6.1 DIRECTORY

- FTP_WORK_DIR=${OPENFRAME_HOME}/volume_default

Sets the work directory that is used for the FTP program to send data to the FTP server. If there is no entry, or nothing is specified, the [DIRECTORY] TEMP_DIR from the ofsys.conf is specified by default.

*Recommendation:* Check with the customer what volume you wish to send FTP'd files to.

### 1.6.2 UNIT

- DEFAULT=3380

Sets the default unit to be used for the FTP utility to send and receive datasets. If there is no entry, or nothing is specified, the value from the DEFAULT_VOLSER parameter, under [DATASET_DEFAULT] in ds.conf is used.

### 1.6.3 DATASET_DEFAULT

- CHECK_DSAUTH_V2=YES

Determines whether to check permission to allocate datasets.

  * YES: Checks permission for the dataset
  * NO:  Does not check permission for the dataset (DEFAULT)

*Recommendation:* Leave it as default until near ready for production.

### 1.6.4 ERROR

These are just messages that can be returned to the user for various errors.

*Recommendation:* Leave them all as default.

### 1.6.5 COMMAND_OPERATION

- PUT_COND=N

Determines how to process the PUT command if the dataset does not exist. If there is no entry, or nothing is specified, NO is specified by default.

*Recommendation:* Leave it as default (N)

### 1.6.6 OPTION

- SECURE_FTP=N

Option to use SFTP mode. If set to Y, the FTP utility uses secured connection (port 22) with unix program lftp. If N, the FTP utility uses normal connection (port 21) with unix program ftp.

If there is no entry, or nothing is specified, this is set to N

*Recommendation:* If the customer is on a private network, you can leave this as N. If their security team requires all FTP's to be SFTP's, then you should enable this.

***

- USE_EXIT=Y

Option to exit with return code of ERROR(R00016) instead of 0 when an error, which is defined in the ERROR statement, occurs while using FTP and EXIT statement is specified in the JCL (EXIT statement is specified in PARM).

*Recommendation:* Leave it as default (Y)

***

- FTP_HANDLE_DATASET=Y

  #TODO

*Recommendation:* Leave it as default (Y)

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

*Recommendation:* Leave it as default (YES)

- SYSTEM=DBPA

Sets the default database system name

*Recommendation:* Leave it as default (DBPA)

- DLOPEN_GLOBAL

Option to use externam variables in batch application

*Recommendation:* Leave it as default (NO)

### 1.8.2 REPORT_DBCONN

- MODULE=${OPENFRAME_HOME}/lib/IKCONN.so

Specifies the shared object module for logging. The extension IKCONN.so for the module is either IKCONN.so or IKCONN.sl according to system devices. Check the IKCONN module extension in the ${OPENFRAME_HOME}/lib directory. 

*Recommendation:* Leave it as default (${OPENFRAME_HOME/lib/IKCONN.so}). Double check that the extension is correct in ${OPENFRAME_HOME}/lib directory.

***

- SYSTEM:${SYSTEM_NAME}

The below settings can be changed to match the type of database for the SYSTEM defined in the SHARED_OBJECT section of this configuration file.

* DBTYPE=TIBERO
* DBAUTH=INDIVIDUAL
* DATABASE=
* INSTANCE=
* USERNAME=
* PASSWORD=

*Recommendation:* If you are using Tibero, the default information provided should be enough. If you are using a different database, make sure you get this information from the database administrator and fill it out here.

### 1.8.3 TACF

- CHECK_PGMAUTH=NO

Checks TACF authorization when IKJEFT01 access a dataset.

*Recommendation:* Leave it as default (NO). Check with customer to see if they want to change this during production time.

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

*Recommendation:* Check with the customer if this is required. It's possible they will want to set up a number of rules, or none. 

### 1.10.2 PREFIX

Selects a key sequence using the prefix of the dataset name

Example:

```
PROD.BILL.=EBCDIC
SYS1.=ASCII
```

*Recommendation:* Check with the customer if this is required, and set accordingly.

### 1.10.3 SUFFIX

Selects a key sequence using the suffix of the dataset name

Example:

```
.DATA.A1=ASCII
.DATA.B1=EBCDIC
```

*Recommendation:* Check with the customer if this is required, and set accordingly.

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

*Recommendation:* Leave this as default (${OPENFRAME_HOME}/lib/libirdrprt.so)

### 1.11.4 PMSVR 

- INTERVAL = 50000

Specifies TP scheduling time interval of the ofrpmsvr server (in microseconds)

*Recommendation:* Leave it as default (50000)

***

- THRESHOLD = 100

Set the print process retry threshold value

*Recommendation:* Leave it as default (100)

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

*Recommendation:* Check with the customer for which programs/utilities they wish to set up a return code configuration for.

### 1.12.2 PGM_TYPE

Allows for stopping a JOB based on a program type.

Examples:

- ALL=16-4095

*Recommendation:* Check with the customer for which program types they wish to set up a return code configuration for.

## 1.13 SORT Configuration (sort.conf)

This configuration file is for the DFSORT (SYNCSORT, PROSORT) utilities.

### 1.13.1 WORKSPACE

- USE=NO

Sets whether to use the workspace specified in the configuration file. (If set to NO, you may skip this WORKSPACE section)

*Recommendation:* Leave it as default (NO)

***

- COUNT=3

Specifies the number of workspaces to use, the default value is 3, and the number can be set up to 10. Each workspace should be numbered from 0 to 9 if using all 10.

*Recommendation:* Leave it as default (3)

***

- WORKSPACEX=${OPENFRAME_HOME}/temp/sort0

The X in WORKSPACEX signifies a number starting at 0 working up to 9. Specifies the path of the workspace when USE is set to YES

*Recommendation:* Leave it as default (Set the path in ${OPENFRAME_HOME}/temp and number the sorts from 0 to 9 with respect to the WORKSPACE number)

### 1.13.2 OPTION

- STABLE_SORT=YES

Specifies whether to use stable sort or not. This setting is for SYNCSORT, and the default is YES. If you use ProSort, use the setting of the ProSort tip file or EQUALS/NOEQUALS

*Recommendation:* Leave it as default (YES)

***

- MEMORY_LIMIT=512

Sets the maximume size of memory that SORT can use. If set to 0, it means unlimited. For ProSort, recommendation is between 64 and 512 MB.

*Recommendation:* Leave it as default (512)

***

- SEQUENCE=ASCII

Specifies a sort order. This option is for SYNCSORT.

*Recommendation:* Change this to EBCDIC

***

- SOLRF=YES

Specifies which length will be used when the SORTOUT record length is not set 

*Recommendation:* Leave it as default (YES)

***

- FSZEST=NO

Option to ignore the SIZE option in an OPTION statement.

```
YES: ignore the SIZE option
NO:  Do not ignore the SIZE option
```

*Recommendation:* Leave it as default (NO)

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

*Recommendation:* Do not specify a user. This will require the user to enter their username

***

- PASSWORD=${PASSWORD}

Specifies the password

*Recommendation:* Do not specify a password. This will require the user to enter their password

***

- GROUPNAME

Specifies the groupname

*Recommendation:* Do not specify a group name. 

### 1.14.2 EXIT_CODE

- USE_RC_CODE=YES

When set to YES, return codes corresponding to the JOB termination state are enabled

Possible status's include:

```
STOP
FLUSH
```

*Recommendation:* Leave it as default (YES)

***

- STOP=253

If STOP status is equal to 253, if the JOB ends with STOP status, the return code 253 will be sent

*Recommendation:* Set STOP equal to 253

***

- FLUSH=254

If FLUSH status is equal to 254, if the JOB ends with FLUSH status, the return code 254 will be sent

*Recommendation:* Set FLUSH equal to 254

### 1.14.3 MONITORING

- RETRY_COUNT=

Specifies the number of times to retry a connection to the JOB monitoring server, in the event the connection is lost. If this option is not specified, the default retry count is set to 3.

*Recommendation:* Leave it as default (<BLANK>)

***

- RETRY_INTERVAL

Sets the time interval (in seconds) between attempts to reconnect to a monitoring service. If this option is not specified, the default time interval is 3 seconds.

*Recommendation:* Leave it as default (<BLANK>)

### 1.14.4 AUTOEDIT

- USE=NO

Specifies whether or not to use the AUTOEDIT syntax of CONTROL-M.

*Recommendation:* Leave it as default (NO)

### 1.14.5 OPTION

- RUN_NODE=*

This option sets the default node to be used with the -n option is not given during JOB submission. The default value is an asterisk(\*), meaning that a JOB can be executed on any node.

*Recommendation:* Check with the customer to see if they have a preference on which node a JOB should be run on by default. If they have no preference, then use the asterisk (\*)

***

- LOG=Y

Logs the TEXTRUN commands in ${OPENFRAME_HOME}/log/cmd

*Recommendation:* Leave it as default (Y)

## 1.15 TJCLRUN Configuration (tjclrun.conf)

This configuration file determines many of the default values and settings built around batch JOBs. This is a very important configuration file and should be looked at carefully.

### 1.15.1 JOB

If the minimum required parameters for JCL JOBs are omitted, the default values from this configuration file are used.

- CLASS = L

If the class parameter is ommited from the job data, the default job class value is assigned (this attribute is required). Can be any single letter (A-Z) or number (0-9)

*Recommendation:* Check with the customer what default CLASS they prefer, and set accordingly.

***

- MSGCLASS = A

If the MSGCLASS parameter is ommited in the job data, the default job MSGCLASS value is assigned (This attribute is required). Can be any single letter (A-Z) or number (0-9)

*Recommendation:* Check with the customer what default MSGCLASS they prefer, and set accordingly.

***

- MSGLEVEL[1] = 1

If the first sub-parameter of the MSGLEVEL in the job data is omitted, the default MSGLEVEL value is used (this attribute is required). Can be any number (0-2)

*Recommendation:* Leave it as default (1)

***

- MSGLEVEL[2] = 1

If the second sub-parameter of the MSGLEVEL i n the JOB data is omitted, the default MSGLEVEL value is used (This attribute is required). Can be either 0 or 1.

```
0 : Dataset allocation results or log messages are not printed to SYSMSG for the JOB spool.
1 : The dataset allocation results and log messages are printed.
```

*Recommendation:* Leave it as default (1)

***

- TIME=NOLIMIT

If the TIME parameter in the job data is omitted, the default job time value is used. If this is not specified, 0 means that the default is set as no time limit (This attribute is optional). The options for this value are described below:

```
minutes: Sets a value between 0 and 357912 in minutes
seconds: Sets a value between 0 and 59 in seconds
NOLIMIT: Has no limit for TIME
MAXIMUM: Uses the maximum value 357912
```

*Recommendation:* Change this value from NOLIMIT to a set amount of time in minutes. If you want to set it for 1 minute and 10 seconds, it should be like TIME=(1,10)

### 1.15.2 PERFORM

Specifies whether to indicate CPU usage priority and configures CPU priorities

- USE_PERFORM = NO

Specifies whether or not the PERFORM parameter will be used to indicate CPU usage priority (This attribute is optional). If this element is not specified, PERFORM parameters will be ignored in JCL.

*Recommendation:* Leave it as default (NO)

***

- <PERFORM_VALUE> = <NICE_VALUE>

A table that maps PEROFRM values to CPU priorities. If USE_PERFORM is set to YES, this must be set as well. PERFORM supports a range of values from 1-999; CPU priorities in UNIX (NICE values) range from 0-39. All values within the mappting table must adhere to these limits.

Here's a little information on NICE_VALUES and Priorities in Linux: [Process "Niceness" vs "Priority"](https://askubuntu.com/questions/656771/process-niceness-vs-priority "From askubuntu.com")

### 1.15.3 DD

Specifies the length of records in the instream-dataset and the count limit of records that can be written in a spool dataset in JCL

- INSDSET_LRECL = 80

Specifies the length of records in the instream-dataset in JCL (This attribute is optional). If the instream-dataset is shorter than the specified length, the dataset will be padded with spaces. If the instream-dataset is longer than the specified length, excess data will be truncated (default: 80)

*Recommendation:* Leave it as default (80)

***

- OUTLIM = 0

Specifies the count limit of records that can be written in a spool dataset in JCL (This attribute is optional). A value between 0 and 16777215 can be specified. If the value is less than 0 or greater than 16777215, 0 or 16777215 is used, respectively. If 0 is specified, record count has no limit. If this element is not specified, the default value is 0.

*Recommendation:* Leave it as default (0)

### 1.15.4 DDTAB

Defines the maximum possible number of JCL DD data used in JCL (including JCL procedures) when tjclrun executes jobs.

- DDTAB_MAX = 1024

Defines the maximum possible number of JCL DD data used in JCL (including JCL procedures) when tjclrun executes jobs (This attribute is optional). The default is 512, and the maximum is 65535. For example, if DDTAB_MAX is set to 1024, up to 1024 D of data (including the JCL procedures called from the job or INPJCL) can be used in a single job. Anything larger is regarded as a possible error and the job will shut down abnormally. The error message "No free DD entry in ddtab" is printed to the SYSMSG. In this case, DDTAB_MAX value can be raised to avoid the error.

*Recommendation:* Leave it as default (1024)

### 1.15.5 SYSLIB

Configures the default directories for lower level batch execution programs or common library files when tjclrun is run.

- BIN_PATH=${OPENFRAME_HOME}/bin:${OPENFRAME_HOME}/util:${COBDIR}/bin:/usr/local/bin:/bin:${PROTRIEVE_HOME}/bin

Specifies the binary file paths, separated by colon (:). Each customer will have different paths, but anything related to ${OPENFRAME_HOME} should be the same for all environments.

*Recommendation:* You will need to check the paths for each of these sections, and may be different customer to customer.

***

- LIB_PATH=${OPENFRAME_HOME}/lib:${OPENFRAME_HOME}/core/lib:${TB_HOME}/client/lib:${COBDIR}/lib:/usr/lib:/lib:/lib/i686:/usr/local/lib:${PROSORT_HOME}/lib:${OFCOB_HOME}/lib:${ODBC_HOME}/lib:${OFPLI_HOME}/lib:${OFASM_HOME}/lib:${PROTRIEVE_HOME}/lib

Specifies the libary file paths, separated by colon (:). Each customer will have different paths, but anything related to ${OPENFRAME_HOME} should be the same for all environments.

*Recommendation:* You will need to check the paths for each of these sections, and may be different customer to customer.

***

- COB_PATH=${COBPATH}

Specifies a COBOL directory path.

*Recommendation:* You will need to check the paths for each of these sections, and may be different customer to customer.

### 1.15.6 PRELOAD

  #TODO

### 1.15.7 PGM

Determines whether or not to invoke the batch program which is compiled as common libraries, using the utilitiy program PGMRTW00 by tjclrun (This attribute is optional).

- USE_PGMRTS00=NO

```
YES : tjclrun invokes the PGMRTS00 utility if the pgoram is not executable and dynamically loads the batch program compiled as common libraries by PGMRTS00.
NO  : tjclrun can only invoke programs compiled as an executable (default)
```

*Recommendation:* Leave it as default (NO)

### 1.15.8 DBCONN_INFO

Database Connection Information

- DATABASE=

Specifies the name of the Database

*Recommendation:* Leave it as default (<BLANK>)

***

- USERNAME= 

Specifies the default username of the Database

*Recommendation:* Leave it as default (<BLANK>)

***

- PASSWORD=

Specifies the password of the default user of the Database

*Recommendation:* Leave it as default (<BLANK>)

### 1.15.9 ACCOUNT

Determines whether the process owner of the invoked batch program should be set to the USER parameter value defined in the JCL.

- SETUID = NO

```
YES : the tjclrun program should be installed as root. Programs invoked during the job process are to be processed as defined by the user in the JCL job. Also, the files and other resources created during the job process ar checked against the job user.
NO  : The operator who booted the TJES system, especially the Runner slot process owner becomes the process owner of any batch programs invoked during tjclrun or job steps. In this case, this user cannot operate as another user with the USER parameter in the JCL job data. All OS level ownerships are checked as the operator and the process owner is also the OS userid of the same operator (DEFAULT).
```

*Recommendation:* Leave it as default (NO)

### 1.15.10 TACF

Determines whether or not to check the TACF access authority among the TACF support features by tjclrun and the TACF execution authority for the main utility programs in the TACF support features.

- CHECK_DSAUTH=NO

Determines whether or not to check the TACF access authority among the TACF support features by tjclrun (This attribute is optional). 

*Recommendation:* Leave it as default (NO)

***

- CHECK_UTAUTH=NO

Determines whether or not to check the TACF execution authority for the main utility programs in the TACF support featurues (This attribute is optional). 

*Recommendation:* Leave it as default (NO)

### 1.15.11 AMS

Decides whether to keep the connection with AMS while the Runner is running, or to cut and connect whenever needed (This attribute is optional).

- CONNECTION=KEEP

The option to cut and connect whenever needed is NOKEEP while the option to keep the connection with AMS is KEEP.

*Recommendation:* Leave it as default (KEEP)

### 1.15.12 JCL

Decides whether to omit '//SYSIN DD \*' in the input stream dataset for TRAIL (the end part) of the JCL file

- IGNORE_TRAIL=YES

If the end part of the file is not a JCL line in mainframe, //SYSIN DD * is omitted in the input stream dataset (This attribute is optional). An empty line or unecessary lines are often added in OpenFrame. For this case, the attribute determines whether to ignore the trailing part of the JCL file or to regard as an input stream dataset omitting '//SYSIN DD \*'.

```
YES : The trailing part is ignored and removed (DEFAULT)
NO  : It is treated as the input stream dataset omitting 'SYSIN DD *' line
```

*Recommendation:* Leave it as default (YES)

***

- SYMBOL_DELIM=NO

  #TODO

***

- PASSWORD_ENCRYPT=NO

Option to encrypt a PASSWORD value within INPJCL in JOBSPOOL to "\*" (Default is NO). Note, that this setting is not applied if the line that includes a PASSWORD value is in a comment.

*Recommendation:* Change this to value to (YES)

### 1.15.13 OPTION

Decides whether to use the largest or the last return code (RC) of a JOB when tjclrun is terminated

- USE_MAX_RC=NO

Deceides whether to use the largest or the last return code of a JOB when tjclrun is terminated (This attribute is optional).

```
YES : The largest RC among RCs of the processed steps is used as the RC of the job.
NO  : The RC of the last processed step is used as RC of the job (DEFAULT)
```

*Recommendation:* Change this value to (YES)

***

- PGM_NOT_FOUND=ERROR

Decides whether to throw an error or to flush a job if specified program does not exist in JOB STEP (This attribute is optional).

```
ERROR : Throw an error
FLUSH : Flush a job (DEFAULT)
```

*Recommendation:* Change this value to (ERROR)

***

- IGNORE_USER_ABEND=YES

  #TODO

***

- PUT_DD_INFO

  #TODO

### 1.15.14 DEBUG

Determines whether to print and process profile information to analyze tjclrun performance (This attribute is optional).

- PROFILE=NO

```
YES : The printed log includes date information per process step to help analyze performance.
NO  : The messages are not included. It is recommended that this is not set to YES unless the performance of tjclrun is being analyzed (DEFAULT)
```

*Recommendation:* Leave it as default (NO)

## 1.16 TJES Configuration (tjes.conf)

OpenFrame's Tmax Job Entry System (TJES) Configuration File. 

### 1.16.1 NODEINFO

Configures information on nodes

- NODENAME=NODE1

Defines the current node name.

*Recommendation:* Leave it as default (NODE1)

***

- NODELIST=NODE1

Defines all node names. Node names are separated by semicolon (;).

*Recommendation:* If you have installed any additional OpenFrame nodes, add them to this list.

### 1.16.2 JOBDEF

This section manages JOBs in TJES.

- STARTNUM=1

Specifies the starting number for a JOBID. 

*Recommendation:* Leave it as default (1)

***

- ENDNUM=99999

Specifies the ending JOBID. Therefore, the largest JOBID can be JOB99999 and it would start at JOB00001 with the above settings.

*Recommendation:* Leave it as default (99999)

***

- FULL_WARNING=80

Configures the boundary rate (in percent) of the JOBQ before displaying a warning about a full jOBQ. The boundary can be an integer between 0 and 99.

*Recommendation:* Ask the customer what percent they would like to set.

### 1.16.3 JOBCLASS

This section is for the default properties of the TJES job class.

- ${CLASS}=${STATUS}

We can specify a class here and give a status of either START or HOLD. Any class between A-Z or 0-9 can be given in the CLASS portion, where the STATUS portion can either be START or HOLD. If not specified, START is given to the class.

*Recommendation:* Check with the customer if there are any JOB classes that are put on HOLD status. They should be defined in this configuration. If the CLASS starts with START, you need not define it.

### 1.16.4 JOBGDEF

  #TODO

### 1.16.5 SCHEDULING

- DUPL_JOBNAME=NO

Decides whether to execute the job with the same JOBNAME concurrently (Default: NO)

*Recommendation:* Leave it as default (NO)

***

- PRTYJECL=YES

Defines whether to use the priority in the submitted JCL. (Default: YES)

*Recommendation:* Leave it as default (YES)

***

-PRTYJOB=YES

Defines whether to use the priorirty of the submitted JCL (Default: NO)

*Recommendation:* Change this to (YES)

***

-PRTYHIGH=10

Defines the maximum value for the priority attribute. Values higher than the maximum value will be ignored. It can be an integer from 0 to 10.

*Recommendation:* Leave it as default (10)

***

- PRTYLOW=5

Defines the minimum allowable value for the priority attribute. Values lower than the minimum will be ignored. It can be an integer from 0 to 10.

*Recommendation:* Leave it as default (5)

***

- PRTYRATE=1440

Defines a number used in calculating the aging per day rate. The job priority incremements by 1 after a certain amount of time passes. That amount of time is calculated by dividing 86400 seconds by the PRTYRATE given. If you specify 1440 seconds, the job priority will increase by 1 every 60 seconds.

You can specify any number between 0 to 86400

*Recommendation:* Leave it as default (1440)

***

- INTERVAL=1

Defines the interval to schedule the scheduler in seconds (Default: 1)

*Recommendation:* Leave it as default (1)

### 1.16.6 RESOURCE

This section describes the UNIX resources used in the TJES.

- SHMKEY=62039

Configures the shared memory key to communicate between obmjinit and tjclrun in TJES

*Recommendation:* Leave it as default (62039)

***

- DBCONN=BASE_ODBC

The ODBC connection named used to access a system database. This name must be defined in the [odbc-section-name] section of ofsys.conf. 

*Recommendation:* Check your ODBC connection settings. If everything is default, it will most likely be BASE_ODBC.

### 1.16.7 PROCLIB

This section describes the dataset required to operate a JOB.

- JCLLIB=SYS1.JCLLIB:${JCL_PATH}

If executing a JCL without the specific path, the JCL will be executed based on the priority list given above.

*Recommendation:* Change this to fit the customer's requirements. Customers will most likely have a PDS they execute JCL from by prirority.

***

- USERLIB=SYS1.USERLIB:${COB_PATH}

This list is a concatenation of the COBOL PDSs used for Batch. Similar to JCLLIB, it is priority based, and seperated by colon (:).

*Recommendation:* Change this to fit the customer's requirements. Customers will most likely have multiple COBOL PDSs and whichever is priority should come first in the list, and visa versa.

***

- PROC00=SYS1.PROCLIB:${PROC_PATH}

Similar to JCLLIB and USERLIB, this is where Procedures are called from on a priority basis separated by colon (:)

*Recommendation:* Change this to fit the customer's requirements. Customers may have multiple Procedure PDSs so they should be listed on priority basis.

### 1.16.8 DYNAMIC_LIBRARY

- TEMPLIB=SYS1.TEMPLIB

Specifies the TEMP Libraries. This is the name of the PDS dataset to be used for temporarily saving the existing library when the user library is modified.

*Recommendation:* You should be able to leave this as default, but check with the customer if they have a similar PDS name on the mainframe that they use. If so, change SYS1.TEMPLIB to that PDS name.

### 1.16.9 LOG

- JOBLOG=${OPENFRAME_HOME}/log/joblog/job.log

Assigns a file path for the JOBLOG which logs the status of the changes of the JOBs

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/log/joblog/job.log)

***

- SUBMITLOG=${OPENFRAME_HOME}/log/submitlog/submit.log

Assigns a file path of SUBMITLOG which logs the JCL submit trials and results.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/log/submitlog/submit.log)

### 1.16.10 SPOOL

- SPOOL_VOLUME_SER=VSPOOL

This defines SPOOL VOLUME SERIAL defined in the volume.conf configuration file.

*Recommendation:* Check what the customer wants to name the spool volume serial and assign this variable as well as define it in volume.conf configuration file.

***

- SPOOL_BACKUP_DIR=${OPENFRAME_HOME}/spbackup

Defines the directory for storing the spool backup data when using the BACKUP feature.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/spbackup)

***

- SPOOL_UNPACK_DIR=${OPENFRAME_HOME}/spunpack

Defines the directory used for decompressed spools from backups

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/spunpack)

***

- USE_DATABASE=NO

  #TODO

***

- SYSOUT_AS_A_FILE=NO

  #TODO

### 1.16.11 INTRDR

- HOLD=NO

Defines whether the job status should be set to HOLD when the JCL is submitted by an internal reader

*Recommendation:* Leave it as default (NO)

***

- NODENAME=NODE1

Defines which node to execute the job when the JCL is submitted by an internal reader

*Recommendation:* If you have more than one node, you should check which node will be your main node to submit JCL to if submitted by an internal reader.

***

- USERNAME=${USERNAME}

Sets which user is to receive the TACF certificate when the JCL is submitted using an internal reader

*Recommendation:* Specify a Username that the customer already uses on the mainframe.

***

- GROUPNAME=${GROUPNAME}

Defines which user group is to receive the TACF certificate when the JCL is submitted using an internal reader.

*Recommendation:* Specify a group that the customer already uses on the mainframe

***

- PASSWORD=${PASSWORD}

Sets the password for the user to receive the TACF certification when the JCL is submitted using an internal reader

*Recommendation:* Check with the customer what the user's password will be and set it here.

***

- ENPASSWD=****

This attribute encrypts the user password to receive the TACF certificate when the JCL is submitted using an internal reader

*Either the PASSWORD or ENPASSWD field should be configured, not both. To configure only one or the other, Add a pound symbol (#) before the line to comment it.*

### 1.16.12 INITDEF

This section describes the initial configuration values of the RUNNER in TJES.

- INITNUM=${VALUE}

Defines the total slot count of the node. Usually, 11 is defined, but there is no limit for the number of slots, except for the size of the memory installed on the machine. One runner will reqire a 256 bytes of memory to be allocated by obmjinit. It's recommended to use less than 500 slots and manage it as CLASS ACTIVE, and INACTIVE.

*Recommendation:* Run the JCL described in the initiator_config section of this guide on the mainframe to determine the ACTIVE initiators and how many are required for OpenFrame.

*See guide in next section*

***

- INITxxxx = ${name},${classes},${ACTIVE|INACTIVE}

Specifies each Runner slot. Each "xxxx" represents the number of the runner slot. It should start at 0000 and go up to 9999. The ${name} can be anything, it has no special meaning. It's recommended to keep the name sort and sweet. If your INIT is 0000, you can use 0 as the name. The classes you can assign should be the same as the classes on the mainframe. If they have initiators running on the classes ABC, it should match in the classes section. Lastly, the ACTIVE|INACTIVE specifies if that runner is active or not.

*Recommendation:* Run the JCL described in the initiator_config section of this guide on the mainframe to determine the ACTIVE initiators and how many are required for OpenFrame.

[Link to Initiator Configuration JCL](./initiator_config/README.md)

### 1.16.13 OUTCLASS

Depending on the output class of the SYSOUT, default output disposition and default lrecl are configured.

- ${class}=${normal_disp}${,abnormal_disp}:${default_lrecl}

If OUTCLASS specified in JCL is not specified in OTUCLASS of tjes.conf, (PURGE,PURGE) is used as a default output disposition. The default lrecl can only be used when RECFM has a fixed format. If RECFM has a fixed format and the default lrecl is not specified, 80 is used.

*Recommendation:* Check with the customer on what each OUTCLASS class should be set to.

### 1.16.14 OUTDEF

- OUTNUM=8000

Defines the size of the OUTPUTQ. Can be an integer between 1 and 99999. The larger the OUTPUTQ, the more information can be stored, however, it is recommended that the size is adjusted properly because a large amount of information may hinder performance for changing and checking each output status. 

*Recommendation:* Leave it as default, increase if necessary.

***

- USE_OUTPUTQ=YES

Defines whether to execute OUTPUT processing.

*Recommendation:* Leave it as default (YES)

***

- DATA_DIR=${OPENFRAME_HOME}/shared

Defines a directory into which to copy the OUTPUT from spool.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/shared)

***

- REMOVE_SPOOL=NO

Option to execute post-processing after OUTPUT processing completes. If this element is set to YES, the SPOOL will be deleted when removing OUTPUT from OUTPUTQ. If set to NO, the SPOOL will not be deleted (Default is (NO))

*Recommendation:* Leave it as default (NO)

### 1.16.15 TACF

- CHECK_JOBNAMEAUTH=NO

This element decies whether to check authority over JOBNAME when controlling jobs for SUBMIT, REMOVE, START and HOLD.

*Recommendation:* Change this value to (YES)

***

- CHECK_SPOOLAUTH=NO

This element decides whether to check authority to open SPOOL through PODD command in tjesmgr 

*Recommendation:* Change this value to (YES)

### 1.16.16 OPRMSG

- USE_CONSOLE=YES

  #TODO

## 1.17 TJESMGR Configuration (tjesmgr.conf)

Various options for the tjesmgr command.

### 1.17.1 DEFAULT_OPTION

- SPOOL_LIST=GTZERO

```
ALL    : Shows all spools
EXIST  : Shows spools with spool files only
GTZERO : Shows spools with the file size larger than 0
```

*Recommendation:* Leave it as default (GTZERO)

***

- EDITOR=/usr/bin/vi -w&ROWCOUNT &FILEPATH

Defines which editor to use

*Recommendation:* Leave it as default (/usr/bin/vi -w&ROWCOUNT &FILEPATH). If vi does not exist at that exact path, you may have to change this value slightly.

***

- VIEWER=/usr/bin/vi -w&ROWCOUNT -R &FILEPATH

Defines which viewer to open a spool.

*Recommendation:* Leave it as default (/usr/bin/vi -w&ROWCOUNT -R &FILEPATH). Again, if vi does not exist at that exact path, you may have to change this value slightly.

***

- DEFAULT_RUNNING_NODE=ANY

```
MY  : Enables JOB execution only on its own node if no node is defined upon job submission
ANY : Enables job execution from any node if no node is defined upon job submission
```

*Recommendation:* Leave it as default (ANY)

### 1.17.2 DEFAULT_USER

Specifies the default user to execute tjesmgr commands if no user is specified.

- USERNAME=${USERNAME}

- PASSWORD=${PASSWORD}

- GROUPNAME=${GROUPNAME}

*Recommendation:* Check with customer to see which default user they would like to use for tjesmgr commands.

### 1.17.3 TACF

- CHECK_CMDAUTH=YES

If this is set to YES, authorization is checked against the tjesmgr commands

*Recommendation:* Leave it as default (YES)

## 1.18 Time Sharing Option Configuration (tso.conf)

Configurations for OpenFrame TSO

### 1.18.1 COMMON

- EXECLIB=SYS1.TSOLIB

Specifies search paths for clist resources, if not defined, default is SYS1.TSOLIB 

*Recommendation:* Check with the customer for which pds contains their CLIST resources and change this accordingly.

***

- COBLIB=SYS1.COBLIB

Specifies search paths for cobol programs for EXCEFW. If not defined, the default is SYS1.COBLIB

*Recommendation:* Check with the customer for which pds contains their COBOL resources and change this accordingly.

***

- PLF_DIRECTORY=${OPENFRAME_HOME}/shared/TSO

  #TODO

***

- DEFAULT_FEXPORT_PLF=DEFEXP.PRM;1

  #TODO

***

- DEFAULT_FIMPORT_PLF=DEFIMP.PRM;1

  #TODO

***

- IPF_ERRCODE=-92065,-92062,-92068,-92067

Specifies ipf error codes which cobol does not check. 

*Recommendation:* Leave it as default (-92065,-92062,-92068,-92067)

***

- ASC2EBC_CPM=ASCJEFK.cpm

Specifies the CPM map file, to confert ASCII data to EBCDIC

*Recommendation:* Check the mapping and go through it with the customer. Then assign the cpm file here.

### 1.18.2 MAP

- DEFAULT_LIB=SYS1.TSOMAP

Specifies the paths for Map resources. If not defined, the default is SYS1.TSOMAP.

*Recommendation:* Check with the customer for where their MAP resources are and change this value accordingly.

***

- DEFAULT_LOG=LOGIN

LOGIN MAP name. If not defined, the default is LOGIN

*Recommendation:* Check with the customer for what their LOGIN MAP name is and change this accordingly.

***

- DEFAULT_LOGOFF=LOGOFF

LOGOFF MAP name. If not defined, the default is LOGOFF

*Recommendation:* Check with the customer for what their LOGOFF MAP name is and change this accordingly.

***

- DEFAULT_NEWPASS=NEWPASS

When password is expired, this option allows them to create a new password. Default is NEWPASS

Other options include #TODO

*Recommendation:* Leave it as default (NEWPASS)

***

- DEFAULT_COMMAND=INIT

Specifies the start command MAP name.

*Recommendation:* Check with the customer to see what their start command is and change this accordingly.

***

- FIMPORT_MAP=FIMPMAP

MAP Name for getting PLF paramenters in fimport.

*Recommendation:* Check with the customer to see if they have a different MAP name and change this accordingly.

***

- FEXPORT_MAP=FEXPMAP

MAP name for getting PLF parameters in fexport.

*Recommendation:* Check with the customer to see if they have a different MAP name and change this accordingly.

### 1.18.3 TSOMGR

- DEFAULT_PROC=INITPROC

DEFAULT procedure name. If not defined, default is INITPROC

*Recommendation:* Check with the customer to see if they have a different PROCEDURE name and change it accordingly.

***

- USING_CLASS=X

When submitting JCL (including PROCEDURES), set CLASS in the JCL file. If not defined, the default class is A.

*Recommendation:* Check with the customer to see if they would like to set a different class and change this value accordingly.

***

- USING_OUTCLASS=A

When submitting JCL (including PROCEDURES), set OUTCLASS in the JCL file. If not defined, the default is (A).

*Recommendation:* Check with the customer to see if they would like to set a different OUTCLASS and change this value accordingly.

***

- CHECK_JOB_INTERVAL=3

TSO JOB check scheduling interval (in seconds). If not defined, the default is 10.

*Recommendation:* Change this value to (3)

***

- MAX_TSO_COUNT=30

Specifies the Maximum TSO users count.

*Recommendation:* Leave it as default (30)

***

- LOG_LEVEL=I

System module log level I for message or D for debug. If not defined, default is I

*Recommendation:* Leave it as default (I). If there are any problems, it may be beneficial to change this to D for debugging and then changing it back to I once the issue is resolved.

### 1.18.4 LOGIN_PROC

Currently, there are no configurations for this section.

### 1.18.5 SMTP

- DOMAIN_NAME=TMAXSOFT

Specifies the HOST domain name for HELLO statement. Must be defined, but it can be any unknown domain names.

*Recommendation:* Check with the customer for the SMTP domain name.

***

- SENDER_ADDRESS=${EMAIL_ADDRESS}

Specifies an email address for MAIL FROM statement. (Must be defined)

*Recommendation:* Check with the customer for the user they wish to send emails from.

## 1.19 UNIT Configuration (unit.conf)

Stores configurations of the I/O debice info and system UNIT info for OpenFrame. The UNIT info stored in this configuration file is directly used in the JCL DD statement's UNIT parameter, or used in the volume.conf file.

### 1.19.1 HEADER

- MAX_DEVICE_ENTRIES=1024

Maximum number of devices that can be specified in the [DEVICE] section.

*Recommendation:* Leave it as default (1024)

***

- MAX_ESOTERIC_DEVICES=1024

Maximum number of devices groups that can be specified in the ESOTERIC section.

*Recommendation:* Leave it as default (1024)

***

- MAX_DEVNUM_LIST=1024

Maximum number of device numbers that can be included in the device groups specified in the ESOTERIC section.

*Recommendation:* Leave it as default (1024)

### 1.19.2 DEVICE

- {DEVICE_NUMBER}={NUM_OF_DEVICES},{DEVICE_TYPE},{SPACE_LIMIT},{ARCHIVE_MODE(OPTIONAL)}

```
DEVICE_NUMBER  : Hexadecimal number ranging from 0000 to FFFF

NUM_OF_DEVICES : Number of devices with the same attribute. The continuous I/O device numbers are considered as devices with the same attributes.

DEVICE_TYPE    : Device Type. (Ex. 3380/3390/3390A/3480)

SPACE_LIMIT    : Primary space value for the newly created non-VSAM dataset. It is specified in unit of MB. 0 Means there is unlimited, which prevents the size of the dataset created by the corresponding device in OpenFrame from growing infintely.

ARCHIVE_MODE   : Can be either (0 or 1). Option to compress a dataset before storing it to a device which refers to a tape volume in OpenFrame.

  - 0 : Compresses before saving the dataset (DEFAULT)

  - 1 : Does not compress before saving the dataset
```

### 1.19.3 ESOTERIC

Specifies an esoteric device group information. An esoteric device group refers to the collection of an I/O devices belonging to the group defined by the administrator. The esoteric group name can be used directly for the UNIT parameter of the JCL DD statement.

- {GROUP_NAME}={DEVICE_NUM}

```
GROUP_NAME : Name of the esoteric device group to define

DEVICE_NUM : I/O Device number defined in the [DEVICE] section.

- Separate multiple device numbers with a comma.

- Specify a sequence of device numbers with a hyphen (-)
```

Example:

```
SYSDA=0001-0004,0006
```

## 1.20 Volume Configuration (volume.conf)

Stores info on all volumes that are registered in OpenFrame. The device number used in this configuration file has to be pre-defined in the unit.conf file.

### 1.20.1 HEADER

- MAX_VOLUME_ENTERIES=1024

Specifies maximum number of entries allowed in the VOLUME section.

*Recommendation:* Leave it as default (1024). If more volumes are needed, increase this value.

### 1.20.2 VOLUME

- {VOL_SERIAL}={DEVICE_NUM},{USE_ATTR},{MOUNT_ATTR},{PATH},{TAPE_SWITCH_ATTR (OPTIONAL)},{SHARED_ATTR (OPTIONAL)}

```
VOL_SERIAL       : Unique volume serial allocated to the system with alphanumeric characters ranging from 1-6 characters.

DEVICE_NUM       : Device number registered in the unit.conf file.

USE_ATTR         : User Attribute
  - PRIVATE: 
  - PUBLIC
  - STORAGE

MOUNT_ATTR       : Mount Attribute
  - PERMANENT
  - REMOVABLE

PATH             : Unix directory path on which the volume is mounted

TAPE_SWITCH_ATTR : Option to enable TAPE switch (DEFAULT: NO) 

SHARED_ATTR      : Option to enable volume sharing. (DEFAULT: NO)
- YES   : Enable Sharing
- NO    : Disable Sharing
```

### 1.20.3 TABLESPACE

Currently, there are no configurations for TABLESPACE.

  #TODO

***

# 2. Online Related

These configurations have to do with OSC and OSI. OSC and OSI stand for Openframe Subsystems for CICS and IMS respectively. Here, you will find configurations which will have to be highly customized to match the mainframe components. Some assembly is required as creating the regions are first needed to configure the config files for them.

*If your environment does not consist of CICS regions, you may skip the OSC section.*

*If your environment does not consist of IMS regions, you may skip the OSC section.*

# 2.1 OSC

## 2.1.1 OSC General Configuration (osc.conf)

This configuration file is used to configure the TSAM and OSC system settings that are common to all OpenFrame OSC regions. 

### 2.1.1.1 GENERAL

- SYSTEM_LOGLVL={LEVEL}

Sets the log level of the OSC System.

```
I   :  Informative
D   :  Debug
```

*Recommendation:* Leave it as default (I). If there are errors which need to be troubleshooted, you can change this value to (D) to get more information, then it is recommended to change it back to (I) once the issue is resolved.

***

- NCS_FILE=${OPENFRAME_HOME}/temp/OSC_NCS

Designates a temporary file which stores information used by the Named Counter Service (NCS). 

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/temp/OSC_NCS)

***

- NCS_STORAGE=AUX

Specifies whether to manage the information in NCS in a disk (AUX) or in memory (MAIN). The default value is (AUX).

*Recommendation:* Leave it as default (AUX)

***

- NCS_WRITE_COUNT=1

Stores a value in NCS_FILE for every specified count and increments a value in a unit specified in a count when NCS_STORAGE=AUX. Specify a value in multiples of 1 or 10.

*Recommendation:* Leave it as default (1)

***

- DBCONN=OSC_ODBC

  #TODO

***

- XA_TSAM_DB=

  #TODO

  ***

- ASMTBL=NO

  #TODO

### 2.1.1.2 TSAM_CLIENT

- USERNAME={USERNAME}

The username used to connect to TSAM.

*Recommendation:* Use the default user for tibero, In most cases the username is "tibero"

***

- PASSWORD={PASSWORD}

The password of the username specified above.

***

- DATABASE={DB_SID}

The Tibero database connection address used by TSAM. If you are unsure, in most cases you can run the following command to get this information:

```bash
echo $TB_SID
```

*Recommendation:* Use the above command to find your TB_SID and change this configuration accordingly.

### 2.1.1.3 TSAM_BACKUP

- USERNAME={USERNAME}

Username used to connect to TSAM

*Recommendation:* Use the default user for tibero, In most cases the user name is "tibero"

***

- PASSWORD={PASSWORD}

The password of the username specified above.

***

- DATABASE={DB_SID}

The Tibero database connection address used by TSAM. If you are unsure, in most cases you can run the following command to get this information:

```bash
echo $TB_SID
```

*Recommendation:* Use the above command to find your TB_SID and change this configuration accordingly. *_NOTE: a Backup Server may be different than the normal database server you are connecting to on a regular basis, check first._*

***

- RETRY_COUNT=10

The number of times to try reconnecting to the backup address if the connection to TSAM fails.

*Recommendation:* Leave it as default (10)

***

- RETRY_INTERVAL=10

The interval between attempts to reconnect to the backup server.

*Recommendation:* Leave it as default (10)

### 2.1.1.4 OSCSCSVR

This server schedules transactions that run according to specified internal time conditions and communicates with application servers through the TMAX engine.

- BACKUP=NONE

Sets whether or not to backup unexpired scheduling information

```
NONE  : No backups (DEFAULT)
TSAM  : Back up through a TSAM dataset
```

*Recommendation:* Check with the customer to see if they would like to schedule backups for TSAM.

***

- BACKUP_DATASET={DATASET}

Specifies the dataset where the scheduling information, that is not expired, will be backed up. This item has no effect if BACKUP is set to NONE.

The dataset must be in KSDS format with a 20 byte key field. Record length can be variable between 20 and 32700 bytes. 

*Recommendation:* If the customer would like to schedule TSAM backups, Create a KSDS dataset to store the information using IDCAMS.

  #TODO: Reference to IDCAMS

### 2.1.1.5 OSCMCSVR

This server monitors OSC application servers

- REGION=1

Specifies the number of regions that will use the monitoring function. This number must match the number of regions listed below.

*Recommendation:* Check with the customer's current environment. Change this value to however many regions the customer currently has and match the value here.

*** 

- REGION_{REGION_NAME}

REGION_NAME is replaced by each OSC region name. Designates the logged (recorded) areas in the data section fields of the performance record. Each area is given in the form of Offset-length, and each offset must be specified sequentially.

Example:

```
REGION_OSC00001=0-10,100-30
REGION_OSC00002=100-50,200-10,300-65
```

### 2.1.1.6 OSCOLSVR

This server is responsible for recording OSC application transaction logs. It communicates with application servers through the TMAX engine.



### 2.1.1.7 OSCOSSVR

This server runs OpenFrame Manager. It must be set up if OpenFrame Manager will be used.

## 2.1.2 OSC Sequence Configuration (ofc.ofsys.seq)

This sequence file dictates what server processes are started when the ```oscboot``` command is issued. The sequence file will have a list of server processes which can can be sectioned using a comment (#).

Example:

```bash
#OSC
oscmgr
oscmnsvr
osccmsvr
oscmnsvr
oscolsvr
oscscsvr
oscdfsvr
oscjcsvr
```

## 2.1.3 OSC LU Configuration (osc.lu.conf)

LU stands for Logical Unit. Logical units are access points through which a user or application program accessess the SNA network to communicate with another user or application program. In OpenFrame, online transactions can be accessed through Terminal LU's which users connect to through OSC, webterminal, and OpenFrame Gateway (OFGW)

### 2.1.3.1 TIMEOUT

- TIMEOUT_DEFAULT=3600

  #TODO

- OIVPTRM1=1200

  #TODO

- OIVPTRM2=7200

  #TODO

## 2.1.4 OSC (REGION NAME) Configuration (osc.regionname.conf)

This configuration file describes the settings for a specific OSC region. Depending on the region name, the configuration file name may change. For example, if your region is named OSCOIVP1 (which is the region OSC comes with by default), your configuration file will be named osc.OSCOIVP1.conf. The majority of the default settings below will be for the default region OSCOIVP1. It's highly likely the majority of the settings below will have to be changed for any region other than the default one.

### 2.1.4.1 GENERAL

- SYSID=OSCA

Designates a SYSID assigned to the OSC region (MAX 4 bytes in a string)

*Recommendation:* Change this value depending on the SYSID assigned to the CICS region as it is in the mainframe.

***

- JOBID=STC000001

Designates a JOB ID for the OSC system. A JOB ID is composed of 3 letters (Do not use JOB) and 5 numbers. A unique value must be set in all regions of OSC and there must not be a duplicate value. The specified JOB ID is used as a directory name created under the ${OPENFRAME_HOME}/spool when OSC uses spool data. When the SPOOL WRITE command is used, the spool data will be stored in the directory which has the same name as the specified JOBID . When the WRITEQ TD command is used, data will be created in a directory named 'JOBID' and the SPR ID of the server process that executed the command.

*Recommendation:* Increment this value by 1 for each JCL and new region. If the customer wishes to use a different 3 letter identifier, then change STC to what they prefer.

***

- JOBNAME=OSCAPSVR

Specifies a JOB name for the OSC region (8 byte string)

*Recommendation:* Check with the customer if they have already chosen a JOBNAME on the mainframe.

***

- SYS_SHMKEY=87544

Specifies the shared memory key used by the OSC region.

*Recommendation:* Leave it as default (87544). If there are additional regions, increase in increments of 10. (#TODO) Be sure not to overlap with other regions and/or the USR_SHMKEY configuration below.

***

- SYS_SHMSIZE=67108864

Sets the size of the shared memory used by the OSC region. (In Bytes) (#TODO)

*Recommendation:* Leave it as default (67108864)

***

- CWA_SIZE=10240

Sets the size of the shared memory block where the Common Work Area (CWA) information is stored (decimal, bytes)

*Recomendation:* Leave it as default (10240)

***

- GETMAIN_ATTACH_RETRY=100

  #TODO

***

- USR_SHMKEY=87644

Specifies the shared memory key used to allocate user areas in the OSC region.

*Recommendation:* Leave it as default (87644). If there are additional regions, increase in increments of 10 (#TODO) Be sure not to overlap with other regions and/or the SYS_SHMKEY configuration above.

***

USR_SHMSIZE=67108864

Sets the size of the shared memory used to allocate user areas in the OSC region 

*Recommendation:* Leave it as default (67108864)

***

- TASKNO_LOCATION=SHM

Sets the location where a task used in OSC is saved

```
SHM  : Save task numbers in shared memory to manage (DEFAULT)
DB   : Save task numbers in a database to manage
```

*Recommendation:* Leave it as default (SHM)

***

- TASKNO_MIN=0

Specifies the minimum value of a task to be processed

*Recommendation:* Leave it as default (0)

- TASKNO_MAX=9999999

Specifies the maximumvalue of a task to be processed. Once this maximum value is reached, the system will return to the minimum value of the next task

*Recommendation:* Leave it as default (9999999)

***

- TC_PATH=${OPENFRAME_HOME}/temp/OSC_TC

Designates the directory path where temporary files used by Task Control (TC) will be stored.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/temp/OSC_TC)

***

- IMSID=IMSA

Specifies an OSI control region name that manages DB information when DL/I is used in OSC.

*Recommendation:* IMSA is the default IMS region, similar to how OSCOIVP1 is the default OSC region. If the IMS region has been customized to fit a customer, you will most likely have to change this value.

***

- USERID=OSCAUSER

Specifies the username of the OSC region. 

*Recommendation:* Check with the customer to see if they have a default user and change this accordingly (#TODO)

- PROTECT=NONE

Protects the OSC system shared memory from user applications

```
RDWR   : Protects the system shared memory from READ/WRITE
WRONLY : Protects the system shared memory from WRITE only
NONE   : No Protection
```

*Recommendation:* Leave it as default (NONE) (#TODO)

***

- OLOG=NO

Specifies whether or not the transaction log of oscolsvr will be used

*Recommendation:* Change this to (YES) (#TODO)

***

- MC=NO

Specifies whether or not the Transaction Monitoring function of OSC will be used

*Recommendation:* Change this to (YES) (#TODO)

***

- CBLPSHPOP=NO

Specifies whether or not the PUSH/POP functions will be used for handler information, in cases where other programs are called from a COBOL program with the CALL command.

*Recommendation:* Leave it as default (NO)

***

- SVCTIMEOUT_ABCODE=ASTO

Sets ABCODE for the Tmax Server Timeout

*Recommendation:* Leave it as default (ASTO)

***

- SVCTIMEOUT_EXIT=NO

Specifies whether or not the application server process must be exited in the case of a Tmax server timeout.

*Recommendation:* Leave it as default (NO)

***

- GMTEXT='OpenFrame OSC System'

Sets the message used in GMTRAN (Maximum of 246 characters excluding quotation marks).

*Recommendation:* Leave it as default ('OpenFrame OSC System'). If the customer wants to change this, feel free to do so.

***

- GMTRAN=CSGM

Specifies the ID of a transaction to be automatically executed when a terminal connects for the first time. (Default: CSGM)

*Recommendation:* Leave it as default (CSGM). If the customer has a more critical screen they would prefer to use, add it here.

***

- MAPDIR=${OPENFRAME_HOME}/osc/region/OSCOIVP1/map

Specifies the directory where OSC maps will be stored. Note that the region name (OSCOIVP1) is specified in the path. Each new region should have a new path specified similar to above. If the field is left blank, the following path is used:

${OPENFRAME_HOME}/osc/region/{REGION_NAME}/map

*Recommendation:* Follow the default path, changing only the REGION_NAME when applicable.

***

- TBLDIR=${OPENFRAME_HOME}/osc/region/OSCOIVP1/tbl

Specifies the directory where OSC resource control tables will be stored. Similar to MAPDIR configuration.

*Recommendation:* Follow the default path, changing only the REGION_NAME when applicable.

***

- TDLDIR=${OPENFRAME_HOME}/osc/region/OSCOIVP1/tdl

Specifies the directory where OSC applications will be stored. Similar to MAPDIR and TBLDIR.

*Recommendation:* Follow the default path, changing only the REGION_NAME when applicable.

***

- LIBDIR=${OPENFRAME_HOME}/osc/region/OSCOIVP1/asmo

Specifies the directory where OSC assembler modules will be stored. Similar to MAPDIR, TBLDIR, and TDLDIR.

*Recommendation:* Follow the default path, changing only the REGION_NAME when applicable.

***

- PLTPI=NO

  #TODO

***

- PLTSD=NO

  #TODO

***

- XLT=NO

Specifies the XLT(s) (Transaction List Table) to be executed when shutting down the OSC system.

```
NO     : No XLT will be executed
suffix : Specifies XLT(s) with SUFFIX characters equal to those set here (2-byte string)
YES    : Specifies XLT(s) with SUFFIX characters that are not specified
```

*Recommendation:* #TODO

***

- NOUSE=SP,SA,AS

Specifies modules that will *_NOT_* be used by the OSC system. To specify more than one module, separate module names with commas like the above example.

```
DL  : DL/I function
DS  : Dataset access function (if specified, File, TSQ, TDQ, and SPOOL cannot be used).
MS  : MSC access function
NC  : NCS (Named Counter Server) access function.
SA  : SAF (TACF) access function.
SP  : Spool access function.
TD  : TDQ access function.
TS  : TSQ access function.
AS  : OFASM module.
```

*Recommendation:* Go through the list above, specify all that you do not need. 

***

- PRINT=NO

Specifies the print request status of the TN3270 screen.

```
NO           : Does not process a print request.
YES          : Processes a print request
PA1|PA2|PA3  : Specifes the PA (Program Attention) key to be used when printing a screen
```

*Recommendation:* Check with the customer if they currently support print requests for 3270 terminals and match the feature with the configuration above.

***

- FREEKB=NO

Specifies whether to disable keyboard lock when shutting down a transaction (Default: NO)

*Recommendation:* Leave it as default (NO)

***

- MSGCLASS=A

Specifies the default SYSOUTCLASS of YPEFILE(OUTPUT) among EXTRA TDQ

*Recommendation:* Check with the customer if they have a default SYSOUTCLASS and change it here.

***

- OPEN_FILE_ON_STARTUP=YES

  #TODO

#### 2.1.4.2 SAF

The SAF section contains environment variables related to OSC security settings.

- SEC=YES

Specifies whether the OSC system will authenticate security permissions or not.

```
YES : Check permissions
NO  : Do not check permissions
```

*Recommendation:* Leave it as default (YES)

***

- XDCT=YES

Specifies whether security permissions will be checked whenever TDQ is used.

```
YES : Check permissions
NO  : Do not check permissions
```

*Recommendation:* Leave it as default (YES)

***

- XFCT=YES

Specifies whether security permissions will be checked whenever FILE is used.

```
YES : Check permissions
NO  : Do not check permissions
```

*Recommendation:* Leave it as default (YES)

***

- XPCT=YES

Specifies whether security permissions will be checked whenever transaction is triggered by START.

```
YES : Check permissions
NO  : Do not check permissions
```

*Recommendation:* Leave it as default (YES)

***

- XPPT=YES

Specifies whether security permissions will be checked whenever a program is used.

```
YES : Check permissions
NO  : Do not check permissions
```

*Recommendation:* Leave it as default (YES)

***

- XTRAN=YES

Specifies whether security permissions will be checked for every transaction or not 

```
YES : Check permissions
NO  : Do not check permissions
```

*Recommendation:* Leave it as default (YES)

***

-  DFTLUSER=CICSDFLT

Specifies the Default user for CICS transactions.

*Recommendation:* Check with the customer if they have a default user they wish to use here, otherwise leave it \<BLANK\>

***

- USERAUTH=

If set to IDENTIFY, the user is assumed to be already verified when making DPL requests, such as CTG.

*Recommendation:* Leave it as default (\<BLANK\>)

#### 2.1.4.3 SD

This section contains environment variables related to the system definition dataset used by the OSC application server.

- DSNAME=OSC.SDLIB.OSCOIVP1

Specifies the name of the dataset that manages the OSC system definition (OSC SD)

*Recommendation:* Change this to whatever dataset the customer is using on the mainframe. If they have no suggestion, you can use the default, and change the last node to the region name.

***

- GRPLIST=BASELIST,OIVPLIST

Specifies the name of the resource definition group used when starting up the system. If two or more names are specified, they must be separated with commas. Names must be less than 8 bytes.

*Recommendation:* Change this value to the GRPLISTs defined in the mainframe.

#### 2.1.4.4 TDQ

TDQ stands for Transient Data Queue. This section contains environment variables related to the TDQ.

- TDQ_INTRA_DSNAME=OSC.TDQLIB.INTRA

Specifies the name of the dataset that manages the intra-partition TDQ.

*Recommendation:* Change this to the dataset used by the customer.

***

- TDQ_LOG_ADDRESS={IP_ADDRESS}:{PORT}

Specifies the address of the TDQ log server to connect to. In most cases, this will be the IP address of the server you are connected to.

The default port is 8654. If there are no conficts, you may use it, otherwise you may have to find an open port.

*Recommendation:* If you are using a single node, the IP Address can be found by executing ```hostname -i```. The default port is recommended, but can be changed if necessary.

#### 2.1.4.5 TSQ

This section contains environment variables related to the Temporary Storage Queue (TSQ).

- DFLTDEST=AUX

Specifies whether or not a TSQ without TSMODEL will be managed on the disk or in memory. If set to AUX, the TSQ will be managed on the disk. (Default value: AUX). The alternative is MAIN which will manage TSQ on memory.

*Recommendation:* Leave it as default (AUX)

***

- MAINDEST=SHM

Specifies where to store TSQ when DFLTDEST=MAIN

```
DB  : Stores TSQ in the Database
SHM : Stores TSQ in the shared memory (default)
```

*Recommendation:* Use AUX in the DFLTDEST section. However, if you choose to use DFLTDEST=MAIN, it is recommended to store TSQ in the shared memory.

***

- QDATA_DSNAME=OSC.TSQLIB.DATA

Designates a dataset where disk-managed TSQ data will be stored.

*Recommendation:* Check if the customer has a preference on a dataset name. 

TEST

**Reference Documents:**
<details><summary>Click Here for Reference Documents</summary>

  * **Base:** OpenFrame_Base_7_Fix#3_Base_Guide_v2.14_en.pdf
  * **OSI:** OpenFrame_OSI_7.1_Administrator's_Guide_V2.1.1_en.pdf
  * **OSC:** OpenFrame_OSC_7_Fix#3_Administrator's_Guide_v2.1.5_en.pdf
  * **TACF:** OpenFrame_TACF_7_Fix#3_Administrator's_Guide_v2.1.4_en.pdf
  * **HiDB:** OpenFrame_HiDB_7.1_HiDB_Guide_v2.1.4_en.pdf

</details>
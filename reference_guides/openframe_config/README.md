# OpenFrame Configuration Files

Below are the configuration files which OpenFrame uses to operate and match the configuration of the customer's mainframe. All of the configuration files will end in ```.conf``` and can be found in $OPENFRAME_HOME/config folder. This may be the most challenging part of a rehosting project, as getting all of the configurations correct on the first attempt may prove to be difficult. Each of the below items are items that are found in the default configuration files and should be brought to light with the customer. Each and every configuration below must be set as it is on the mainframe, or OpenFrame will not operate as expected. By completing the below section diligently, you can reduce the amount of time it takes to rehost a mainframe dramatically.

**Note: Many of the below configurations may remain as default, but as OpenFrame expands and adapts, these default values may change in the given configuration files. It is recommended that each and every configuration file is set to Mainframe standards**

# Table of Contents 

- [Batch Related](#1-batch-related)
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

For an LRS printer, you should use the command ```LRS.sh```

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
* **rc.conf**
* **saf.conf**

  Base: Contains the OpenFrame System Access control settings
  TACF: Specifies the basic information necessary for operations of TACF, specifies the authentication method used in TACF, specifies the configurations needed in SASVR, Specifies an output message for a previous user-defined error code when checking a password in a user created function (saf_exit).

* **smf.conf**
* **sms.conf**

We need to know the DEFAULT storage volume.

Default LRECL and RECFM of a created dataset. Defautls are LRECL=80 and RECFM=FB, we need to know if this is the same on the mainframe or not.

* **sort.conf**
* **ssm.IMSADB2T.conf**
* **tacf.conf**

  TACF: When TACF is installed, the TACF configuration file tacf.conf is generated. This file contains basic TACF configuration information, specifies resource information for TACF ODBC connection, specifies whether TACF will check the group that users belong to when they attempt to access resources, and specifies to control whether RACF allows users to access datasets whos profiles are not registered in TACF.

* **textrun.conf**
* **tjclrun.conf**
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
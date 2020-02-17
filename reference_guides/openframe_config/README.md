# OpenFrame Configuration Files

Below are the configuration files which OpenFrame uses to operate and match the configuration of the customer's mainframe. All of the configuration files will end in ```.conf``` and can be found in $OPENFRAME_HOME/config folder. This may be the most challenging part of a rehosting project, as getting all of the configurations correct on the first attempt may prove to be difficult. Each of the below items are items that are found in the default configuration files and should be brought to light with the customer. Each and every configuration below must be set as it is on the mainframe, or OpenFrame will not operate as expected. By completing the below section diligently, you can reduce the amount of time it takes to rehost a mainframe dramatically. 

# Table of Contents 

- [Batch Related](#1-batch-related)
  - [ds.conf](#11-ds-conf)
    - [DATASET_DIRECTORY](#111-dataset-directory)
    - [DATASET_RESOURCE](#112-dataset-resource)
    - [DATASET_DEFAULT](#113-dataset-default)
    - [DATASET_LOCK](#114-dataset-lock)
  - [dstool.conf](#12-dstool-conf)

# 1. Batch Related

**General Information:** For anything commented out, the default values shown will be used. For the majority of the commented out settings, the default values will be sufficient. If you must investigate the options in more detail, please consult the manuals.

## 1.1 ds\.conf

<details><summary>Click here for all information regarding ds.conf</summary>

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

- 

</details>

## 1.2 dstool.conf

Base: Contains settings for dataset related tool programs such as Command section in OFManager

* **cpm.conf**

  Base: The cpm.conf configuration file contains the settings for conversion process from Mainframe to OpenFrame.

* **dbutil.conf**
* **dstool.conf**

  Base: Contains settings for dataset related tool programs such as Command section in OFManager

* **ezaci.conf**
* **ezplus.conf**
* **ftp.conf**
* **hidb.conf**

  Specifies the basic settings of OpenFrame/HiDB. In the [GENERAL] section, you can specify:

  <details><summary>See hidb.conf main options</summary>

    <pre>- COPYBOOK_DIR: Directory fo a copybook that OpenFrame/HiDB and ofschema refer to. COPYBOOK_DIR sets the preferred path used by OpenFrame/HiDB, which refers to copybooks under the subdirectory dbd_name/segment_name or psbpcb_id/senseg_name. 
    - TABLESPACE: Table space in which OpenFrame/hiDB creates segment tables, indexes, and views.
    - HIDB_OBJECT_DIR: Directory under which the hidbmgr tool generates DL/I function code
    - FIX_DATA_ERROR:
      - YES: Indicates that when an invalid data is encountered while the hidbmgr tool generates a DL/I statement, the data is set as the default value (for example, binary: 0) and no error is thrown
      - NO: Indicates that when an invalid data is encountered while the hidbmgr generates a DL/I statement, an error is processed and the program is terminated. (Default)
    - NO_INDEX_TABLE: 
      - YES: Indicates that secondary indexes are stored in the same table as the target segment table. The target and source segments must be identical, and you cannot change the index segment directly on the segment table
      - NO: Indicates that secondary indexes are stored in seperate index segment table. (Default)
    - IGNORE_FILLER: 
      - YES: Indicates that the dbdgen tool does not create a FILLER column, and that FILLER is not processed by the DL/I function created by the psbgen tool.
      - NO: Indicates that the dbdgen tool creates a FILLER column, and the FILLER is processed by the DL/I function. (Default)
    - COMMIT_INTERVAL: Maximum count that HiDB performs a DL/I function before commit. Set to a number from 0. If set to 0, commit is performed once when the database session ends. (Default: 0)
    - RESOLVE_HINT_DIR: Directory where the index hint mapping information is to be used when using the user-defined index hint in the select API of the DL/I library created by the dligen command of the hidbmgr tool.
    - FIRST_FETCH_COUNT: FIRST_ROWS hint value in the select API of the DL/I library created by the dligen command of the hidbmgr tool. Set to a number from 0. If set to 0, the FIRST_ROWS hint is not used (Default: 10)
    - GU_PREDICT_FAILURE_THRESHOLD: Number of consecutive failed GET UNIQUE. Set to a number from 0. If GET UNIQUE fails consecutively as many times as the set number, an appropriate select query is requested. (Default: 0)
    - #TODO: FIX THIS SENTENCE: GU_PREDICT_FAILURE_RESET: Number of consecutive success GET UNIQUE. Set to a number from 0. If GET UNIQUE success consecutively as many as the set number when the select query executed because GU_PREDICT_FAILURE_THRESHOLD is reached, it operates normally (Default: 0)
    - HIDB_ALTER_KEYSEQ: 
      - YES: Allows the user of a user-defined sorting order when defininig virtual columns and indexes in the database or when using a where condition for a select query. This setting is not recommended. 
      - NO: Performs the binary sort order. (Default)
    - DATABASE_CHARSET: Character set name that corresponds to the setting in the original database when using ALTER_KEYSEQ
    - EBCDIC_CHARSET: Character set name that corresponds to the user-desired sort order when using ALTER_KEYSEQ.
    - OF_CHARSET: System local value for multi-byte character processing.
    - IGNORE_AUTH_CHECK: 
      - YES: integrates with TACF to use it's user authentication.
      - NO: does not use TACF user authentication. (Default)
    - FETCH_COL_DEFAULT_VALUE: Hex value of the character to be set when the data fetched from the select API of the DL/I library created by the dligen command of the hidbmgr tool is null. (Default: 0x00)
    - RESET_APPBUF_IF_GET_FAIL: 
      - YES: sets the buffer data passed from the application to null when the DLI GET command fails. (Default)
      - NO: Does not change teh buffer data when the DLI GET command fails.
    - SKIP_POSITIONING_IF_GET_FAIL: 
      - YES: Does not specify the location of the last segment accessed when the DLI GET command fails. This setting is not recommended.
      - NO: Does not change the buffer data when the DLI GET command fails. (Default)
    - HiDB_IMPORT_DIR: Directory path to store data when using high-speed loading of hdload and hidbptmgr tools
    - USE_LEAD_FOR_GN: 
      - YES: Requests a select query along with LEAD for a DLI GET NEXT request that does not specify a search condition. (Default)
      - NO: Does not use LEAD
    - USE_LEAD_FOR_GNP: 
      - YES: requests a select query along with LEAD for a DLI GET NEXT IN PARENT request that does not specify a search condition. (Default)
      - NO: Does not use LEAD

  In the [DEBUG] section, you can specify:

    - GENERAL:
      - YES: Enables the default debugging flags when OpenFrame/HiDB is running.
      - NO: Disables the default debugging flags when OpenFrame/HiDB is running. (Default)
    - SHOW_BUFFER: (Enabled when GENERAL is set to YES)
      - YES: Processing a DL/I statement returns the buffer value of each column.
      - NO: Processing a DL/I statement does not return the buffer value of each column. (Default)
    - DISABLE_COMMIT
      - YES: Indicates that a DL/I operation does not save changes to the database.
      -NO: Indicates that a DL/I operation saves changes to the database. (Default)</pre>
    </details>

* **idcams.conf**
* **ikjeft01.conf**
* **ims.conf**

  HiDB: Used to configure control block data sets used in the DB/DC system. More specifically, allows for configuration of the default library data set and volume serial that define DBD control blocks, PSB control blocks, DAB control blocks, and ACB control blocks.

* **isrsupc.conf**
* **keyseq.conf**
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
* **print.conf**
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
# osc.regionname.conf

This configuration file describes the settings for a specific OSC region. Depending on the region name, the configuration file name may change. For example, if your region is named OSCOIVP1 (which is the region OSC comes with by default), your configuration file will be named osc.OSCOIVP1.conf. The majority of the default settings below will be for the default region OSCOIVP1. It's highly likely the majority of the settings below will have to be changed for any region other than the default one.

# Table of Contents

- [GENERAL](#1-general "General Region Configurations")
- [SAF](#2-saf "OSC Region Security Configurations")
- [SD](#3-sd "OSC Region System Definition Configurations")
- [TDQ](#4-tdq "OSC Transient Data Queue Configurations")
- [TSQ](#5-tsq "OSC Temporary Storage Queue Configurations")

## 1. GENERAL

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

## 2. SAF

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

## 3. SD

This section contains environment variables related to the system definition dataset used by the OSC application server.

- DSNAME=OSC.SDLIB.OSCOIVP1

Specifies the name of the dataset that manages the OSC system definition (OSC SD)

*Recommendation:* Change this to whatever dataset the customer is using on the mainframe. If they have no suggestion, you can use the default, and change the last node to the region name.

***

- GRPLIST=BASELIST,OIVPLIST

Specifies the name of the resource definition group used when starting up the system. If two or more names are specified, they must be separated with commas. Names must be less than 8 bytes.

*Recommendation:* Change this value to the GRPLISTs defined in the mainframe.

## 4. TDQ

TDQ stands for Transient Data Queue. This section contains environment variables related to the TDQ.

- TDQ_INTRA_DSNAME=OSC.TDQLIB.INTRA

Specifies the name of the dataset that manages the intra-partition TDQ.

*Recommendation:* Change this to the dataset used by the customer.

***

- TDQ_LOG_ADDRESS={IP_ADDRESS}:{PORT}

Specifies the address of the TDQ log server to connect to. In most cases, this will be the IP address of the server you are connected to.

The default port is 8654. If there are no conficts, you may use it, otherwise you may have to find an open port.

*Recommendation:* If you are using a single node, the IP Address can be found by executing ```hostname -i```. The default port is recommended, but can be changed if necessary.

## 5. TSQ

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
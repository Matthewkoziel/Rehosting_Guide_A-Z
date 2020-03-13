# osi.regionname.conf (OSI Region Configuration)

This configuration file handles configurations specific to a region. These parameters will be applied before any default values in osi.conf

# Table of Contents

- [GENERAL](#1-general "OSI Region General Configuration")
- [SYSTEM_MEMORY](#2-system_memory "OSI Region System Memory Configuration")
- [LIBRARY](#3-library "Region Library Configuration")
- [STORAGE](#4-storage "Region Storage Configuration")
- [CPM](#5-cpm "Region CPM Configuration")
- [SECURITY](#6-security "Region Security Configuration")
- [USER](#7-user "Region User Configuration")

## 1. GENERAL

- LOG_LEVEL=I

Determines the log level output in the system

```
D  : Debug Mode
I  : Information Mode (DEFAULT)
E  : Error Mode
```

*Recommendation:* Leave it as default (I). If there is an error in the region, this log can be turned to Debug Mode (D) for troubleshooting purposes.

- SCHEDULE_THRESHOLD=2
  
  #TODO

- SCHEDULE_RECOVER_MAXCNT=

  #TODO

## 2. SYSTEM_MEMORY

Configures the system memory region that manages important information needed for the operation of the OSI system. The system memory region is part of the shared memeory and configures information for using the shared memory in UNIX

- SHMKEY=86222

Configures the shared memory's key.

*Recommendation:* Leave it as default (86222). For additional regions, decrement this number by 10000.

***

- SHMSIZE=128

Determines the size of the system memory (in MB)

*Recommendation:* Leave it as default (128)

***

- PROTECT=WRONLY

Configures the system memory's protection method. As an item which exists for compatibility with the previous version, WRONLY must be configured.

*Recommendation:* Leave it as default (WRONLY)

## 3. LIBRARY

Sets the locations of the staging libraries where various information needed for operating the OSI system is stored. The staging library is the dataset where the administrator adds or modifies operational data. When operating the system, read and use the active library where this content is copied.

- MODBLKS=OSI.IMSA.DEFLIB

Configures the Dataset Name (DSN) of the staging library where the configuration of various resources supported in OSI are stored.

*Recommendation:* If the customer already has a dataset name for MODBLKS on the mainframe, use that dataset name. Otherwise, OSI.{REGION}.DEFLIB works well too.

***

- IMSACB=IMS.ACBLIB

Configures the DSN of the staging library dataset where ACB is stored

*Recommendation:* If the customer already has a dataset name for the ACBLIB in the mainframe, use that dataset name. Otherwise, OSI.{REGION}.ACBLIB works well too.


***

- MATRIX=OSI.IMSA.SECLIB

Configures the DSN of the staging library dataset where the security information, supported in OSI is stored.

*Recommendation:* If the customer already has a dataset name for the SECLIB in the mainfrmae, use that dataset name. Otherwise, OSI.{REGION}.SECLIB works well too.

***

- FORMAT=OSI.IMSA.MFSLIB

Configures the DSN of the staging library dataset where MFS is stored

*Recommendation:* If the customer already has a dataset name for the MFSLIB in the mainframe, use that dataset name. Otherwise, OSI.{REGION}.MFSLIB works well too.

## 4. STORAGE

  #TODO

## 5. CPM

Configures the CPM data file to be used when code conversion between the EBCDIC code and the ASCII code is required in the OSI system. 

- EBCDIC_TO_ASCII=EBCASCUS.cpm

Configures the CPM data file used when converting the EBCDIC code to ASCII code.

*Recommendation:* Unless the cpm files are modified and have been changed to something else, it is recommended to use the default (EBCASCUS.cpm)

***

- ASCII_TO_EBCDIC=ASCEBCUS.cpm

Configures the CPM data file used when converting ASCII code to EBCDIC code.

*Recommendation:* Unless the cpm files are modified and have been changed to something else, it is recommended to use the default (ASCEBCUS.cpm)

***

- CONVERT_TO_SPACE=X'00'

  #TODO

## 6. SECURITY

Sets options for applying Security in the OSI system and whether to use LTERM Security and Transaction Command Security, which are managed through the Security Maintenance Utility (SMU) of IMS/DC provided by OSI.

- SMU_TERMINAL=YES

Configures whether to use LTERM Security

```
YES : It is used
NO  : It is not used
```

*Recommendation:* Change this value to (YES)

***

- SMU_TRANSACTION=YES

Configures whether to use Transaction Command Security

```
YES : It is used
NO  : It is not used
```

*Recommendation:* Change this value to (YES)

***

- TYPE

  #TODO

## 7. USER

Configures the information which users can specify in the OSI system.

- LOGON_MOD=OSILOGOO

When logged on to the OSI system, configures the MOD name which is displayed in the initial screen. (Basically configures the logon screen)

*Recommendation:* Ask if the customer has a logon page they already use, if so, use that MOD name, otherwise, leave it as default (OSILOGOO)

***

- LOGON_UC=YES

  #TODO

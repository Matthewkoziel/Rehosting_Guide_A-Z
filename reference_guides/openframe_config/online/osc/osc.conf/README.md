# osc.conf (OSC Configuration)

This configuration file is used to configure the TSAM and OSC system settings that are common to all OpenFrame OSC regions. 

# Table of Contents

- [GENERAL](#1-general "General OSC Configuration")
- [TSAM_CLIENT](#2-tsam_client "TSAM Client Configuration")
- [TSAM_BACKUP](#3-tsam_backup "TSAM Backup Configuration")
- [OSCSCSVR](#4-oscscsvr "OSCSCSVR Server Configuration")
- [OSCMCSVR](#5-oscmcsvr "OSCMCSVR Server Configuration")
- [OSCOLSVR](#6-oscolsvr "OSCOLSVR Server Configuration")
- [OSCOSSVR](#7-oscossvr "OSCOSSVR Server Configuration")

## 1. GENERAL

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

## 2. TSAM_CLIENT

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

## 3. TSAM_BACKUP

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

## 4. OSCSCSVR

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

## 5. OSCMCSVR

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

## 6. OSCOLSVR

This server is responsible for recording OSC application transaction logs. It communicates with application servers through the TMAX engine.

- BUFFER_SIZE=4096

  #TODO

***

- FLUSH_INTERVAL=0

  #TODO

## 7. OSCOSSVR

This server runs OpenFrame Manager. It must be set up if OpenFrame Manager will be used.
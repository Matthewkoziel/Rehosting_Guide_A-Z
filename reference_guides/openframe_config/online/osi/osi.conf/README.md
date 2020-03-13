# osi.conf (OSI Configuration)

This file contains configurations related to OpenFrame Online Subsystem for IMS DB/DC. 

# Table of Contents

- [GENERAL](#1-general "OSI GENERAL Configurations")
- [TSAM_CLIENT](#2-tsam_client "TSAM_CLIENT Configuration")
- [TSAM_BACKUP](#3-tsam_backup "TSAM_BACKUP Configuration")
- [VTAM](#4-vtam "OSI VTAM Configuration")
- [OSIGW001](#5-osigw001 "OSIGW Configuration")
- [CRC](#6-crc "CRC Configuration")

## 1. GENERAL

- LOG_LEVEL=D

Configures the log level output of the TN3270 Gateway.

```
D  : Debug Mode
I  : Information Mode (DEFAULT)
E  : Error Mode
```

*Recommendation:* Leave it as default (I) If there is an issue, it's recommended to change to Debug Mode (D) to find the source of the issue.

## 2. TSAM_CLIENT

- USERNAME={USERNAME}

The username used when accessing Tibero/TSAM.

*Recommendation:* Check with the customer to see if they want to set up a default user.

***

- PASSWORD={PASSWORD}

The password for the username above.

*Recommendation:* Change this to the user above's password.

***

- DATABASE={TB_SID}

The SID of the database used as the Tibero/TSAM server. This information can be found with the following command, in most cases.

```bash
echo $TB_SID
```

*Recommendation:* Try running the command, if it gives you a value, use that for this field.

## 3. TSAM_BACKUP

- USERNAME={USERNAME}

The username used for connecting to TSAM

*Recommendation:* Check with the customer to see if they would like to use a default user.

***

- PASSWORD={PASSWORD}

The password for the user above.

*Recommendation:* Change this to the user above's password.

***

- DATABASE={TB_SID}

The SID of the database used by TSAM. This information can be found with the following command, in most cases.

```bash
echo $TB_SID
```

*Recommendation:* Try running the command, if it gives you a value, use that for this field.

***

- RETRY_COUNT=10

The number of times to try reconnecting to the backup address, if the connection to TSAM fails

*Recommendation:* Leave it as default (10)

***

- RETRY_INTERVAL=10

The interval between attempts to reconnect to the backup server

*Recommendation:* Leave it as default (10)

## 4. VTAM

- SHMKEY=85222

Configures the key value of the shared memory which TN3270 (VTAM) uses. 

*Recommendation:* Leave it as default (85222).

***

- SHMSIZE=64

Configures the size of the shared memory which TN3270 Gateway (VTAM) uses.

*Recommendation:* Leave it as default (64).

***

- USERMSG_PATH=/tmp/osivtam

Displays a blank screen by default for the terminal which accesses TN3270 Gateway (VTAM), but can display an itnitial screen using data from a text file. 

*Recommendation:* Leave it as default (/tmp/osivtam).

***

- SYSMSG=ON

  #TODO

- DSNAME=OSI.IMSA.VTAMLIST

To use the IP-LU mapping function, specify the dataset name where the data is stored. 

*Recommendation:* Change this value to the name of the dataset that holds the IP-LU mapping function.

***

- MAXAPPL=1024

Specifies the maximum number of APPLID which TN3270 Gateway can accommodate. 

It is compared with the SHMSIZE value according to the value specified here (The value where MAXAPL is multipled to the memory space required for a single APPLILD), and if it is larger, ten a suitable error message is output. 

*Recommendation:* Leave it as default (1024)

***

- USE_VDS=OFF

Determines whether to use the IP-LU Function

```
ON  : Uses the IP-LU Function
OFF : Deosn't use the IP-LU Function
```

*Recommendation:* Leave it as default (OFF).

## 5. OSIGW001

This section shows the configuration with the same name as the server name that is registered in the Tmax Environemnt. To decrease the load on the TN3270 Gateway, it starts a number of servers. Each server operates in the same shared memory.

- PORT=8487

Port number which individual TN3270 Gateway Uses.

*Recommendation:* Increment this number by some amount for each additional gateway.

***

- CHANNEL=1024

Configures the maximum number of terminals which individual TN3270 gateway can use

*Recommendation:* Leave it as default (1024)

***

- CHECKIP=NO

  #TODO

## 6. CRC

This section describes mapping the control region (in which the command will be run) with the Command Recognition Character (CRC) when an OSI command is run.

- /=IMSA

In the example above, the forward slash (/) denotes the CRC character for identifying the region which will perform the command. An example of a command would be: 

```
osicmd /CHE FREEZE
```

The slash denotes that the IMSA region should perform the CHECKPOINT FREEZE command and it will shutdown the region.

*Recommendation:* Use a different character for each region.

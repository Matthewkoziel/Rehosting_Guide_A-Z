# ftp.conf (FTP Configuration)

This configuration file has settings related to the FTP utility in OpenFrame. Please do not confuse this configuration file with the Linux FTP tool.

# Table of Contents

- [DIRECTORY](#1-directory "Directory Configuration")
- [UNIT](#2-unit "Unit Configuration")
- [DATASET_DEFAULT](#3-dataset_default "Dataset FTP Default Configuration")
- [ERROR](#4-error "FTP Error Configuration")
- [COMMAND_OPERATION](#5-command_operation "Command Operation FTP Configuration")
- [OPTION](#6-option "FTP Option Confiugration")

## 1. DIRECTORY

- FTP_WORK_DIR=${OPENFRAME_HOME}/volume_default

Sets the work directory that is used for the FTP program to send data to the FTP server. If there is no entry, or nothing is specified, the [DIRECTORY] TEMP_DIR from the ofsys.conf is specified by default.

*Recommendation:* Check with the customer what volume you wish to send FTP'd files to.

## 2. UNIT

- DEFAULT=3380

Sets the default unit to be used for the FTP utility to send and receive datasets. If there is no entry, or nothing is specified, the value from the DEFAULT_VOLSER parameter, under [DATASET_DEFAULT] in ds.conf is used.

## 3. DATASET_DEFAULT

- CHECK_DSAUTH_V2=YES

Determines whether to check permission to allocate datasets.

  * YES: Checks permission for the dataset
  * NO:  Does not check permission for the dataset (DEFAULT)

*Recommendation:* Leave it as default until near ready for production.

## 4. ERROR

These are just messages that can be returned to the user for various errors.

*Recommendation:* Leave them all as default.

## 5. COMMAND_OPERATION

- PUT_COND=N

Determines how to process the PUT command if the dataset does not exist. If there is no entry, or nothing is specified, NO is specified by default.

*Recommendation:* Leave it as default (N)

## 6. OPTION

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

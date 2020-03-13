# tjclrun.conf (TJCLRUN Configuration)

This configuration file determines many of the default values and settings built around batch JOBs. This is a very important configuration file and should be looked at carefully.

# Table of Contents

- [JOB](#1-job "Tjclrun JOB Configuration")
- [PERFORM](#2-perform "Tjclrun PERFORM Configuration")
- [DD](#3-dd "Tjclrun DD Configuration")
- [DDTAB](#4-ddtab "Tjclrun DDTAB Configuration")
- [SYSLIB](#5-syslib "Tjclrun SYSLIB Configuration")
- [PRELOAD](#6-preload "Tjclrun PRELOAD Configuration")
- [PGM](#7-pgm "Tjclrun PGM Configuration")
- [DBCONN_INFO](#8-dbconn_info "Tjclrun DBCONN Configuration")
- [ACCOUNT](#9-account "Tjclrun ACCOUNT Configuration")
- [TACF](#10-tacf "Tjclrun TACF Configuration")
- [AMS](#11-ams "Tjclrun AMS Configuration")
- [JCL](#12-jcl "Tjclrun JCL Configuration")
- [OPTION](#13-option "Tjclrun OPTION Configuration")
- [DEBUG](#14-debug "Tjclrun DEBUG Configuration")

## 1. JOB

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

## 2. PERFORM

Specifies whether to indicate CPU usage priority and configures CPU priorities

- USE_PERFORM = NO

Specifies whether or not the PERFORM parameter will be used to indicate CPU usage priority (This attribute is optional). If this element is not specified, PERFORM parameters will be ignored in JCL.

*Recommendation:* Leave it as default (NO)

***

- <PERFORM_VALUE> = <NICE_VALUE>

A table that maps PEROFRM values to CPU priorities. If USE_PERFORM is set to YES, this must be set as well. PERFORM supports a range of values from 1-999; CPU priorities in UNIX (NICE values) range from 0-39. All values within the mappting table must adhere to these limits.

Here's a little information on NICE_VALUES and Priorities in Linux: [Process "Niceness" vs "Priority"](https://askubuntu.com/questions/656771/process-niceness-vs-priority "From askubuntu.com")

## 3. DD

Specifies the length of records in the instream-dataset and the count limit of records that can be written in a spool dataset in JCL

- INSDSET_LRECL = 80

Specifies the length of records in the instream-dataset in JCL (This attribute is optional). If the instream-dataset is shorter than the specified length, the dataset will be padded with spaces. If the instream-dataset is longer than the specified length, excess data will be truncated (default: 80)

*Recommendation:* Leave it as default (80)

***

- OUTLIM = 0

Specifies the count limit of records that can be written in a spool dataset in JCL (This attribute is optional). A value between 0 and 16777215 can be specified. If the value is less than 0 or greater than 16777215, 0 or 16777215 is used, respectively. If 0 is specified, record count has no limit. If this element is not specified, the default value is 0.

*Recommendation:* Leave it as default (0)

## 4. DDTAB

Defines the maximum possible number of JCL DD data used in JCL (including JCL procedures) when tjclrun executes jobs.

- DDTAB_MAX = 1024

Defines the maximum possible number of JCL DD data used in JCL (including JCL procedures) when tjclrun executes jobs (This attribute is optional). The default is 512, and the maximum is 65535. For example, if DDTAB_MAX is set to 1024, up to 1024 D of data (including the JCL procedures called from the job or INPJCL) can be used in a single job. Anything larger is regarded as a possible error and the job will shut down abnormally. The error message "No free DD entry in ddtab" is printed to the SYSMSG. In this case, DDTAB_MAX value can be raised to avoid the error.

*Recommendation:* Leave it as default (1024)

## 5. SYSLIB

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

## 6. PRELOAD

  #TODO

## 7. PGM

Determines whether or not to invoke the batch program which is compiled as common libraries, using the utilitiy program PGMRTW00 by tjclrun (This attribute is optional).

- USE_PGMRTS00=NO

```
YES : tjclrun invokes the PGMRTS00 utility if the pgoram is not executable and dynamically loads the batch program compiled as common libraries by PGMRTS00.
NO  : tjclrun can only invoke programs compiled as an executable (default)
```

*Recommendation:* Leave it as default (NO)

## 8. DBCONN_INFO

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

## 9. ACCOUNT

Determines whether the process owner of the invoked batch program should be set to the USER parameter value defined in the JCL.

- SETUID = NO

```
YES : the tjclrun program should be installed as root. Programs invoked during the job process are to be processed as defined by the user in the JCL job. Also, the files and other resources created during the job process ar checked against the job user.
NO  : The operator who booted the TJES system, especially the Runner slot process owner becomes the process owner of any batch programs invoked during tjclrun or job steps. In this case, this user cannot operate as another user with the USER parameter in the JCL job data. All OS level ownerships are checked as the operator and the process owner is also the OS userid of the same operator (DEFAULT).
```

*Recommendation:* Leave it as default (NO)

## 10. TACF

Determines whether or not to check the TACF access authority among the TACF support features by tjclrun and the TACF execution authority for the main utility programs in the TACF support features.

- CHECK_DSAUTH=NO

Determines whether or not to check the TACF access authority among the TACF support features by tjclrun (This attribute is optional). 

*Recommendation:* Leave it as default (NO)

***

- CHECK_UTAUTH=NO

Determines whether or not to check the TACF execution authority for the main utility programs in the TACF support featurues (This attribute is optional). 

*Recommendation:* Leave it as default (NO)

## 11. AMS

Decides whether to keep the connection with AMS while the Runner is running, or to cut and connect whenever needed (This attribute is optional).

- CONNECTION=KEEP

The option to cut and connect whenever needed is NOKEEP while the option to keep the connection with AMS is KEEP.

*Recommendation:* Leave it as default (KEEP)

## 12. JCL

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

## 13. OPTION

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

## 14. DEBUG

Determines whether to print and process profile information to analyze tjclrun performance (This attribute is optional).

- PROFILE=NO

```
YES : The printed log includes date information per process step to help analyze performance.
NO  : The messages are not included. It is recommended that this is not set to YES unless the performance of tjclrun is being analyzed (DEFAULT)
```

*Recommendation:* Leave it as default (NO)

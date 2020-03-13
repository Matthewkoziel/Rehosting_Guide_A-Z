# ds.conf (Dataset Configuration)

This configuration file stores general configuration settings for datasets used in OpenFrame.

More information about ds.conf can be found in the manual: OpenFrame_Base_Fix#3_Data Set Guide_v2.1.3_en.pdf

# Table of Contents

- [DATASET_DIRECTORY](#1-dataset_directory "Location settings for Dataset Schema files")
- [DATASET_RESOURCE](#2-dataset_resource "Memory Resources for Datasets")
- [DATASET_DEFAULT](#3-dataset_default "Default Values for Datasets")
- [DATASET_LOCK](#4-dataset_lock)

## 1. Dataset Directory

Stores information on where the schema files should be pulled from for dsmigin/dsmigout.

*Recommendation:* Leave it as default ($OPENFRAME_HOME/schema)

## 2. Dataset Resource

Shared Memory Key for dataset allocation information

*Recommendation:* Leave it as default (61482)

## 3. Dataset Default

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

## 4. Dataset Lock

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
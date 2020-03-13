# ikjeft01.conf (IKJEFT01 Configuration)

Configuration file for the IKJEFT01 utility.

# Table of Contents

- [SHARED_OBJECT](#1-shared_object "Shared Object Configuration")
- [REPORT_DBCONN](#2-report_dbconn "Database Configuration for IKJEFT01")
- [TACF](#3-tacf "IKJEFT01 TACF Rules")

## 1. SHARED_OBJECT

- DB_USE=YES

Sets whether the database is used or not.

*Recommendation:* Leave it as default (YES)

- SYSTEM=DBPA

Sets the default database system name

*Recommendation:* Leave it as default (DBPA)

- DLOPEN_GLOBAL

Option to use externam variables in batch application

*Recommendation:* Leave it as default (NO)

## 2. REPORT_DBCONN

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

## 3. TACF

- CHECK_PGMAUTH=NO

Checks TACF authorization when IKJEFT01 access a dataset.

*Recommendation:* Leave it as default (NO). Check with customer to see if they want to change this during production time.

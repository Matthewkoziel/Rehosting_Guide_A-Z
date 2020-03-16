# hidb.conf (High Performance Hierarchical Database Configuration)

The following configuration file is for OpenFrame HiDB which stands for High Performance, Heirarchical database. The database is used for IMS systems and is built into Tibero. HiDB is, as the name implies, a hierarchical database, but it is built into a Relational Database, Tibero. HiDB meta tables usually start with OFM_HIDB. These meta tables allow the hierarchy to be built into the relational database through a series of columns that tell Tibero which segment is another segment's parent, child, or sibling.

# Table of Contents

- [HIDB_DEFAULT](#1-hidb_default "Default HiDB Configuration")
- [DEBUG](#2-debug "HiDB Debug Configuration")
- [DB_LOGIN](#3-db_login "HiDB Login Configuration")
- [DEFAULT_USER](#4-default_user "HiDB Default User Configuration")

## 1. HIDB_DEFAULT

- COPYBOOK_DIR=${OPENFRAME_HOME}/hidb/hidb_cpy

Directory of copybooks that OpenFrame/HiDB and ofschema refer to. This sets the preferred path used by HiDB. 

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/hidb/hidb_cpy).

***

- TABLESPACE=DEFVOL

Tablespace in which HiDB creates segment tables, indexes, and views. 

*Recommendation:* Check with the customer to see which volume they would like to store HiDB data on, and change this variable accordingly.

***

- HIDB_OBJECT_DIR=${OPENFRAME_HOME}/hidb/hidb_sch

Directory under which the hidbmgr tool generates DL/I function code.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/hidb/hidb_sch)

***

- FIX_DATA_ERRORS=NO

```
YES : Indicates that when an invalid data is encountered while the hidbmgr tool generates a DL/I statement, the data is set as the default value (for example, binary:0) and no error is thrown.

NO : Indicates that when an invalid data is encountered while the hidbmgr generates a DL/I statement, an error is processed and the program is terminated
```

*Recommendation:* Leave it as default (NO). This one is important, If you change this to yes, there could be invalid data in the database which could cause a slew of problems down the road. 

***

- USE_DBD_COPYBOOK=NO

  #TODO

***

- NO_INDEX_TABLE=NO

```
YES : Indicates that secondary indexes are stored in the same table as the target segment table. The target and source segments must be indentical, and you cannot change the index segment directly on the segment table.

NO  : Indicates that secondary indexes are stored in a separate index segment table (DEFAULT)
```

*Recommendation:* Leave it as default (NO)

***

- IGNORE_FILLER=NO

```
YES : Indicates that the dbdgen tool does not create a FILLER column, and that FILLER is not processed by the DL/I function created by the psbgen tool.

NO  : indicates that the dbdgen tool creates a FILLER column and the FILLER column is processed by the DL/I function. (DEFAULT)
```

*Recommendation:* Leave it as default (NO)

***

- COMMIT_INTERVAL=0

Maximum count that HiDB performs a DL/I function before commit. Set to a number from 0. If set to 0, commit is performed once the database session ends.

*Recommendation:* Leave it as default (0)

***

- RESOLVE_HINT_DIR=

Directory where the index hint mapping information is to be used when the user-defined index hint in the select API of the DL/I library created by the dligen commannd of the hidbmgr tool.

  #TODO

***

- FIRST_FETCH_COUNT=10

FIRST_ROWS hint value in the select API of the DL/I library created by the dligen command of the hidbmgr tool. Set to a number from 0. If set to 0, the FIRST_ROWS hint is not used (Default: 10)

*Recommendation:* Leave it as default (10)

***

- GU_PREDICT_FAILURE_THRESHOLD=0

Number of consecutive failed GET UNIQUE requests. Set to a number from 0. If GET UNIQUE fails consecutively the amount of times set in this configuration, an appropriate select query is requested.

*Recommendation:* Leave it as default (0)

***

- GU_PREDICT_FAILURE_RESET=0

Number of consecutive success GET UNIQUE. Set to a number from 0. If GET UNIQUE is successful consecutively the amount of times set in this configuration, due to GU_PREDICT_FAILURE_THRESHOLD is met, the prediction count is reset and resumes operating normally.

*Recommendation:* Leave it as default (0)

***

- HIDB_ALTER_KEYSEQ=NO

```
YES : Allows to use a user-defined sorting order when defininig virtual columns and indexes in the database or when using a where condition for a select query. This setting is not recommended

NO  : Performs the binary order sort (DEFAULT)
```

*Recommendation:* Leave it as default (NO)

***

- DATABASE_CHARSET=

Character set name that corresponds to the setting in the original database when using ALTER_KEYSEQ

*Recommendation:* Do not use HIDB_ALTER_KEYSEQ, leave it as default (\<BLANK\>)

***

- EBCDIC_CHARSET=

Character set name that corresponds to the user-desired sort order when using ALTER_KEYSEQ.

*Recommendation:* Do not use HIDB_ALTER_KEYSEQ, leave it as default (\<BLANK\>)

***

- OF_CHARSET=

System local value for multi-byte character processing

*Recommendation:* Leave it as default (\<BLANK\>)

***

- HIDB_USE_TIBERO_OF_UTL_PACKAGE=NO

Whether to convert EBCDIC by using the UTL_OF package, instead of CONVERT, when using HIDB_ALTER_KEYSEQ in OpenFrame, EBCDIC conversion needs OpenFrame cpm file. In Tibero the conversion needs the cpm file set in the \_CPM\_FILE item of the tip file.

*Recommendation:* Leave it as default (NO)

***

- IGNORE_AUTH_CHECK=YES

```
YES : Integrates with TACF to use its user authentication

NO  : Does not use TACF user authentication
```

*Recommendation:* Change this value to (YES) #TODO

***

- FETCH_COL_DEFAULT_VALUE=0x00

Hex value of the character to be set when the data fetched from the select API of the DL/I library created by the dligen command of the hidbmgr tool is null.

*Recommendation:* Leave it as default (0x00)

***

- RESET_APPBUF_IF_GET_FAILS=YES

```
YES : Sets the buffer data passed from the application to null when the DLI GET command fails (DEFUAULT)

NO  : Does not change the buffer data when the DLI GET command fails
```

*Recommendation:* Leave it as default (YES)

***

- SKIP_POSITIONING_IF_GET_FAIL=NO

```
YES : Does not specify the location of the last segment accessed when the DLI GET command fails. This setting is not recommended.

NO  : Does not change the buffer data when the DLI GET command fails (DEFUALT)
```

*Recommendation:* Leave it as default (NO)

***

- HIDB_IMPORT_DIR=${OPENFRAME_HOME}/hidb/hidb_import

Directory path to store data when using high-speed loading of hdload and hidbptmgr tools

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/hidb/hidb_import)

***

- USE_LEAD_FOR_GN=YES

```
YES : Requests a select query along with LEAD for a DLI GET NEXT request that does not specify a search condition (DEFAULT)

NO  : Does not use LEAD
```

*Recommendation:* Leave it as default (YES)

***

- USE_LEAD_FOR_GNP=YES

```
YES : Requests a select query along with LEAD for a DLI GET NEXT IN PARENT request that does not specify a search condition (DEFAULT)

NO: Does not use LEAD
```

*Recommendation:* Leave it as default (YES)

***

- USE_LEAD_FOR_UNQUAL_COND=

```
YES : Requests a select query along with LEAD for a DLI GET NEXT (IN PARENT) request that specifies only a segment name as a search condition when USE_LEAD_FOR_GN/GNP is YES (DEFAULT)

NO: Does not use Lead
```

*Recommendation:* Change this value from \<BLANK\> to (YES)

***

- USE_INDICATOR=

```
YES : Improves performance by using indicator variables when DLI library requests select on GET commands

NO  : Does not use indicator variables (DEFAULT)
```

*Recommendation:* Leave it as default (\<BLANK\>)

***

- ARRAY_BUFFER_MAX_SIZE=

Number from 0 to 5000. If the number is equal to or greater than 1, the performance of some GET NEXT commands increases by using array buffering (default: 0).

*Recommendation:* Leave it as default (\<BLANK\>)

***

- USE_KEYFLD_SEQ_FOR_HDAM=

```
YES : sorts HDAM/PHDAM root segments defined in DB in key field order (Recommended)

NO  : Sorts HDAM/PHDAM root segments defined in DB in OCC_ID order
```

*Recommendation:* Change this value to (YES)

***

- USE_DBD_DBMS_LOCK=

  #TODO

***

- HOLD_SELECT_FOR_UPDATE=

  #TODO

## 2. DEBUG

This section describes the options available for HiDB Debugging and logs.

- GENERAL=NO

Option to enable the default debugging flags when OpenFrame HiDB is running. (Default: NO)

*Recommendation:* Leave it as default (NO). This option can be extremely helpful in finding errors in online transactions with OSI and HiDB. It's highly recommended to change this to YES when trying to troubleshoot those issues.

***

- SHOW_BUFFER=NO

Enabled when GENERAL is set to YES. If this option is set to YES, processing a DL/I statement returns the buffer value from each column (Default: NO)

*Recommendation:* Leave it as default (NO)

***

- DISABLE_COMMIT=NO

```
YES : indicates that a DL/I operation does not save changes to the datbase

NO  : Indicates that a DL/I operation saves changes to the database (DEFAULT)
```

*Recommendation:* Leave it as default (NO)

***

- PRINT_STATISTICS=NO

  #TODO

## 3. DB_LOGIN

Specify connection information to the database that HiDB uses. Since HiDB resides in Tibero, you should pass the Tibero information here.

- DATABASE={TB_SID}

The Tibero database connection address used by OSI/HiDB. If you are unsure, in most cases you can run the following command to get this information:

```bash
echo $TB_SID
```

- USERNAME={USERNAME}

The default username to create a connection to Tibero/HiDB.

- PASSWORD={PASSWORD}

The password of the user above.

## 4. DEFAULT_USER

The default username and password for tacf.

- USERNAME={USERNAME}

- PASSWORD={PASSWORD}

- ENPASSWD=

This option allows the user to use an encrypted password.
# tjesmgr.conf (TJESMGR Configuration)

Various options for the tjesmgr command.

# Table of Contents

- [DEFAULT_OPTION](#1-default_option "Default Options for TJESMGR")
- [DEFAULT_USER](#2-default_user "Default User for TJESMGR")
- [TACF](#3-tacf "TACF Configuration for TJESMGR")

## 1. DEFAULT_OPTION

- SPOOL_LIST=GTZERO

```
ALL    : Shows all spools
EXIST  : Shows spools with spool files only
GTZERO : Shows spools with the file size larger than 0
```

*Recommendation:* Leave it as default (GTZERO)

***

- EDITOR=/usr/bin/vi -w&ROWCOUNT &FILEPATH

Defines which editor to use

*Recommendation:* Leave it as default (/usr/bin/vi -w&ROWCOUNT &FILEPATH). If vi does not exist at that exact path, you may have to change this value slightly.

***

- VIEWER=/usr/bin/vi -w&ROWCOUNT -R &FILEPATH

Defines which viewer to open a spool.

*Recommendation:* Leave it as default (/usr/bin/vi -w&ROWCOUNT -R &FILEPATH). Again, if vi does not exist at that exact path, you may have to change this value slightly.

***

- DEFAULT_RUNNING_NODE=ANY

```
MY  : Enables JOB execution only on its own node if no node is defined upon job submission
ANY : Enables job execution from any node if no node is defined upon job submission
```

*Recommendation:* Leave it as default (ANY)

## 2. DEFAULT_USER

Specifies the default user to execute tjesmgr commands if no user is specified.

- USERNAME=${USERNAME}

- PASSWORD=${PASSWORD}

- GROUPNAME=${GROUPNAME}

*Recommendation:* Check with customer to see which default user they would like to use for tjesmgr commands.

## 3. TACF

- CHECK_CMDAUTH=YES

If this is set to YES, authorization is checked against the tjesmgr commands

*Recommendation:* Leave it as default (YES)
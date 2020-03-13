# sort.conf (Sort Configuration)

This configuration file is for the DFSORT (SYNCSORT, PROSORT) utilities.

# Table of Contents

- [WORKSPACE](#1-workspace "Sort Workspace Configuration")
- [OPTION](#2-option "Sort Options Configuration")
- [PATH](#3-path "Sort Path Configuration")
- [SEQUENCE](#4-sequence "Sort Sequence Configuration")

## 1. WORKSPACE

- USE=NO

Sets whether to use the workspace specified in the configuration file. (If set to NO, you may skip this WORKSPACE section)

*Recommendation:* Leave it as default (NO)

***

- COUNT=3

Specifies the number of workspaces to use, the default value is 3, and the number can be set up to 10. Each workspace should be numbered from 0 to 9 if using all 10.

*Recommendation:* Leave it as default (3)

***

- WORKSPACEX=${OPENFRAME_HOME}/temp/sort0

The X in WORKSPACEX signifies a number starting at 0 working up to 9. Specifies the path of the workspace when USE is set to YES

*Recommendation:* Leave it as default (Set the path in ${OPENFRAME_HOME}/temp and number the sorts from 0 to 9 with respect to the WORKSPACE number)

## 2. OPTION

- STABLE_SORT=YES

Specifies whether to use stable sort or not. This setting is for SYNCSORT, and the default is YES. If you use ProSort, use the setting of the ProSort tip file or EQUALS/NOEQUALS

*Recommendation:* Leave it as default (YES)

***

- MEMORY_LIMIT=512

Sets the maximume size of memory that SORT can use. If set to 0, it means unlimited. For ProSort, recommendation is between 64 and 512 MB.

*Recommendation:* Leave it as default (512)

***

- SEQUENCE=ASCII

Specifies a sort order. This option is for SYNCSORT.

*Recommendation:* Change this to EBCDIC

***

- SOLRF=YES

Specifies which length will be used when the SORTOUT record length is not set 

*Recommendation:* Leave it as default (YES)

***

- FSZEST=NO

Option to ignore the SIZE option in an OPTION statement.

```
YES: ignore the SIZE option
NO:  Do not ignore the SIZE option
```

*Recommendation:* Leave it as default (NO)

## 3. PATH

Currently no configuration changes needed for this section.

## 4. SEQUENCE

Currently no configuration changes needed for this section.
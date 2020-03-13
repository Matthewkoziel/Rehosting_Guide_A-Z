# cpm.conf (CPM Configuration)

The cpm.conf configuration file contains the settings for conversion process from EBCDIC to ASCII and ASCII to EBCDIC.

# Table of Contents

- [DEFAULT_CODEPAGE](#1-default_codepage "Default conversion file settings for CPM")

## 1. DEFAULT_CODEPAGE

- EBC2ASC=${OPENFRAME_HOME}/cpm/EBCASCUS.cpm

Sets the EBCDIC to ASCII cpm file. There are many different cpm files in ${OPENFRAME_HOME}/cpm which can be modified using the cpmmgr tool. Learn more about the cpmmgr tool here: #TODO

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/cpm/EBCASCUS.cpm)

***

- ASC2EBC=${OPENFRAME_HOME}/cpm/ASCEBCUS.cpm

Sets the ASCII to EBCDIC cpm file. 

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/cpm/ASCEBCUS.cpm)

***

- SO=0A42

Sets the SO hexa code for SOSI characters in mainframe.

*Recommendation:* Confirm with customer the SOSI values and set accordingly

***

- SI=0A41

Sets the SI hexa code for SOSI characters in mainframe

*Recommendation:* Confirm with customer the SOSI values and set accordingly
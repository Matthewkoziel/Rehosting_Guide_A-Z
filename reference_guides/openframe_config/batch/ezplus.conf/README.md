# ezplus.conf (EZPLUS Configuration)

ezplus.conf is a configuration file for the EZTPA00 utility which is used to execute CA-Easytrieve Plus scripts entered as SYSIN from JCL.

# Table of Contents

- [EZV](#151-ezv "EZPLUS work area")

## 1. EZV

- WORK_DIR=${OPENFRAME_HOME}/temp/ezwork

Specifies a work area for calling ProTrieve from EZTPA00. It is used to temporarily save the script to transfer to ProTrieve.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/temp/ezwork)

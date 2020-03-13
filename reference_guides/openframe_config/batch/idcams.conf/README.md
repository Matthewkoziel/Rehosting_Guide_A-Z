# idcams.conf (IDCAMS Configuration)

The IDCAMS utility uses the idcams.conf configuration file in ${OPENFRAME_HOME}/config. When IDCAMS is used by TACF, it will prompt for Username, Group name, and Password which can be defined in the configuration file as well as other features.

# Table of Contents

- [DEFAULT_USER](#1-default_user "Default Configuration for IDCAMS")
- [TACF](#2-tacf "Security Configuration for IDCAMS")
- [AMS](#3-ams "AMS Configuration")

## 1. DEFAULT_USER

- USERNAME
- GROUPNAME
- PASSWORD

Defines the username, groupname, and password for bypassing the prompt by storing the above information. However, if you execute the IDCAMS as a JOB step, the configuration itself is bypassed.

## 2. TACF

- CHECK_DSAUTH=NO

When TACF is used with IDCAMS, setting the CHECK_DSAUTH to YES performs a permission check upon each access to the dataset from IDCAMS functional commands.

## 3. AMS

Currently, there are no default values set in the AMS configuration portion of this tool.

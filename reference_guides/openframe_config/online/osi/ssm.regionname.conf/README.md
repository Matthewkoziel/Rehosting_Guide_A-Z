# ssm.regionname.conf (Subsystems Manager Configuration)

This is the Resource Manager for Subsystems Manager configuration file. Specifically, this configuration file will be used for configuring XA with DB2 databases.

# Table of Contents

- [GENERAL](#2261-general "SSM General Configuration")
- [SSM](#2262-ssm "SSM Configuration")

## 1. GENERAL

- DLI_CONN_ID=DLI

  #TODO

***

- PRELOAD=${TB_HOME}/client/lib/libtbxa.so:${DB2_HOME}/lib/libdb2.so

## 2. SSM

- SST=DB2,SSN=DB2T,LIT=,ESMT=,RTT=,REO=,CRC=

  #TODO
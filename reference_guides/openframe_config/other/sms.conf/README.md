# sms.conf (Storage Mangement System Configuration)

Stores Definitions of the SMS classes used by OpenFrame Storage Management System. SMS classes can be used as a JCL parameter or in the acs.conf file.

# Table of Contents

- [DATACLAS](#1-dataclas "DATACLASS Configuration")
- [MGMTCLAS](#2-mgmtclas "MGMTCLASS Configuration")
- [STORCLAS](#3-storclas "STORCLASS Configuration")

## 1. DATACLAS

Data classes can be defined like the following:

- {DCLASS_NAME}=({PARAMETER1},{PARAMETER2})

Notice that each parameter is separated by a comma (,) and all parameters are encapsulated in parentheses ().

Available Parameters are below:

```
RECFM      : Record Format
LRECL      : Logical Record Size
AVGREC     : Space Scaling Factor
AVGVAL     : Average Record Size
PRIMARY    : Primary Allocation Quantity
SECONRDARY : Secondary Allocation Quantity
DIRECTORY  : Number of Directory Blocks in PDS
EXPTDT     : Dataset Expiration Date (YYYYMMDD)
RETPD      : Dataset Retention Period (From creation date)
VOLCNT     : Volume Count
DSNTYPE    : Dataset Name Type (EXT/HFS/LIB/PDS)
COMPACT    : Option to compress data (Y/N/T/G)
SPANNED    : Option to allow Data to span accross control intervals (S/N)
RECORG     : VSAM Dataset Type (KS/ES/RR/LS)
KEYLEN     : Key Length (in Bytes)
KEYOFF     : Key Offset (for KSDS)
CISIZE     : CISIZE of data component
FRSPAC[0]  : CI %Free Space for CI
FRSPAC[1]  : CA %Free Space for CA
SHOPTS[0]  : Region Share Option
SHOPTS[1]  : System Share Option
```

Example:

- DCLASS001=(RECFM=FB,LRECL=80)

*Recommendation:* Check with the customer to see if there are existing SMS configurations on the mainframe and adjust these settings accordingly.

## 2. MGMTCLAS

Management Class Definition

- {MCLASS_NAME}=({EXPDT},{REPTD})

Notice that each parameter is separated by a comma (,) and all parameters are encapsulated in parentheses ().

Available Parameters are below:

```
EXPTDT      : Dataset Expiration Date (YYYYMMDD)
RETPD       : Dataset Retention Period (from creation date)
RETPD_NOUSE : Dataset Retention Period (from last referenced date)
RETPD_LIMIT : Maximum dataset retention period
```

Example:

- MCLAS001=(EXPDT=99991231,RETPD=NOLIMIT)

*Recommendation:* Check with the customer to see if there are existing SMS configurations on the mainframe and adjust these settings accordingly.

## 3. STORCLAS

Defining a Storage Class

- {STORCLAS}={VOL_SER},{VOL_SER},{VOLSER}

For each storage class, you can define one or many different volume serials separated by comma

Example:

- SCLAS001=DEFVOL

*Recommendation:* Check with the customer to see if there are existing SMS configurations on the mainframe and adjust these settings accordingly.
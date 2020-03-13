# print.conf (Printer Configuration)

Allows you to define class, command, and driver for printers. Printers can be defined for each or multiple classes. When a JOB completes, the spool dataset is registered in the OUTPUTQ as an output unit. Then, depending on the classes you have defined in print.conf, it will be sent to that printer.

# Table of Contents

- [SSPRT](#1-ssprt "Samsung Printer Configuration")
- [PRINTERX](#2-printerx "PRINTERX Configuration")
- [INTRDR](#3-intrdr "Internal Reader Configuration")
- [PMSVR](#4-pmsvr "TP Scheduling Time Interval")
- [WRITER](#5-writer "Writer Configurations")

## 1. SSPRT

Samsung Printer Configurations

No Configuration settings for this yet

## 2. PRINTERX

In this section, we can define a printer with the following format:

```bash
[PRINTERX]
  CLASS=
  COMMAND=
  DRIVER_PATH=
```

- PRINTERX

You should rename the X in PRINTER*X* to a 1-byte character between A-Z or 0-9.

- CLASS

You can specify any class letter(s) or number(s) here:

Example: 

```bash
CLASS=AB
```

```bash
CLASS=4
```

- COMMAND

For default printer, you should use the command ```cat```

For an LRS printer, you should use the command ```LRS.sh``` which should be placed in ${OPENFRAME_HOME}/bin directory

<details>
  <summary>Source code for the LRS.sh</summary>

```bash
#!/bin/sh

_FullPath=`echo ${1}`
echo " File Name [" ${_FileName} "]"                                       ### DEBUG
#
_VPSX_SPOOL="/opt/lrs/lrsq/vpsx_spooler_linux.exe"
_VPSX_CONF="/opt/lrs/lrsq/vpsx_spooler_controlfile_linux"

#Martin wanted to have MAXLL as NULL
sed -i 's/MAXLL=.*/MAXLL=/g' ${3}

#cp ${1} ~/

#echo "${_VPSX_SPOOL} -i ${1} -ec ${2} -cc ${3} -control  ${_VPSX_CONF} -d"               ### DEBUG
${_VPSX_SPOOL} -i ${1} -ec ${2} -cc ${3} -control  ${_VPSX_CONF} -d

#${_VPSX_SPOOL} -i ${1} -ec ${2} -cc ${3} -control  ${_VPSX_CONF} -d
```
</details>

- DRIVER_PATH

For default printer, you should use the path: ${OPENFRAME_HOME}/lib/libdfltprt.so

For an LRS printer, you should use the path: ${OPENFRAME_HOME}/lib/liblrsprt.so

## 3. INTRDR

- DRIVER_PATH=${OPENFRAME_HOME}/lib/libirdrprt.so

Defines the library file path for the internal reader

*Recommendation:* Leave this as default (${OPENFRAME_HOME}/lib/libirdrprt.so)

## 4. PMSVR 

- INTERVAL = 50000

Specifies TP scheduling time interval of the ofrpmsvr server (in microseconds)

*Recommendation:* Leave it as default (50000)

***

- THRESHOLD = 100

Set the print process retry threshold value

*Recommendation:* Leave it as default (100)

## 5. WRITER

No Configurations for this section yet

  #TODO


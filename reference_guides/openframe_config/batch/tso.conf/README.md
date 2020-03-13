# tso.conf (Time Sharing Option Configuration)

Configurations for OpenFrame TSO

# Table of Contents

- [COMMON](#1-common "COMMON TSO Configurations")
- [MAP](#2-map "TSO MAP Configurations")
- [TSOMGR](#3-tsomgr "TSOMGR Configurations")
- [LOGIN_PROC](#4-login_proc "TSO Login Configurations")
- [SMTP](#5-smtp "TSO SMTP Configurations")

## 1. COMMON

- EXECLIB=SYS1.TSOLIB

Specifies search paths for clist resources, if not defined, default is SYS1.TSOLIB 

*Recommendation:* Check with the customer for which pds contains their CLIST resources and change this accordingly.

***

- COBLIB=SYS1.COBLIB

Specifies search paths for cobol programs for EXCEFW. If not defined, the default is SYS1.COBLIB

*Recommendation:* Check with the customer for which pds contains their COBOL resources and change this accordingly.

***

- PLF_DIRECTORY=${OPENFRAME_HOME}/shared/TSO

  #TODO

***

- DEFAULT_FEXPORT_PLF=DEFEXP.PRM;1

  #TODO

***

- DEFAULT_FIMPORT_PLF=DEFIMP.PRM;1

  #TODO

***

- IPF_ERRCODE=-92065,-92062,-92068,-92067

Specifies ipf error codes which cobol does not check. 

*Recommendation:* Leave it as default (-92065,-92062,-92068,-92067)

***

- ASC2EBC_CPM=ASCJEFK.cpm

Specifies the CPM map file, to confert ASCII data to EBCDIC

*Recommendation:* Check the mapping and go through it with the customer. Then assign the cpm file here.

## 2. MAP

- DEFAULT_LIB=SYS1.TSOMAP

Specifies the paths for Map resources. If not defined, the default is SYS1.TSOMAP.

*Recommendation:* Check with the customer for where their MAP resources are and change this value accordingly.

***

- DEFAULT_LOG=LOGIN

LOGIN MAP name. If not defined, the default is LOGIN

*Recommendation:* Check with the customer for what their LOGIN MAP name is and change this accordingly.

***

- DEFAULT_LOGOFF=LOGOFF

LOGOFF MAP name. If not defined, the default is LOGOFF

*Recommendation:* Check with the customer for what their LOGOFF MAP name is and change this accordingly.

***

- DEFAULT_NEWPASS=NEWPASS

When password is expired, this option allows them to create a new password. Default is NEWPASS

Other options include #TODO

*Recommendation:* Leave it as default (NEWPASS)

***

- DEFAULT_COMMAND=INIT

Specifies the start command MAP name.

*Recommendation:* Check with the customer to see what their start command is and change this accordingly.

***

- FIMPORT_MAP=FIMPMAP

MAP Name for getting PLF paramenters in fimport.

*Recommendation:* Check with the customer to see if they have a different MAP name and change this accordingly.

***

- FEXPORT_MAP=FEXPMAP

MAP name for getting PLF parameters in fexport.

*Recommendation:* Check with the customer to see if they have a different MAP name and change this accordingly.

## 3. TSOMGR

- DEFAULT_PROC=INITPROC

DEFAULT procedure name. If not defined, default is INITPROC

*Recommendation:* Check with the customer to see if they have a different PROCEDURE name and change it accordingly.

***

- USING_CLASS=X

When submitting JCL (including PROCEDURES), set CLASS in the JCL file. If not defined, the default class is A.

*Recommendation:* Check with the customer to see if they would like to set a different class and change this value accordingly.

***

- USING_OUTCLASS=A

When submitting JCL (including PROCEDURES), set OUTCLASS in the JCL file. If not defined, the default is (A).

*Recommendation:* Check with the customer to see if they would like to set a different OUTCLASS and change this value accordingly.

***

- CHECK_JOB_INTERVAL=3

TSO JOB check scheduling interval (in seconds). If not defined, the default is 10.

*Recommendation:* Change this value to (3)

***

- MAX_TSO_COUNT=30

Specifies the Maximum TSO users count.

*Recommendation:* Leave it as default (30)

***

- LOG_LEVEL=I

System module log level I for message or D for debug. If not defined, default is I

*Recommendation:* Leave it as default (I). If there are any problems, it may be beneficial to change this to D for debugging and then changing it back to I once the issue is resolved.

## 4. LOGIN_PROC

Currently, there are no configurations for this section.

## 5. SMTP

- DOMAIN_NAME=TMAXSOFT

Specifies the HOST domain name for HELLO statement. Must be defined, but it can be any unknown domain names.

*Recommendation:* Check with the customer for the SMTP domain name.

***

- SENDER_ADDRESS=${EMAIL_ADDRESS}

Specifies an email address for MAIL FROM statement. (Must be defined)

*Recommendation:* Check with the customer for the user they wish to send emails from.
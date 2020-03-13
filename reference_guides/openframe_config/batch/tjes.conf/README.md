# tjes.conf (TJES Configuration)

OpenFrame's Tmax Job Entry System (TJES) Configuration File. 

# Table of Contents

- [NODEINFO](#1-nodeinfo "TJES Node Configuration")
- [JOBDEF](#2-jobdef "TJES JOB Def Configuration")
- [JOBCLASS](#3-jobclass "TJES JOB CLASS Configuration")
- [JOBGDEF](#4-jobgdef "TJES JOB Group Configuration")
- [SCHEDULING](#5-scheduling "TJES Scheduling Configuration")
- [RESOURCE](#6-resource "TJES Resource Configuration")
- [PROCLIB](#7-proclib "TJES PROCLIB Configuration")
- [DYNAMIC_LIBRARY](#8-dynamic_library "TJES Dynamic Library Configuration")
- [LOG](#9-log "TJES Log Configuration")
- [SPOOL](#10-spool "TJES Spool Configuration")
- [INTRDR](#11-intrdr "TJES Internal Reader Configuration")
- [INITDEF](#12-initdef "TJES Initiator Definition Configuration")
- [OUTCLASS](#13-outclass "TJES OUTPUT CLASS Configuration")
- [OUTDEF](#14-outdef "TJES OUTPUT Queue Configuration")
- [TACF](#15-tacf "TJES TACF Configuration")
- [OPRMSG](#16-oprmsg "OPRMSG Configuration")

## 1. NODEINFO

Configures information on nodes

- NODENAME=NODE1

Defines the current node name.

*Recommendation:* Leave it as default (NODE1)

***

- NODELIST=NODE1

Defines all node names. Node names are separated by semicolon (;).

*Recommendation:* If you have installed any additional OpenFrame nodes, add them to this list.

## 2. JOBDEF

This section manages JOBs in TJES.

- STARTNUM=1

Specifies the starting number for a JOBID. 

*Recommendation:* Leave it as default (1)

***

- ENDNUM=99999

Specifies the ending JOBID. Therefore, the largest JOBID can be JOB99999 and it would start at JOB00001 with the above settings.

*Recommendation:* Leave it as default (99999)

***

- FULL_WARNING=80

Configures the boundary rate (in percent) of the JOBQ before displaying a warning about a full jOBQ. The boundary can be an integer between 0 and 99.

*Recommendation:* Ask the customer what percent they would like to set.

## 3. JOBCLASS

This section is for the default properties of the TJES job class.

- ${CLASS}=${STATUS}

We can specify a class here and give a status of either START or HOLD. Any class between A-Z or 0-9 can be given in the CLASS portion, where the STATUS portion can either be START or HOLD. If not specified, START is given to the class.

*Recommendation:* Check with the customer if there are any JOB classes that are put on HOLD status. They should be defined in this configuration. If the CLASS starts with START, you need not define it.

## 4. JOBGDEF

  #TODO

## 5. SCHEDULING

- DUPL_JOBNAME=NO

Decides whether to execute the job with the same JOBNAME concurrently (Default: NO)

*Recommendation:* Leave it as default (NO)

***

- PRTYJECL=YES

Defines whether to use the priority in the submitted JCL. (Default: YES)

*Recommendation:* Leave it as default (YES)

***

-PRTYJOB=YES

Defines whether to use the priorirty of the submitted JCL (Default: NO)

*Recommendation:* Change this to (YES)

***

-PRTYHIGH=10

Defines the maximum value for the priority attribute. Values higher than the maximum value will be ignored. It can be an integer from 0 to 10.

*Recommendation:* Leave it as default (10)

***

- PRTYLOW=5

Defines the minimum allowable value for the priority attribute. Values lower than the minimum will be ignored. It can be an integer from 0 to 10.

*Recommendation:* Leave it as default (5)

***

- PRTYRATE=1440

Defines a number used in calculating the aging per day rate. The job priority incremements by 1 after a certain amount of time passes. That amount of time is calculated by dividing 86400 seconds by the PRTYRATE given. If you specify 1440 seconds, the job priority will increase by 1 every 60 seconds.

You can specify any number between 0 to 86400

*Recommendation:* Leave it as default (1440)

***

- INTERVAL=1

Defines the interval to schedule the scheduler in seconds (Default: 1)

*Recommendation:* Leave it as default (1)

## 6. RESOURCE

This section describes the UNIX resources used in the TJES.

- SHMKEY=62039

Configures the shared memory key to communicate between obmjinit and tjclrun in TJES

*Recommendation:* Leave it as default (62039)

***

- DBCONN=BASE_ODBC

The ODBC connection named used to access a system database. This name must be defined in the [odbc-section-name] section of ofsys.conf. 

*Recommendation:* Check your ODBC connection settings. If everything is default, it will most likely be BASE_ODBC.

## 7. PROCLIB

This section describes the dataset required to operate a JOB.

- JCLLIB=SYS1.JCLLIB:${JCL_PATH}

If executing a JCL without the specific path, the JCL will be executed based on the priority list given above.

*Recommendation:* Change this to fit the customer's requirements. Customers will most likely have a PDS they execute JCL from by prirority.

***

- USERLIB=SYS1.USERLIB:${COB_PATH}

This list is a concatenation of the COBOL PDSs used for Batch. Similar to JCLLIB, it is priority based, and seperated by colon (:).

*Recommendation:* Change this to fit the customer's requirements. Customers will most likely have multiple COBOL PDSs and whichever is priority should come first in the list, and visa versa.

***

- PROC00=SYS1.PROCLIB:${PROC_PATH}

Similar to JCLLIB and USERLIB, this is where Procedures are called from on a priority basis separated by colon (:)

*Recommendation:* Change this to fit the customer's requirements. Customers may have multiple Procedure PDSs so they should be listed on priority basis.

## 8. DYNAMIC_LIBRARY

- TEMPLIB=SYS1.TEMPLIB

Specifies the TEMP Libraries. This is the name of the PDS dataset to be used for temporarily saving the existing library when the user library is modified.

*Recommendation:* You should be able to leave this as default, but check with the customer if they have a similar PDS name on the mainframe that they use. If so, change SYS1.TEMPLIB to that PDS name.

## 9. LOG

- JOBLOG=${OPENFRAME_HOME}/log/joblog/job.log

Assigns a file path for the JOBLOG which logs the status of the changes of the JOBs

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/log/joblog/job.log)

***

- SUBMITLOG=${OPENFRAME_HOME}/log/submitlog/submit.log

Assigns a file path of SUBMITLOG which logs the JCL submit trials and results.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/log/submitlog/submit.log)

## 10. SPOOL

- SPOOL_VOLUME_SER=VSPOOL

This defines SPOOL VOLUME SERIAL defined in the volume.conf configuration file.

*Recommendation:* Check what the customer wants to name the spool volume serial and assign this variable as well as define it in volume.conf configuration file.

***

- SPOOL_BACKUP_DIR=${OPENFRAME_HOME}/spbackup

Defines the directory for storing the spool backup data when using the BACKUP feature.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/spbackup)

***

- SPOOL_UNPACK_DIR=${OPENFRAME_HOME}/spunpack

Defines the directory used for decompressed spools from backups

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/spunpack)

***

- USE_DATABASE=NO

  #TODO

***

- SYSOUT_AS_A_FILE=NO

  #TODO

## 11. INTRDR

- HOLD=NO

Defines whether the job status should be set to HOLD when the JCL is submitted by an internal reader

*Recommendation:* Leave it as default (NO)

***

- NODENAME=NODE1

Defines which node to execute the job when the JCL is submitted by an internal reader

*Recommendation:* If you have more than one node, you should check which node will be your main node to submit JCL to if submitted by an internal reader.

***

- USERNAME=${USERNAME}

Sets which user is to receive the TACF certificate when the JCL is submitted using an internal reader

*Recommendation:* Specify a Username that the customer already uses on the mainframe.

***

- GROUPNAME=${GROUPNAME}

Defines which user group is to receive the TACF certificate when the JCL is submitted using an internal reader.

*Recommendation:* Specify a group that the customer already uses on the mainframe

***

- PASSWORD=${PASSWORD}

Sets the password for the user to receive the TACF certification when the JCL is submitted using an internal reader

*Recommendation:* Check with the customer what the user's password will be and set it here.

***

- ENPASSWD=****

This attribute encrypts the user password to receive the TACF certificate when the JCL is submitted using an internal reader

*Either the PASSWORD or ENPASSWD field should be configured, not both. To configure only one or the other, Add a pound symbol (#) before the line to comment it.*

## 12. INITDEF

This section describes the initial configuration values of the RUNNER in TJES.

- INITNUM=${VALUE}

Defines the total slot count of the node. Usually, 11 is defined, but there is no limit for the number of slots, except for the size of the memory installed on the machine. One runner will reqire a 256 bytes of memory to be allocated by obmjinit. It's recommended to use less than 500 slots and manage it as CLASS ACTIVE, and INACTIVE.

*Recommendation:* Run the JCL described in the initiator_config section of this guide on the mainframe to determine the ACTIVE initiators and how many are required for OpenFrame.

*See guide in next section*

***

- INITxxxx = ${name},${classes},${ACTIVE|INACTIVE}

Specifies each Runner slot. Each "xxxx" represents the number of the runner slot. It should start at 0000 and go up to 9999. The ${name} can be anything, it has no special meaning. It's recommended to keep the name sort and sweet. If your INIT is 0000, you can use 0 as the name. The classes you can assign should be the same as the classes on the mainframe. If they have initiators running on the classes ABC, it should match in the classes section. Lastly, the ACTIVE|INACTIVE specifies if that runner is active or not.

*Recommendation:* Run the JCL described in the initiator_config section of this guide on the mainframe to determine the ACTIVE initiators and how many are required for OpenFrame.

[Link to Initiator Configuration JCL](./initiator_config/README.md)

## 13. OUTCLASS

Depending on the output class of the SYSOUT, default output disposition and default lrecl are configured.

- ${class}=${normal_disp}${,abnormal_disp}:${default_lrecl}

If OUTCLASS specified in JCL is not specified in OTUCLASS of tjes.conf, (PURGE,PURGE) is used as a default output disposition. The default lrecl can only be used when RECFM has a fixed format. If RECFM has a fixed format and the default lrecl is not specified, 80 is used.

*Recommendation:* Check with the customer on what each OUTCLASS class should be set to.

## 14. OUTDEF

- OUTNUM=8000

Defines the size of the OUTPUTQ. Can be an integer between 1 and 99999. The larger the OUTPUTQ, the more information can be stored, however, it is recommended that the size is adjusted properly because a large amount of information may hinder performance for changing and checking each output status. 

*Recommendation:* Leave it as default, increase if necessary.

***

- USE_OUTPUTQ=YES

Defines whether to execute OUTPUT processing.

*Recommendation:* Leave it as default (YES)

***

- DATA_DIR=${OPENFRAME_HOME}/shared

Defines a directory into which to copy the OUTPUT from spool.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/shared)

***

- REMOVE_SPOOL=NO

Option to execute post-processing after OUTPUT processing completes. If this element is set to YES, the SPOOL will be deleted when removing OUTPUT from OUTPUTQ. If set to NO, the SPOOL will not be deleted (Default is (NO))

*Recommendation:* Leave it as default (NO)

## 15. TACF

- CHECK_JOBNAMEAUTH=NO

This element decies whether to check authority over JOBNAME when controlling jobs for SUBMIT, REMOVE, START and HOLD.

*Recommendation:* Change this value to (YES)

***

- CHECK_SPOOLAUTH=NO

This element decides whether to check authority to open SPOOL through PODD command in tjesmgr 

*Recommendation:* Change this value to (YES)

## 16. OPRMSG

- USE_CONSOLE=YES

  #TODO
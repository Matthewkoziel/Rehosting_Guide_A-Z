# smf.conf (System Management Facilities Configuration)

The SMF log in OpenFrame is limited support at it's current stage.

In order to use smfmgr, the System Management Facilities (SMF) properties must be configured in smf.conf and SMF must be initialized. Set the smf.conf configuration file as shown below. This configuration can be used to store related information about CICS transactions:

```
Transaction Name
Task ID
Term ID
Storage Used
Base Program
CICS SYSID
CPU Time
Response Time
Node Name
MRO Information
Resource Usage
Filename
File I/O
Read
Update
Delete
Browse
TDQ Names and Counts
Task Wait Time (amount of time waiting to run on the CPU)
Task Dispatch Time (amount of time spent running on the CPU)
Breakdown of Time for each CICS command
```

  #TODO - MUST BE VALIDATED

# Table of Contents

-[DATASET](#341-dataset "Dataset Information for SMF Logs")

## 1. DATASET

Specifies the name of an SMF Dataset. Only ALL is supported, meaning, the dataset can be used in all nodes.

```
SMLOG1.NODE1=ALL
SMLOG2.NODE1=ALL
SMLOG3.NODE1=ALL
SMLOG4.NODE1=ALL
```

*Recommendation:* Leave it as default (shown above)
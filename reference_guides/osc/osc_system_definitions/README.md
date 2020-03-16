# OSC System Definition Setup and Configuration 

**Description:** Online Resources on the mainframe are defined in System Definitions Macro Files. For OpenFrame to access the resources, they must be defined in OpenFrame's System Definitions (OSD). Before loading the System Definitions, we need a VSAM dataset to load them into. However, loading all of System Definitions into the run time memory would be unnecessary, so only the System Definitions in the GRPLIST are added. 

Step 1.) Create the VSAM Dataset

```
idcams define -t CL -n OSC.SDMAKE.TEST -o KS -k 18,0 -b 32768 -l 128,32760 -s 1024,128,128 -v DEFVOL
```

Step 2.) Load the VSAM Dataset with the System Definitions File from the Mainframe

```
oscsdgen -c -d OSC.SDMAKE.TEST [MACRO_FILE]
```

# Table of Contents

- [oscsddump](#1-oscsddump "OSC System Definition Dump")
- [oscrtsddump](#2-oscrtsddump "OSC Run Time System Definition Dump")
- [osctdlupdate](#3-osctdlupdate "OSC TDL Update")

## 1. oscsddump

It should be noted that OpenFrame comes with a utility ```oscsddump``` which can be used to dump the OpenFrame System Definitions (OSD) to a regular file. This regular file can then be used to add or modify the existing OSD's. Each region has it's own dataset, and you can dump the OSD by specifying the region name or the vsam dataset.

```
oscsddump -d <dataset> <output_file_name>
oscsddump -r <region> <output_file_name>
  -d <dataset> : The name of the OSC SD dataset to be exported

  -r <region>  : OSC region name from where datasets will be exported.

  -  <file>    : Specifies the name of the macro file to be created. 
                 If a file with this name already exists, it 
                 will be overwritten.
```
## 2. oscrtsddump

Similar to oscsddump, OpenFrame has an oscrtsddump utility which can dump the System Definitions from the GRPLIST stored in the runtime. 

```
oscrtsddump -r <region> <file>
  -r <region>  : Specifies an OSC region name

  - <file>     : Specifies the name of the macro file to be created.
                 If a file with this name already exists, it 
                 will be overwritten.
```

## 3. osctdlupdate

Dynamic Modules, such as Cobol programs can modified during OSC uptime, but the integrity of a transaction in progress must be preserved. Therefore, when an online COBOL program is modified and recompiled, it is not updated in OSC until the osctdlupdate command is run. This tool registers and updates dynamic modules within OSC regions.

Dynamic Modules include:

* BMS (Basic Map Support)

* COBOL 

```
osctdlupdate <region> <module>
  - <region>   : Specifies an OSC region name

  - <module>   : Specifies an application module name
``` 
# OpenFrame Configuration Files

Below are the configuration files which OpenFrame uses to operate and match the configuration of the customer's mainframe. All of the configuration files will end in _.conf_ or _.seq_ and can be found in $OPENFRAME_HOME/config folder. This may be the most challenging part of a rehosting project, as getting all of the configurations correct on the first attempt may prove to be difficult. Each of the below items are items that are found in the default configuration files and should be brought to light with the customer. Each and every configuration below must be set as it is on the mainframe, or OpenFrame will not operate as expected. By completing the below section diligently, you can reduce the amount of time it takes to rehost a mainframe dramatically.

**Note: Many of the below configurations may remain as default, but as OpenFrame expands and adapts, these default values may change in the given configuration files. It is recommended that each and every configuration file is set to Mainframe standards**

# Table of Contents 

- [Batch Related](./batch "Configuration Files related to BATCH")
  - [cpm.conf](./batch/cpm.conf/README.md "CPM Configuration")
  - [ds.conf](./batch/ds.conf/README.md "Dataset Configuration")
  - [dstool.conf](./batch/dstool.conf/README.md "DSTOOL Configuration")
  - [ezaci.conf](./batch/ezaci.conf/README.md "EBCDIC to ASCII in COBOL configuration")
  - [ezplus.conf](./batch/ezplus.conf/README.md "EZPLUS Configuration for EZTPA00 Utility")
  - [ftp.conf](./batch/ftp.conf/README.md "FTP Configuration")
  - [idcams.conf](./batch/idcams.conf/README.md "IDCAMS Configuration")
  - [ikjeft01.conf](./batch/ikjeft01.conf/README.md "IKJEFT01 Utility Configuration")
  - [isrsupc.conf](./batch/isrsupc.conf/README.md "Configuration for ISRSUPC Utility")
  - [keyseq.conf](./batch/keyseq.conf/README.md "Key Sequence Configuration")
  - [print.conf](./batch/print.conf/README.md "Printer Configuration")
  - [sort.conf](./batch/sort.conf/README.md "Sort Configuration")
  - [textrun.conf](./batch/textrun.conf/README.md "Textrun Configuration")
  - [tjclrun.conf](./batch/tjclrun.conf/README.md "Tjclrun Configuration")
  - [tjes.conf](./batch/tjes.conf/README.md "TJES Configuration")
  - [tjesmgr.conf](./batch/tjesmgr/README.md "TJESMGR Configuration")
  - [tso.conf](./batch/tso.conf/README.md "TSO Configuration")
  - [unit.conf](./batch/unit.conf/README.md "Unit Configurations for OpenFrame")
  - [volume.conf](./batch/volume.conf/README.md "OpenFrame Volume Configuration")
- [Online Related](./online "Configuration Files related to ONLINE Systems")
  - [OpenFrame Subsystem for CICS](./online/osc "OSC Configurations")
    - [osc.conf](./online/osc/osc.conf/README.md "OSC Configuration")
    - [osc.lu.conf](./online/osc/osc.lu.conf/README.md "OSC LU Configuration")
    - [osc.ofsys.seq](./online/osc/osc.ofsys.seq/README.md "OSC Sequence Configuration")
    - [osc.regionname.conf](./online/osc/osc.regionname.conf/README.md "OSC Region Configuration")
  -[OpenFrame Subsystem for IMS DB/DC](./online/osi "OSI Configurations")
    - [hidb.conf](./online/osi/hidb.conf/README.md "HiDB Configuration")
    - [ims.conf](./online/osi/ims.conf/README.md "IMS Configuration")
    - [osi.conf](./online/osi/osi.conf/README.md "OSI General Configuration")
    - [osi.ofsys.seq](./online/osi/osi.ofsys.seq/README.md "OSI OFSYS Sequence File")
    - [osi.regionname.conf](./online/osi/osi.regionname.conf/README.md "OSI Region Configuration")
    - [ssm.region.conf](./online/osi/ssm.regionname.conf "SSM Region Configuration")
- [Other Configurations](./other "Other Configurations")
  - [ofstudio.conf](./other/ofstudio.conf/README.md "OFStudio Configuraiton")
  - [ofsys.seq](./other/ofsys.seq/README.md "OFSYS Sequence Configuration")
  - [saf.conf](./other/saf.conf/README.md "SAF Configuration")
  - [smf.conf](./other/smf.conf/README.md "SMF Configuration")
  - [sms.conf](./other/sms.conf/README.md "SMS Configuration")
  - [tacf.conf](./other/tacf.conf/README.md "TACF Configuration")
  - [vtam.conf](./other/vtam.conf/README.md "VTAM Configuration")

# 1. Batch Related

**General Information:** For anything commented out, the default values shown will be used. For the majority of the commented out settings, the default values will be sufficient. If you must investigate the options in more detail, please consult the manuals.

# 2. Online Related

**General Information:** These configurations have to do with OSC and OSI. OSC and OSI stand for Openframe Subsystems for CICS and IMS respectively. Here, you will find configurations which will have to be highly customized to match the mainframe components. Some assembly is required, as creating the regions are first needed to configure the config files for them.

*If your environment does not consist of CICS regions, you may skip the OSC section.*

*If your environment does not consist of IMS regions, you may skip the OSC section.*

***

Reference Documents:

  * **Base:** OpenFrame_Base_7_Fix#3_Base_Guide_v2.14_en.pdf
  * **OSI:** OpenFrame_OSI_7.1_Administrator's_Guide_V2.1.1_en.pdf
  * **OSC:** OpenFrame_OSC_7_Fix#3_Administrator's_Guide_v2.1.5_en.pdf
  * **TACF:** OpenFrame_TACF_7_Fix#3_Administrator's_Guide_v2.1.4_en.pdf
  * **HiDB:** OpenFrame_HiDB_7.1_HiDB_Guide_v2.1.4_en.pdf


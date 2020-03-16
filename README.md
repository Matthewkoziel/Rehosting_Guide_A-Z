# Mainframe Rehosting Guide A-Z

*The purpose of this document is to create a detailed step-by-step plan for rehosting a mainframe to OpenFrame. This document will describe in detail the processes needed and complementary scripts and manuals to quickly, accurately, and successfully migrate a mainframe system to OpenFrame. Most importantly, this document aims to be understandable at any level of Mainframe/OpenFrame experience. Hopefully, this document becomes something any engineer or rehosting technical team member can use and find helpful. Obviously, we cannot describe how to migrate an entire mainframe in just 10 steps, otherwise everyone would do it, but hopefully we can utilize this document and continuously modify it to suit our needs and satisfy our hunger to know more and be better at what we do.*

# Table of Contents 

- [1. Pre-Migration](#1.-pre-migration)
  * [1.1 Mainframe Environment](#11-mainframe-environment)
  * [1.2 OpenFrame Environment](#1.2-openframe-environment)
    - [1.2.1 Accessing the Linux Server](#121-accessing-the-linux-server)
      - [1.2.1.1 Accessing a Linux Server built by Rehosting Team](#1211-accessing-a-linux-server-built-by-rehosting-team)
      - [1.2.1.2 Accessing a Linux Server on the Customer's Private Network](#1212-accessing-a-linux-server-on-the-customers-private-network)
      - [1.2.1.3 Binary Request](#1213-binary-request)
      - [1.2.1.4 Licensing](#1214-licensing)
      - [1.2.1.5 Getting Familiar with Linux](#1215-getting-familiar-with-linux)
- [2. Installation](#2-installation)
  - [2.1 Verifying Successful Installation](#21-verifying-successful-installation)
- [3. OpenFrame Configuration](#3-openframe-configuration)
- [4. Discovery](#4-discovery)
  - [4.1 OFMiner](#41-ofminer)
- [5. Migration](#5-migration)
  - [5.1 Source Code (JCL, Procedures, COBOLs, COPYBOOKs)](#51-source-code-jcl-procedures-cobols-copybooks)
  - [5.2 Datasets](#52-datasets)
    - [5.2.1 NVSM (NON VSAM) Datasets](#521-nvsm-non-vsam-datasets)
    - [5.2.2 VSAM Datasets](#522-vsam-datasets)
- [6. Source Compilation](#6-source-compilation)
- [7. Operations and Maintenence](#7-operations-and-maintenence)
  - [7.1 Running Batch JOBs](#71-running-batch-jobs)
  - [7.2 Running Online Transactions](#72-running-online-transactions)
  - [7.3 JOB Stream and Scheduler](#73-job-stream-and-scheduler)
  - [7.4 TACF](#74-tacf)
  - [7.5 Useful Scripts and Tools](#75-useful-scripts-and-tools)
  - [7.6 Applying Patches](#76-applying-patches)

# 1. Pre-Migration

## 1.1 Mainframe Environment

**Description**: Understanding the mainframe environment is crucial to rehosting it to OpenFrame. Once a customer is interested in rehosting, the technical details are discussed between TmaxSoft and the Customer. TmaxSoft can gather most of the critical information through a questionnaire. This initial questionnaire is vital to determining the feasability of rehosting the mainframe to OpenFrame. Every customer has changed some configurations to suit their needs - There is no mainframe that is exactly like another. One of the most important tasks to rehosting a mainframe is configuring OpenFrame the same way the mainframe was configured. To accomplish this, we need to have the customer run some commands on the mainframe so we can see the results and adjust OpenFrame accordingly. Below you will find the guide for configuring OpenFrame to Mainframe specifications (in the OpenFrame Environment section) as well as the questionnaire if you are interested in rehosting your mainframe with TmaxSoft.

[**Reference Documents: Post Introduction Questionnaire**](https://forms.tmaxsoft.com/tmaxsoftglobal/form/OpenFrame/formperma/dcfCXyB1IY7ohnkCgnTe7-oGBi6i7rLDSXecQr7_QG8)

## 1.2 OpenFrame Environment

Here is the guide to configuring OpenFrame to Mainframe specifications:

[Configuration Guides](./reference_guides/openframe_config/README.md "OpenFrame Configurations")

### 1.2.1 Accessing the Linux Server

**Description:** This step includes how to access the Linux server. Depending on who built the Linux Server, the steps for completing this will vary.

#### 1.2.1.1 Accessing a Linux Server built by Rehosting Team

**Description:** If the server is built by the rehosting team, **most likely**, there is no VDI (Virtual Desktop Infrastructure) required. The server can be accessed via PuTTY. Please refer to the Reference Documents. However, if access to a VDI is required first, please refer to the "Accessing a Linux Server on the Customer's Private Network" section. 

#### 1.2.1.2 Accessing a Linux Server on the Customer's Private Network

**Description:** If the server is built on-site by the customer, they are **most likely** using a private network which must first be accessed via VPN (Virtual Private Network) software such as CISCO Any Connect. Instructions on accessing the server must be provided by the customer. 

#### 1.2.1.3 Binary Request

**Description:** Customer binaries must be requested through IMS. In order to request the binaries, you will need to know some information about the operating system (OS) being used on the linux server. For example, we need to know if we should provide 32 bit or 64 bit binaries.

[**Reference Documents: How to Request Binaries**](./reference_guides/binary_request/README.md "Binary Request")

#### 1.2.1.4 Licensing

**Description:** Licenses will have to be issued for the products to fully operate. Production licenses must be requested through the Global Planning Team. For the licenses, we will need to know the hostname of the server, and in some cases we will also need to know how many cpu's are being used on the server. If you want to know what information you will need for each license, you can go to www.technet.tmaxsoft.com, then click on Demo License Request. This will ask you to fill out a form for each license. The required fields will describe what information you need to know to request the binary.

#### 1.2.1.5 Getting Familiar with Linux

**Description:** As most of the mainframe engineers may not be fully comfortable with Linux already, it is *_HIGHLY_* recommended that you use the below guides to start getting familiar with how to be proficient in Linux. It's also suggested that the mainframe team begin to complete 

**Reference Documents:**

- [Connect to a Server with Putty](./reference_guides/general_linux_knowledge/Connect_To_A_Server_With_PuTTY/README.md)
- [Core Files](./reference_guides/general_linux_knowledge/Core_Files/README.md)
- [FTP on OpenFrame](./reference_guides/general_linux_knowledge/FTP_on_OpenFrame/README.md)
- [Grep Cheat Sheet](./reference_guides/general_linux_knowledge/Grep_Cheat_Sheet/README.md)
- [How to use rsync](./reference_guides/general_linux_knowledge/How_To_Use_Rsync/README.md)
- [How to use Screen](./reference_guides/general_linux_knowledge/How_To_Use_Screen/README.md)
- [Linux Commands Cheat Sheet](./reference_guides/general_linux_knowledge/Linux_Commands_Cheat_Sheet/README.md)
- [SED and REGEX](./refernce_guides/general_linux_knowledge/SED_and_REGEX/README.md)
- [Using VIM Editor](./reference_guides/general_linux_knowledge/Using_VIM_Editor/README.md)
- [Yum Cheat Sheet](./reference_guides/Yum_Cheat_Sheet/README.md)

***

# 2. Installation

**Description:** To install OpenFrame, TmaxSoft has created a guide describing the steps required to install OpenFrame. In some cases, you may need to run different commands based on OS or versions of the software which are all described in the Installation Guide (see Reference Document TmaxSoft\_OpenFrame7\_fix2\_Installation\_V6.22)

[**Reference Documents: OpenFrame Installation Documentation**](./reference_guides/installation/README.md "Installation Guide")

## 2.1 Verifying Successful Installation

**Description:** OpenFrame comes equipped with some very basic sample JOBs and transactions that can be run and to test the most basic functionality of OpenFrame. After you install OpenFrame, these tests should be run and marked as completed before going any further to ensure the installation was successful.

  - Boot Tibero
  - Boot OpenFrame
  - Bring up Online System (when applicable)
  - Boot Jeus
    - Boot Managed Servers (Web Administrator, OFGW, OFManager, OFMiner) 
  - Submit Sample JCL
  - Connect to Online Test Region
  - Shutdown OpenFrame
  - Shutdown Tibero

**Reference Documents:** 

  - [How to use tmadmin](./reference_guides/tmadmin/README.md)
  - [How to boot OpenFrame](./reference_guides/openframe_boot/README.md)
  - [How to shutdown OpenFrame](./reference_guides/openframe_shutdown/README.md)
  - [How to boot and shutdown Jeus](./reference_guides/jeus_scripts/jeus7/jboot_jdown/documentation/README.md)
  - [How to submit JCL and use TJESMGR](./reference_guides/batch/How_to_use_tjesmgr/README.md)
  - #TODO: How to connect to Online Test Region

***

# 3. OpenFrame Configuration

**Description:** In order for batch JOBs and Online Transactions to run correctly, configuration changes must be made to the environment to match the Mainframe specifications. Below is a link to the configuration guides. Each configuration file should be inspected and modified to match the customer's environment. If you are unsure about a configuration, ask the customer to pull data from the mainframe and be sure to document how the information was gathered for future projects.

**Note:** You can read more about each of these configuration files based on the reference documents and manuals.

[OpenFrame Configuration](./reference_guides/openframe_config "OpenFrame Configuration")

# 4. Discovery

**Description:** To avoid risk, we need to make sure there are no third party applications that we cannot support in OpenFrame. The majority of the Discovery should happen before the project even begins. OFMiner is a tool that can be utilized during a PoC stage to help identify some of these potential risks. In order to analyze using OFMiner, you will have to complete installation as well as Migrate the source code. The customer may not always give you full access to the source code at this stage, so it's important to understand the rules before copying anything off the mainframe. 

***

## 4.1 OFMiner

**Prerequisites:**

-   Migration (Source Code) -- In Progress or Complete
-   Installation -- Complete

**Description**: OFMiner is a tool used for analyzing elements in scope
starting from the JCL. It utilizes the Tmax Base, Batch, TACF, and
Tibero elements to create a detailed document describing what JOBs,
PROCs, Programs (COBOL, Assembler), Datasets and Copybooks are in scope for
rehosting. Utilizing TBAdmin is a great supplementary tool to help create this
analysis document.

[**Reference Documents: How to Create an OFMiner Report**](./reference_guides/ofminer/How_to_Create_an_OFMiner_Report.md)

***

# 5. Migration

**Description**: This step includes migrating source code and datasets.
There are multiple options for downloading the data from the mainframe.

Below is the ordered list of the assets you will need to migrate from the mainframe to OpenFrame:

1. JCL
2. Procedure (PROC)
3. COBOL
4. COPYBOOK
5. CSD
6. Datasets
   - NON-VSAM
   - VSAM
7. Security

[**Reference Documents: How to Source Transfer Process**](./reference_guides/source_transfer/README.md)

***

## 5.1 Source Code (JCL, Procedures, COBOLs, COPYBOOKs)

**Description:** Source Code Transfer should begin with JCL as it is the starting point for the JOBs. In many cases, a JCL will EXEC a PROC so the PROCs should also be prioritized. The second priority should be the COBOL programs that are EXEC'd in the JCL and the PROCs. Identifying and transferring COBOL programs may be a recursive task because a COBOL program can call another COBOL program referred to as a submodule. These submodules can also call other submodules, hence the recursiveness of this task. Additionally, COBOL programs can call COPYBOOKS to define the datasets, and these COPYBOOKS can reference other COPYBOOKS. Transferring these, are tertiary priority. You will need all of these elements to complete the Analysis step using OFMiner. Once the Source Code is migrated to OpenFrame, JOBs and Online Transactions can be submitted just as they were on the mainframe. In the mainframe, an edittor is used to modify the source code. In OpenFrame, we have many options. One option is through OFStudio which is TmaxSoft's version of eclipse. This allows you to modify source code and push to a git repository to maintain your source code. Another option would be to use the command line directly and modify the source code through an edittor such as Vi, Vim, or Nano. When migrating Source code, it's important to use the -L option to create the linux new line delimiter. The third option would be to use the spfedit tool which allows you to use mainframe commands to be able to edit a dataset or member of a pds. 

__Note: For US based languages, most can be dsmigin'd with -sosi 6
option. However, if you are working for a Japanese, Korean, Brazilian --
Or any other language that may use sosi characters, Please refer to the
sosi options in the dsmigin command.__

The below information can be found by running the ```dsmigin``` command with no arguments:
```
6. SOSI type
   1 = so[EBC]si -> so[ASC]si : Keep SOSI (default)
   2 = so[EBC]si ->  _[ASC]_  : Convert SOSI to space
   3 = so[EBC]si -> [ASC]     : Remove SOSI & space padding on the right
   4 = so[JEF]si -> so[ASC]si : Replace JEF or KEIS SOSI to ASCII SOSI
   5 = BMS map conversion     : Convert double byte chracters to 0x2E
   6 = No SOSI conversion     : Perform single byte conversion only
   7 = so[EBC]si -> [ASC]  __ : Remove SOSI & space padding before 73 column
   8 = so[EBC]si -> __  [ASC] : Remove SOSI & space padding after 7 column
   9 = so[EBC]si -> ?[ASC]? : Replace SOSI by cpm map
``` 

**Reference Documents:** [dataset migration](./reference_guides/dataset_migration/README.md)

***

## 5.2 Datasets

**Description:** This task can be completed in parallel to the Installation and Discovery stages. This task requires a lot of effort and should be handled by no less than two engineers. We are currently in the process for standardizing how we are downloading datasets from the Mainframe to OpenFrame. Every mainframe is different, but a process should be created to standardize the process for each environment.

### 5.2.1 NVSM (NON VSAM) Datasets

  1. Customer needs to provide the copybooks. Each dataset has a corresponding copybook. There is no way for OpenFrame engineers to know which copybooks map to which datasets. The customer should provide a spreadsheet with the mapping. If the customer does not provide the copybooks, we can use OFMiner to generate the copybooks, but we cannot guarantee the integrity of the data using this method. 

  2. An excel spreadsheet should be maintained with the names of the datasets, corresponding copybooks, RECFM, LRECL, BLKSIZE, DSORG, VOLSER, VSAM (KSDS/ESDS/RRDS), KEYOFF, KEYLEN, MAXLRECL, AVGLRECL, CISIZE, IGNORE (Should this dataset be ignored when trying to retrieve from the mainframe), FTP (Yes or No - Should this dataset be FTP'd), FTPDATE, FTPTIME, DSMIGIN, DSMIGINDATE, DSMIGINTIME

  3. Once the excel spreadsheet is created a script should be used to parse the spreadsheet and the dsmigin commands are created.

  With one customer, we are accomplishing this using 1 script called dsmigin.py. This python program queries the mainframe by connecting through linux ftp. After ensuring that the dataset is not migrated (archived), it will retrieve the dataset using the FTP command. The user can also pass options to execute the dsmigin command after retrieving the datasets.

  Again, see the dataset migration guide noted in section 4.1 [dataset migration](./reference_guides/dataset_migration/README.md)

### 5.2.2 VSAM Datasets

  1. Unload VSAM files on Mainframe to Flat (PS) files.

  2. FTP the unloaded Flat datasets from Mainframe to OpenFrame server

  3. Listcat the VSAM file on the Mainframe to obtain the attributes of the VSAM and store this information in another dataset

  4. FTP the listcat information from the Mainframe to OpenFrame

  5. Use the attributes from Listcat to Create the empty VSAM file on OpenFrame (idcams define cluster)

  6. Migrate the flat file into OpenFrame

  7. Use idcams repro. As input, use the unloaded, then migrated flat file, and as output, use the empty VSAM on OpenFrame

  <pre>
    idcams repro -i ${INPUT_FILE} -o ${OUTPUT_FILE} -r ${TYPE_OF_VSAM}
  </pre>

**Reference Documents:** #TODO: attach dsmigin.py after removing customer references

***

# 6. Source Compilation

**Description:** In order to compile source code such as COBOL, Assembler (ASM), PL/I, BMS, MFS, DBDs, PSBs, you will need to first complete some configuration. There are many compiler options available to mainframe, and we need to configure OpenFrame to compile source code the same way it is done on the mainframe. 

<h3>COBOL</h3>

  #TODO

<h3>Assembler</h3>

  #TODO

<h3>PL/I</h3>

  #TODO

<h3>BMS</h3>

  #TODO

<h3>MFS</h3>

  #TODO

<h3>DBD</h3>

[DBDGEN](./reference_guides/hidb/How_to_migrate_IMSDB_to_HiDB/README.md)

<h3>PSB</h3>

  #TODO

# 7. Operations & Maintenance

**Description:** Now that your configuration is completed, it's time to start running Batch JOBs and Online Transactions and comparing results. There are many different ways a BATCH JOB can be submitted, please see the sections below for whichever method suits you best. In most cases, the customer will prefer to use OFManager, so getting familiar with submitting JOBs through OFManager is recommended.

## 7.1 Running Batch JOBs

Batch JOBs can be submitted on OpenFrame through many different mediums. Below are the options:

- [How to Use Tjesmgr](./reference_guides/batch/How_to_use_tjesmgr/README.md "How to use Tjesmgr")
- [How to submit JCL through OFManager](#TODO)
- [How to submit JCL through Textrun](#TODO)
- [How to submit JCL through OFStudio](#TODO)
- [Schedule JCL through Scheduler](#73-job-stream-and-scheduler)

## 7.2 Running Online Transactions

**Description:** Online Transactions can be run through a series of interconnected components: WebTerminal and 3270 Gateway (OFGW). In general, a transaction will be running in an online region in OpenFrame. OFGW will interact and translate the messages flowing through from the webtermanal to the region and visa-versa. The end result is an online screen where users can interact and view, modify, or delete information on the underlying database. 

<h3>OSC</h3>

  #TODO

<h3>OSI</h3>

  #TODO

## 7.3 JOB Stream and Scheduler

**Description:** A mainframe scheduler's purpose is to define when and which JOBs will run. Additionally, logic can be added to the scheduler to determine what subsequent JOBs are to be run based on return codes from previous JOBs. Similar to the mainframe, OpenFrame can also work with most schedulers, so JOBs can be run the same way they run on the mainframe.

<h3>Control-M</h3>

  #TODO

<h3>Autosys</h3>

  #TODO

## 7.4 TACF

**Description:** Below are the most commonly used TACF commands. All of the commands can be run from the command line or through OFManager.

[TACF Commands](./reference_guides/tacf/TACF_Commands.md "Most Common TACF Commands")

## 7.5 Useful Scripts and Tools

**Description:** Now that the mainframe has been rehosted to an Open System, you now have the freedom to develop and customize OpenFrame to meet your demands. OpenFrame comes well equipped with many self-managing tools to help organize your environment, while maintaining smooth and reliable operation. In this section, we will go through some useful utilities that OpenFrame comes with by default, and some useful shell scripts to increase efficiency in daily operations.

<h3>Useful Scripts</h3>

- Spools

  - Backup

    - auto\_backup\_spool.sh (TODO: Add supporting scripts and Documentation)

  - Restore

- JEUS

  - [catdomain](./reference_guides/openframe_scripts/catdomain/documentation/README.md)

- BATCH

  - scan\_fix.sh (TODO: Add supporting scripts and Documentation)

***

# 7.6 Applying Patches

[**Reference Guide: How to Apply Patches**](./reference_guides/patch/README.md "Learn how to apply patches")

# How to Create an OFMiner Report

_The purpose of this guide is to describe the steps needed to create a report that identifies the scope of the project based on the JCL. To create this guide, the customer must first identify which JCLs are currently being used in production. The list of JCLs must be sent to the rehosting team, and then the source code transfer should begin. Upon transfer of all source code, the in-scope JCLs can be added to the OFMiner repository to be analyzed_

**Prerequisites:**
	
	- Installation - Complete

**Description:** OFMiner uses a directory structure in $OFMINER_HOME to sort the in-scope elements. The analysis will start with the JCLs and work it's way all the way down to the Copybooks. The steps for completing this will be highlighted below. The directory structure looks like the following:
	
	```
	- $OFMINER_HOME/repository
		- JCL
		- PROC
		- COBOL
		- COPYBOOK
		- CSD
	```

## Steps

_Find the shortened version of the steps below in the TL;DR section_

1. **Receive a list of in-scope JCL's from the customer**

**Description:** The customer defines what is in scope and what is not. OFMiner is simply a tool to help you determine what elements need to be rehosted to satisfy the requirements of the scope. 

2. **Create a PDS (or multiple) for the in-scope JCL**

**Description:** For OFMiner analysis, you don't need to go through pdsgen or dscreate to create a PDS. Simply make a directory using Linux commands **mkdir**.  

```sh
cd $OFMINER_HOME/repository/JCL
mkdir CUSTOMER.JCLLIB
```

3. **Copy all of the in-scope JCL to the newly created JCLLIB**

**Description:** Once all of the JCL has been moved to $OFMINER_HOME/repository/JCL/CUSTOMER.JCLLIB, OFMiner can then detect the JCL and analyze it.

4. **Sync OFMiner**

**Description:** For OFMiner to be able to detect the JCLs, you have to SYNC the repository with the OFMiner application. Please refer to the image "Edit-OFMiner SYNC". In general, whenever you add new source code to the repository, you need to SYNC for it to show up in OFMiner. 

Please refer to the below picture on where you can find the SYNC button.

![alt-text](./reference_images/Edit-OFMiner%20SYNC.png "SYNC")

5. **Analyze the JCL**

**Description:** Now that the JCL is SYNC'd into OFMiner, you can analyze the JCL to parse the JCL. The parsing process includes:
	
	- Syntax Checking
	- Procedure Discovery
	- Program Discovery
	- Utility Discovery
	- Dataset Discovery

After you analyze, you can go to the missing resources section on the left hand side of the screen. Under this section, you will find missing procedures and you will use this list for step 6. 

![alt-text](./reference_images/Edit-OFMiner%20JCL%20Analyze.jpg "Analyze JCL") 

6. **Create a PDS (or multiple) for the in-scope PROCs**

**Description:** Now that you have analyzed the JCL, you're most likely missing a few Procedures (PROCs). This is how we determine what is in scope and what isn't. Similar to steps 2-5, you need to create a PDS for the in-scope PROCs and sync so OFMiner can detect them. Additionally, you are most likely noticing that all of the programs executed in the JCL and in the PROCs are noted as missing. We will address this in the following steps.

7. **Create a PDS (or multiple) for the in-scope COBOL programs**

**Description:** Again, exactly like step 6 and step 2, you need to create a PDS for the in-scope COBOL programs. Follow the steps below:

```sh
cd $OFMINER_HOME/repository/COBOL
mkdir CUSTOMER.COBLIB
```

Once you've created the CUSTOMER.COBLIB, move all the "Missing COBOL" to the COBLIB, SYNC, and analyze.

8. **Repeat steps 2-7 and add PROCs and COBOL until you no longer have any missing source.**

**Description:** In most cases, you will always have some missing source because customer's sometimes lose the source and only have the compiled load modules, but this gives us the opportunity to identify and address these. The most important step is gathering all of the in-scope JCL and adding it to the repository so you know exactly what is required from there.

9. **Generate the report using SQL**

**Description:** Now that you have all of the source code copied into OFMiner, you are ready to start generating your report. (#TODO: Optimize the SQL commands). For right now, I have some sample queries you can run to get the report generated.

- To get the JOB NAME, PROC NAME, STEP NAME, PROGRAM NAME, DATASET NAME, and DATASET DISPOSITION, run the following SQL command in TBAdmin. If you're unsure about connecting to Tibero via TBAdmin, please see the TBAdmin reference document. 

```sql
SELECT JCL.JCL_NAME, 
       JCL.PDE_NAME, 
       JOB.JOB_NAME,
       JOB.CLASS,
       JOB.MSGCLASS,
       PROC.PROC_NAME,
       PROC.PROC_TYPE,
       PROC.PDE_NAME,
       STEP.STEP_NAME,
       STEP.PROGRAM_NAME,
       STEP.PROC_TYPE,
       STEP.PARENT_PROC_ID,
       DD.DD_NAME,
       DD.DATASET_NAME,
       DD.DCB,
       DD.DISP,
       DD.SYSOUT,
       DD.UNIT,
       DD.DSORG
--SELECT COUNT(*)      
  FROM MVS_JCL JCL
   INNER JOIN MVS_JCL_JOB JOB
     ON JOB.JCL_ID = JCL.ID
   LEFT OUTER JOIN MVS_JCL_PROCEDURE PROC
     ON PROC.JOB_ID = JOB.ID
   INNER JOIN MVS_JCL_STEP STEP
     ON STEP.JOB_ID = JOB.ID
    AND STEP.JCL_ID = JCL.ID
   INNER JOIN MVS_JCL_DD DD
     ON DD.JOB_ID = JOB.ID
    AND DD.STEP_ID = STEP.ID
  WHERE DD.DATASET_NAME IS NOT NULL;
```

- To get the Call Tree, you will need to run the following SQL query:

```sql
-- First Iteration
SELECT p.PROGRAM_NAME, c.CALL_NAME
FROM PROGRAM p, CALL_STATEMENT c
WHERE p.PROGRAM_ID=c.PROGRAM_ID;
```
- Once you've run the query once, you need to continuously run it until you run out of submodules found. Your next iteration will look slightly different.

```sql
-- Second Iteration to the last iteration
SELECT p.PROGRAM_NAME, c.CALL_NAME
FROM PROGRAM p, CALL_STATEMENT c
WHERE p.PROGRAM_ID=c.PROGRAM_ID;
AND p.PROGRAM_ID in (
'test_program',     -- These "test_programs" are the output from your previous iteration
'test_program2',
'test_program3'
)
```

10. **Export to Excel**

Now that you have all the information you need, export it to excel using the small excel icon at the bottom right hand side of TBAdmin. Now you can share this spreadsheet with your rehosting team and the customer to confirm the scope of the project. From here, you now know exactly which source needs to be rehosted into OpenFrame and you can avoid migrating anything unnecessarily.

**TL;DR (TOO LONG, DIDN'T READ)**

1. Create PDS's for Source code in $OFMINER_HOME/repository
2. Copy source code to the PDS's
3. Sync OFMiner whenever adding new source
4. Analyze Source in this order:
	- JCL
	- PROC
	- COBOL
	- COPYBOOK
5. Recurse until there is no more missing
6. Query using TBAdmin
7. Format the report by exporting to Excel

**Reference Documents:** (#TODO:) TBAdmin Guide



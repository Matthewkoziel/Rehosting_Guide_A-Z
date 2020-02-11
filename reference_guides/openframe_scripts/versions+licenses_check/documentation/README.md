# How to use versions+licenses_check

## Description

__versions+licenses_check__ is a simple script which check the version and the license for all OpenFrame products. It produces two text files as output, one for versions check and another one for licenses check. It can manage versions and licenses for the following products:

Versions check:

- Tibero
- TMAX
- BASE
- BATCH
- TACF
- OSC
- HiDB
- OSI
- Prosort 
- Protrieve
- OFCOBOL
- OFPLI
- OFASM
- JEUS 7
- OF Gateway 
- OF Manager
- OF Miner
- OF Studio
- JEUS 8
- ProObject 7
- ISPF
- offile on folders 
  - *$OPENFRAME_HOME/bin*
  - *$OPENFRAME_HOME/core/appbin*
  - *$OPENFRAME_HOME/lib*
  - *$OPENFRAME_HOME/util*

Licenses check:
- Tibero
- TMAX
- BASE
- BATCH
- TACF
- OSC
- HiDB
- OSI
- Prosort
- Protrieve (NOT SUPPORTED)
- OFCOBOL
- OFPLI
- JEUS 7
- OF Gateway 
- OF Manager
- OF Miner
- OF Studio (NOT SUPPORTED)

Once you execute the script, two text files are created in the working directory. You can find an example of this output here: 

- [licenses_check](../source/licenses_check.txt)
- [versions_check](../source/versions_check.txt)

## Setup

You may check the script and specifically parts related to __Tibero__ (both version and license), __OF Manager__ (version), __Prosort__ (license) and __OF Miner__ (license) to double check if everything is working in your environment.

To make sure that the script is working in your Linux environment, you may need to run the command: `dos2unix versions+licenses_check.sh`

## Usage

```bash
sh versions+licenses_check.sh
```

## Link to Source

You can find the source code here: [source](../source/versions+licenses_check.sh)
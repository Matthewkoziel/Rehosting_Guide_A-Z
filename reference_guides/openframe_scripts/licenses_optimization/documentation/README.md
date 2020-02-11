# How to use licenses_optimization

## Description

__licenses_optimization__ is a simple script which replace all license files for OpenFrame products (unless Tibero) by symbolic links that point to the same folder. This is not mandatory but for future replacement of expired licenses, it is easier to replace only one folder than each license file one by one. It can manage licenses for the following products:

- TMAX
- BASE
- BATCH
- TACF
- OSC
- HIDB
- OSI
- Prosort 
- Protrieve
- OFCOBOL
- OFPLI
- JEUS 7
- OF Gateway 
- OF Manager
- OF Miner
- JEUS 8
- OF Studio


Once you execute the script, the shell will prompt all the license folders for you to able to check if all symbolic links have been created successfully. You can find an example of this output here: [output](../source/output.txt)

## Setup

The location of all licences is the folder: *$HOME_DIRECTORY/tmaxsw/licenses/*. You can change it at the top of the script. This folder may also respect the following structure:

- licenses/
  - openframe/
    - licbase.dat
    - lichidb.dat
    - licofpli.dat
    - licosc.dat
    - licosi.dat
    - lictacf.dat
    - lictjes.dat
  - prosort/
    - license.xml (the one for prosort)
  - tmax/
    - license.dat
  - license (for JEUS, both JEUS7 and JEUS8)
  - licofcob.dat
  - licprot.dat
  - OFGWLicense
  - OFManagerLicense
  - OFMinerLicense

To make sure that the script is working in your Linux environment, you may need to run the command: `dos2unix licenses_optimization.sh`

## Usage

```bash
sh licenses_optimization.sh
```

## Link to Source

You can find the source code here: [source](../source/licenses_optimization.sh)
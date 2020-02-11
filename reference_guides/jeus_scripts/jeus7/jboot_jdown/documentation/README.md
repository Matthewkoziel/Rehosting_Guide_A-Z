# How to use j7boot and j7down

## Description

__j7boot__ is a simple script which boot all JEUS 7 servers at the same time. Same idea for __jdown__, but shutdown all the JEUS 7 servers at the same time. All JEUS 7 servers means the __domainAdminServer__, the __NodeManager__ and the 3 managed servers __OFGateway__, __OFManager__, __OFMiner__. It implements a procedure to control if the server is running or not before booting/shutting down the server.

Once you execute the script, it starts the boot/shutdown sequence. The shell prompt a lot of information for each server. This takes a bit of time compare to other process in the OpenFrame environment, so please __do not interrupt it__. At the end there is a call to the command `jps` to check of everything boot/shutdown properly. 

You can find an example of the output here: 
- [j7boot output](../source/j7boot_output.txt)
- [j7down output](../source/j7down_output.txt)

## Setup

To set the shutdown script up properly, you may need to change some lines:
- 66-70 to match server names in jboot
- 70-75 to match server names and the port number for JEUS 7 servers in j7down
    
This has to match what you configure during the installation. You may ensure that the file __.j7_user_pass__ is in the same folder as those two scripts.

To make sure that these scripts are working in your Linux environment, you may need to run the commands: `dos2unix j7boot.sh` and `dos2unix j7down.sh`

## Usage

```bash
sh j7boot.sh
sh j7down.sh
```

## Link to Source

You can find the source code here: 
- [j7boot source](../source/j7boot.sh)
- [j7down source](../source/j7down.sh)
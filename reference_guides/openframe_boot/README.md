# OpenFrame Boot Process

Booting OpenFrame consists of executing some basic commands, with some complementary commands depending on if your environment contains online regions, and/or combinations of OSI and OSC.

**NOTE: You should have tibero booted first before executing these.**

# Table of Contents

- [Booting OpenFrame Core](#1-booting-openframe-core)
	- [tmboot Usage](#11-usage)
- [Booting OpenFrame Subsystem for CICS (OSC)](#2-booting-openframe-subsystem-for-cics-osc)
	- [oscboot Usage](#21-usage)
- [Booting OpenFrame Subsystem for IMS (OSI)](#3-booting-openframe-subsystem-for-ims-osi)
	- [osiboot Usage](31-usage)

# 1. Booting OpenFrame Core

If your environment does not consist of the OSI or OSC component, you will use the ```tmboot``` command. This command will boot all of OpenFrame's core processes. If there is a server process that does not boot correctly, you can try manually booting that specific server process.

## 1.1 Usage

```bash
tmboot
```

If you need to boot a specific server process, pass the name of the server process

```bash
tmboot -s {server_process}
```

For more information about checking server processes, please see the tmadmin command manual: [tmadmin](../tmadmin/README.md)

# 2. Booting OpenFrame Subsystem for CICS (OSC)

Before booting OSC, you should boot tjes first. To do this, execute the following:

```bash
tjesmgr boot
```

If you have multiple nodes, you should pass the NODE you wish to boot, like so:

```bash
tjesmgr boot NODE={NODE}
```

If your environment consists of CICS transactions, you will need OSC. To boot OSC, you will use the ```oscboot``` command. This will boot all of the core processes that ```tmboot``` does, but also the OSC core processes as well. 

## 2.1 Usage

```bash
oscboot
```

If you have already booted the OpenFrame core processes, you can boot only the OSC components by passing the -c option.

```bash
oscboot -c
```

By using the -c option, you are booting OSC system servers and servers in ofosc.seq file. The ofosc.seq file can be found in $OPENFRAME_HOME/config.

To boot an OSC region, you can pass the -r option with the region name

```bash
oscboot -r {region}
```

To get more information about the options you can pass in ```oscboot``` you can pass the -h option for help.

```bash
oscboot -h
```

# 3. Booting OpenFrame Subsystem for IMS (OSI)

Before booting OSI, you should boot tjes first. To do this, execute the following:

```bash
tjesmgr boot
```

If you have multiple nodes, you should pass the NODE you wish to boot, like so:

```bash
tjesmgr boot NODE={NODE}
```

If your environment consists of IMSDB/IMSDC components, you will need OSI. To boot OSI, you will use the ```osiboot``` command. This will boot all of the core processes that ```tmboot``` does, but also the OSI core processes as well.

If you have BOTH OSI and OSC, you can add the OSC components to the osi.ofsys.seq config file found in $OPENFRAME_HOME/config. This way, you do not have to use three commands, you can use only ```osiboot```

## 3.1 Usage

```bash
osiboot
```

Similar to ```oscboot```, you can pass the -h option to get more information on the available options

```bash
osiboot -h
```
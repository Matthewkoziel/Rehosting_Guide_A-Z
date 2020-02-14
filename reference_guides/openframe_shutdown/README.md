# OpenFrame Shutdown Process

Shutting down OpenFrame consists of executing some basic commands, with some complementary commands depending on if your environment contains online regions, and/or combinations of OSI and OSC. The main thing to note is that if you have any subsystems, they need to be downed first, then the core system should be downed last.

**NOTE: You should check tmadmin to make sure OpenFrame is running before running these shutdown commands**

Reference Guide: [tmadmin](../tmadmin/README.md)

# Table of Contents

- [Shutting Down OpenFrame Subsystem for IMS (OSI)](#1-shutting-down-openframe-subsystem-for-ims-osi)
- [Shutting Down OpenFrame Subsystem for CICS (OSC)](#2-shutting-down-openframe-subsystem-for-cics-osc)
- [Shutting Down OpenFrame Core](#3-shutting-down-openframe-core)

# 1. Shutting Down OpenFrame Subsystem for IMS (OSI)

To shutdown OSI, begin by shutting down any OSI online regions you may have. You can execute the following commands:

```bash
imscmd {REGION} /CHE FREEZE
```

Before shutting down OSI, you should shutdown tjes first. To do this, execute the following:

```bash
tjesmgr shutdown
```

If you have multiple nodes, you should pass the NODE you wish to shutdown, like so:

```bash
tjesmgr shutdown NODE={NODE}
```

If your environment consists of IMSDB/IMSDC components, you will need OSI. To shutdown OSI, you will use the ```osidown``` command. This will shutdown all of the core processes that ```tmdown``` does, but also the OSI core processes as well.

Lastly, you can bring down the OSI components as well as the OpenFrame core processes using ```osidown```

```bash
osidown
```

# 2. Shutting Down OpenFrame Subsystem for CICS (OSC)

If your environment consists of CICS transactions, you will need OSC. To shutdown OSC, you will use the ```oscdown``` command. This will boot all of the core processes that ```tmdown``` does, but also the OSC core processes as well. 

Online regions will automatically be brought down with OSC when executing the ```oscdown``` command. If you need to down a region only, the instructions will be noted below:

To shutdown OSC and all of it's regions:

```bash
oscdown
```

If you want to bring down a specific region,

```bash
oscdown -n {NODE} -r {REGION}
```

# 3. Shutting down OpenFrame Core

If your environment consists of neither OSC or OSI, you will use the ```tmdown``` command to bring down OpenFrame's core processes. 

```bash
tmdown
```

There are additional options that can be used with ```tmdown``` which you can see by passing:

```bash
tmdown -h
```
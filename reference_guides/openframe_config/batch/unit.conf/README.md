# unit.conf (Unit Configuration)

Stores configurations of the I/O debice info and system UNIT info for OpenFrame. The UNIT info stored in this configuration file is directly used in the JCL DD statement's UNIT parameter, or used in the volume.conf file.

# Table of Contents

- [HEADER](#1-header "Define Max Number of Devices")
- [DEVICE](#2-device "Define Devices")
- [ESOTERIC](#3-esoteric "Device Groups")

## 1. HEADER

- MAX_DEVICE_ENTRIES=1024

Maximum number of devices that can be specified in the [DEVICE] section.

*Recommendation:* Leave it as default (1024)

***

- MAX_ESOTERIC_DEVICES=1024

Maximum number of devices groups that can be specified in the ESOTERIC section.

*Recommendation:* Leave it as default (1024)

***

- MAX_DEVNUM_LIST=1024

Maximum number of device numbers that can be included in the device groups specified in the ESOTERIC section.

*Recommendation:* Leave it as default (1024)

## 2. DEVICE

- {DEVICE_NUMBER}={NUM_OF_DEVICES},{DEVICE_TYPE},{SPACE_LIMIT},{ARCHIVE_MODE(OPTIONAL)}

```
DEVICE_NUMBER  : Hexadecimal number ranging from 0000 to FFFF

NUM_OF_DEVICES : Number of devices with the same attribute. The continuous I/O device numbers are considered as devices with the same attributes.

DEVICE_TYPE    : Device Type. (Ex. 3380/3390/3390A/3480)

SPACE_LIMIT    : Primary space value for the newly created non-VSAM dataset. It is specified in unit of MB. 0 Means there is unlimited, which prevents the size of the dataset created by the corresponding device in OpenFrame from growing infintely.

ARCHIVE_MODE   : Can be either (0 or 1). Option to compress a dataset before storing it to a device which refers to a tape volume in OpenFrame.

  - 0 : Compresses before saving the dataset (DEFAULT)

  - 1 : Does not compress before saving the dataset
```

## 3. ESOTERIC

Specifies an esoteric device group information. An esoteric device group refers to the collection of an I/O devices belonging to the group defined by the administrator. The esoteric group name can be used directly for the UNIT parameter of the JCL DD statement.

- {GROUP_NAME}={DEVICE_NUM}

```
GROUP_NAME : Name of the esoteric device group to define

DEVICE_NUM : I/O Device number defined in the [DEVICE] section.

- Separate multiple device numbers with a comma.

- Specify a sequence of device numbers with a hyphen (-)
```

Example:

```
SYSDA=0001-0004,0006
```
# volume.conf (Volume Configuration)

Stores info on all volumes that are registered in OpenFrame. The device number used in this configuration file has to be pre-defined in the unit.conf file.

# Table of Contents

- [HEADER](#1-header "Define Max Volumes")
- [VOLUME](#2-volume "Define Volumes")
- [TABLESPACE](#3-tablespace "Tablespace Configuration")

## 1. HEADER

- MAX_VOLUME_ENTERIES=1024

Specifies maximum number of entries allowed in the VOLUME section.

*Recommendation:* Leave it as default (1024). If more volumes are needed, increase this value.

## 2. VOLUME

- {VOL_SERIAL}={DEVICE_NUM},{USE_ATTR},{MOUNT_ATTR},{PATH},{TAPE_SWITCH_ATTR (OPTIONAL)},{SHARED_ATTR (OPTIONAL)}

```
VOL_SERIAL       : Unique volume serial allocated to the system with alphanumeric characters ranging from 1-6 characters.

DEVICE_NUM       : Device number registered in the unit.conf file.

USE_ATTR         : User Attribute
  - PRIVATE: 
  - PUBLIC
  - STORAGE

MOUNT_ATTR       : Mount Attribute
  - PERMANENT
  - REMOVABLE

PATH             : Unix directory path on which the volume is mounted

TAPE_SWITCH_ATTR : Option to enable TAPE switch (DEFAULT: NO) 

SHARED_ATTR      : Option to enable volume sharing. (DEFAULT: NO)
- YES   : Enable Sharing
- NO    : Disable Sharing
```

## 3. TABLESPACE

Currently, there are no configurations for TABLESPACE.

  #TODO

***
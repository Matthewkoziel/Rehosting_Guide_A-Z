# vtam.conf (Virtual Telecommunications Access Method Configuration)

OpenFrame Virtual Telecommunications Access Method (VTAM) configuration file. 

# Table of Contents

- [GENERAL](#1-general "General VTAM Configurations")
- [DB](#2-db "VTAM DB Configurations")

## 1. GENERAL

- VERSION=7

  #TODO

***

- LOG_LEVEL=I

Can be one of the following levels:

```
E   : Error Mode
I   : Information Mode (Default)
D   : Debug Mode
```

*Recommendation:* Leave it as default (I)

## 2. DB

- DBCONN=VTAM_ODBC

Specifies the ODBC section name of ofsys.conf configuration file.

*Recommendation:* #TODO
# keyseq.conf (Key Sequence Configuration)

Dataset Key Sequence Configurations for indexed datasets (VSAM KSDS, or ISAM Datasets) used in OpenFrame. This configuration file specifies whether ASCII or EBCDIC order is used to arrange a datasets key order.

Key sequenced is determined by three rules

* Dataset Name
* Prefix of dataset name
* Suffix of dataset name

If it conforms to all three rules, the priority of the rules is dtermined by the order that they are listed. If a dataset conforms to multiple rules, the rule that matches the most number of characters in the name is selected.

- % : denotes exactly one alphanumeric character
- * : denotes one or more characters within a qualifier

# Table of Contents

- [DSNAME](#1-dsname "Keyseq based on dsname")
- [PREFIX](#2-prefix "Keyseq based on prefix")
- [SUFFIX](#3-suffix "Keyseq based on suffix")

## 1. DSNAME

Under DSNAME you can specify a full dataset name and set the sort order equal to EBCDIC or ASCII 

Example: 

```
PROD.BILL.%%%%.*=EBCDIC
```

*Recommendation:* Check with the customer if this is required. It's possible they will want to set up a number of rules, or none. 

## 2. PREFIX

Selects a key sequence using the prefix of the dataset name

Example:

```
PROD.BILL.=EBCDIC
SYS1.=ASCII
```

*Recommendation:* Check with the customer if this is required, and set accordingly.

## 3. SUFFIX

Selects a key sequence using the suffix of the dataset name

Example:

```
.DATA.A1=ASCII
.DATA.B1=EBCDIC
```

*Recommendation:* Check with the customer if this is required, and set accordingly.
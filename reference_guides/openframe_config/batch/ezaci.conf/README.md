# ezaci.conf (EZACI Configuration)

ezaci.conf configuration file is an API configuration file used when using ASCII and EBCDIC code in COBOL. In COBOL code, you may see the following:

```COBOL
CALL 'EZACIA2E' USING <target-data>
      <target-data-length>
      <convert-cpm-table-name>
      RETURNING <retrun-code>.
```

Check to make sure the libofezaci.so file is linked in ${OPENFRAME_HOME}/lib.

# Table of Contents

- [E2A](#1-e2a "EBCDIC to ASCII")
- [A2E](#2-a2e "ASCII to EBCDIC")

## 1. E2A

- US=EBCASCUS.cpm

*Recommendation:* Check to make sure your cpm file is linked to the EBCASCUS.cpm file. If there is a custom file used instead, you will have to change this configuration to use the same cpm file here.

## 2. A2E

- US=ASCEBCUS.cpm

*Recommendation:* Check to make sure your cpm file is linked to the ASCEBCUS.cpm file. If there is a custom file used instead, you will have to change this configuration to use the same cpm file here.
# osi.ofsys.seq (OSI Sequence File)

This sequence file dictates what server processes are started when the ```osiboot``` command is issued. The sequence file will have a list of server processes which can can be sectioned using a comment (#). This sequence file is very similar to other sequence files in OpenFrame and behaves the same way. 

Example:

```bash
#OSI
OSIGW001
```

The OSC sequences can be added from section [osc.ofsys.seq](../osc/osc.ofsys.seq/README.md) as well if your environment has both OSI and OSC.


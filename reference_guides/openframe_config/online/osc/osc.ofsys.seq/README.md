# osc.ofsys.seq (OSC Sequence File)

This sequence file dictates what server processes are started when the ```oscboot``` command is issued. The sequence file will have a list of server processes which can can be sectioned using a comment (#).

Example:

```bash
#OSC
oscmgr
oscmnsvr
osccmsvr
oscmnsvr
oscolsvr
oscscsvr
oscdfsvr
oscjcsvr
```
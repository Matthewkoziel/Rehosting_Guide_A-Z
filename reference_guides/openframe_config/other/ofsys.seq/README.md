# ofsys.seq (OpenFrame System Sequence Configuration)

This sequence file describes the OpenFrame core processes to be started when using the tmboot command. Conversely, the tmdown command will shutdown these processes.

This sequence file is ignored when OSI and/or OSC is installed and the ```osiboot``` or ```oscboot``` commands are used instead. However, in the event that the customer has no online transactions, it's more likely that this sequence file will be used. Each server process can be sectioned by different portions of OpenFrame such as Base, Batch, TACF, OFManager, and OFStudio.

For organization purposes, a comment is used with the \# symbol. 

Example: 

```
#BASE
ofrsasvr
ofrlhsvr
ofrdmsvr
ofrdsedt
ofrcmsvr
ofruisvr
ofrsmlog
vtammgr
TPFMAGENT
```

Unused server processes may also be commented out to increase boot speed.
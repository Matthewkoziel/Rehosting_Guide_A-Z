# tmadmin

```tmadmin``` is an OpenFrame tool which is used for displaying the OpenFrame server processes status'. This tool can be used after booting OpenFrame to double check that all of the server processes were successfully booted. When OpenFrame is offline, this tool will not work.

# Usage

First, execute the command tmadmin. You will see the welcome screen to Tmax Admin. Next, type ```si``` to get the OpenFrame core server instances displayed to the screen.

```bash
tmadmin
> si
```
## What to look for

Once you have the information displayed, you should check that the core instances for your server are in RDY status. If they are in NRDY status, this means the boot was either not successful, or they were never booted.

In the example below, you can see that everything related to OSC is in NRDY status, which is what we expect because there was no need for OSC in this specific installation.

# Example

[!alt-text](./reference_images/tmadmin_command.PNG)

[!alt-text](./reference_images/tmadmin_si.PNG)
# textrun.conf (TEXTRUN Configuration)

TEXTRUN Tool Configuration file.

# Table of Contents

- [DEFAULT_USER](#1-default_user "Textrun Default User Configuration")
- [EXIT_CODE](#2-exit_code "Textrun Exit Code Configuration")
- [MONITORING](#3-monitoring "Textrun Monitoring Configuration")
- [AUTOEDIT](#4-autoedit "Control-M Autoedit Configuration")
- [OPTION](#5-option "Textrun Options Configuration")

## 1. DEFAULT_USER

Specifies a default user for TEXTRUN if no user is specified.

- USERNAME=${USERNAME}

Specifies the username

*Recommendation:* Do not specify a user. This will require the user to enter their username

***

- PASSWORD=${PASSWORD}

Specifies the password

*Recommendation:* Do not specify a password. This will require the user to enter their password

***

- GROUPNAME

Specifies the groupname

*Recommendation:* Do not specify a group name. 

## 2. EXIT_CODE

- USE_RC_CODE=YES

When set to YES, return codes corresponding to the JOB termination state are enabled

Possible status's include:

```
STOP
FLUSH
```

*Recommendation:* Leave it as default (YES)

***

- STOP=253

If STOP status is equal to 253, if the JOB ends with STOP status, the return code 253 will be sent

*Recommendation:* Set STOP equal to 253

***

- FLUSH=254

If FLUSH status is equal to 254, if the JOB ends with FLUSH status, the return code 254 will be sent

*Recommendation:* Set FLUSH equal to 254

## 3. MONITORING

- RETRY_COUNT=

Specifies the number of times to retry a connection to the JOB monitoring server, in the event the connection is lost. If this option is not specified, the default retry count is set to 3.

*Recommendation:* Leave it as default (<BLANK>)

***

- RETRY_INTERVAL

Sets the time interval (in seconds) between attempts to reconnect to a monitoring service. If this option is not specified, the default time interval is 3 seconds.

*Recommendation:* Leave it as default (<BLANK>)

## 4. AUTOEDIT

- USE=NO

Specifies whether or not to use the AUTOEDIT syntax of CONTROL-M.

*Recommendation:* Leave it as default (NO)

## 5. OPTION

- RUN_NODE=*

This option sets the default node to be used with the -n option is not given during JOB submission. The default value is an asterisk(\*), meaning that a JOB can be executed on any node.

*Recommendation:* Check with the customer to see if they have a preference on which node a JOB should be run on by default. If they have no preference, then use the asterisk (\*)

***

- LOG=Y

Logs the TEXTRUN commands in ${OPENFRAME_HOME}/log/cmd

*Recommendation:* Leave it as default (Y)
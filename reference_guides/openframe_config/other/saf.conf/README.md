# saf.conf (OpenFrame Security Configuration)

Specifies the Tmax Access Control Facility (TACF) settings.

# Table of Contents

- [SAF_DEFAULT](#1-saf_default "SAF Default Configurations")
- [AUTH_METHOD](#2-auth_method "SAF Auth Configurations")
- [OFRSASVR](#3-ofrsasvr "OFRSASVR Configurations")
- [ERRCODE](#4-errcode "SAF Error Code Configurations")
- [TACF_DUMMY](#5-tacf_dummy "TACF_DUMMY Configurations")

## 1. SAF_DEFAULT

- LOG_DIRECTORY=${OPENFRAME_HOME}/log

Unix directory where SAF logs are to be written.

*Recommendation:* Leave it as default (${OPENFRAME_HOME}/log)

***

- AUDIT_ALL_ACCESS=YES

Option to leave logs on all resource accesses

*Recommendation:* Leave it as default (YES)

## 2. AUTH_METHOD

- OS_AUTH=NO

Option to check OS-level authorization. Only OS_AUTH _*OR*_ TACF_AUTH may be selected.

*Recommendation:* Leave it as default (NO)

***

- TACF_AUTH=YES

By setting this option to YES _*AND*_ having OS_AUTH to NO, TACF will control the access to the resources in OpenFrame. 

*Recommendation:* Leave it as default (YES)

***

- PAM_AUTH=NO

Pluggable Authentication Modules (PAM) provide a dynamic authentication support for applications and services in a Linux System. More information can be found here: ![alt-text](https://en.wikipedia.org/wiki/Linux_PAM).

*Recommendation:* Leave it as default (NO)

## 3. OFRSASVR

- TOKEN_INTERVAL=3

Specifies date intervals for deleting SASVR tokens that remain in memory

*Recommendation:* Leave it as default (3)

## 4. ERRCODE

There are currently no configurations in this section.

## 5. TACF_DUMMY

There are currently no configurations in t his section.
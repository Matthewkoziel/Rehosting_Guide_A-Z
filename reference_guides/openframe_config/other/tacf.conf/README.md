# tacf.conf (Tmax Access Control Facility Configuration)

This configuration file controls the Tmax Access Control Facility (TACF). In simple terms, TACF is the security module that controls the authentication to datasets, JOBs, and various resources in OpenFrame.

# Table of Contents

- [TACF_DEFAULT](#1-tacf_default "TACF Default Configurations")
- [RESOURCE](#2-resource "TACF Resource Configurations")
- [AUTH_METHOD](#3-auth_method "TACF AUTH Method Configurations")
- [AUTH_OPTION](#4-auth_option "TACF AUTH Option Configuration")
- [SETROPTS](#5-setropts "TACF SETROPTS Configuration")

## 1. TACF_DEFAULT

- HISTORY_COUNT=20

Specifies the maximum number of password changes that can be recorded in the password history. 

The password history is maintained so that users do not reuse previous passwords. If the number of passwords in the history list exceeds HISTORY_COUNT, passwords are deleted in a First-in First-out basis. The valid parameter range starts from 1. 

*Recommendation:* Check with the customer on how many passwords they store in history, and set this value equal.

***

- LOG_DIRECTORY=${OPENFRAME_HOME}/log

  #TODO

***

- PASSWORD_INTERVAL=30

Specifies the number of days to cycle the user password. The specified value is used for an account if the password change cycle is not specified when the user account was created. Can set this value starting from 0. 

*Recommendation:* Check with the customer's security team to see how often users change their passwords on the mainframe and set this value accordingly.

***

- MAX_RETRY_COUNT=10

Specifies the maximum number of login attempts that can be made. A user's account is locked for the amount of time specified in the ACCOUNT_LOCK_PERIOD if the user fails to login within the maximum number of login attempts that can be made (due to entering incorrect password information). Valid values start at 1.

*Recommendation:* Check with the customer's security team to see how many attempts a user has to enter their password correctly and set this value accordingly.

***

- ACCOUNT_LOCK_PERIOD=7

Specifies the time period a user account is locked if the user exceeds the maximum number of failed login attempts (due to entering incorrect password). The account is automatically unlocked after the time period specified in this section expires. The valid parameters range starts from 0.

*Recommendation:* Check with the customer's security team to see how long they lock accounts for incorrect passwords and set this value accordingly.

***

- RETRY_RESET_PERIOD=3

Specifies the period of time to reset the number of login retry attempts to 0.The number of login retry attempts is reset to 0 when the time exceeds the value specified in this section. The valid parameter range starts from 0.

*Recommendation:* Check with the customer to see how long users have to wait to reset their number of login attempts and change this value accordingly.

***

- AUDIT_ALL_ACCESS=YES

  #TODO

***

- EXPIRE_WARNING_DAYS=5

Specifies when users are notified about their impending password expiration (specified as the number of days prior to password expiration date).

*Recommendation:* Check with the customer to see how many days before password expiration warnings are received in their current environment then change this value accordingly.

***

- SQLCODE_DISCONNECT=

Specifies an error code generated by the database. Multiple error codes can be specified by using the delimiter ';'. When TACF receives these error codes, it immediately tries to reconnect to the database.

  #TODO

***

- EXPIRE_INIT_PASSWORD=YES

Specifies whether to remove an initial password (default value: YES)

*Recommendation:* Check with the customer to see if they want keep the initial passwords or set them expired and force the users to change them immediately.

***

- RESTRICTED_LOGIN=NO

  #TODO

## 2. RESOURCE

- DBCONN=BASE_ODBC

Specifies the ODBC section name of ofsys.conf configuration file.

*Recommendation:* #TODO

## 3. AUTH_METHOD

Either OS or TACF authentication must be set to YES. When OS authentication is chosen, TACF must be started by the root user of the OS system.

- OS_AUTH=NO

Specifies to use OS authentication instead of TACF

*Recommendation:* Leave it as default (NO)

***

- TACF_AUTH=YES

Species to use TACF authentication instead of OS authentication.

*Recommendation:* Leave it as default (YES)

## 4. AUTH_OPTION

- OPTION_LGP=YES

Specifies whether to perform access authority checks for user group lists

```
YES  : Checks group lists that a user belongs to
NO   : Does not check group lists that a user belongs to (DEFAULT)
```

In other words, this option specifies whether to perform access authority checks (for a dataset) only for a user's default group, or for all the groups that the user belongs to.

*Recommendation:* Change this value to (YES)

***

- ASKGRPNM=NO

Specifies whether to enter a group name when logging in a terminal

```
YES  : A group name is entered when logging in a terminal
NO   : A group name is not entered when logging in a terminal (DEFAULT)
```

*Recommendation:* Leave it as defult (NO)

***

- ENABLE_UNIFYDS=NO

Specifies whether to perform authority checks using the UNIFYDS class

```
YES  : Performs a check using the UNIFYDS class
NO   : Does not perform a check using the UNIFYDS class (DEFAULT)
```

*Recommendation:* Leave it as default (NO)

***

- SECURITY_MODE=NORMAL

  #TODO

***

- ADDSD_CHECK_DS_EXIST=YES

  #TODO

## 5. SETROPTS

This section specifies to control whether RACF allows general users to access datasets whose profiles are not registered in TACF. Currently, TACF supports only the PROTECTALL option.

- SETROPTS=NO

*Recommendation:* Leave it as default (NO)
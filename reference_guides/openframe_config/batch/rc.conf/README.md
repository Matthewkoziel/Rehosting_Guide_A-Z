# rc.conf (Return Code Configuration)

Specifies which programs to stop JOB execution for certain return codes by specific number or range.

# Table of Contents

- [PGM_NAME](#1-pgm_name "Program Name")
- [PGM_TYPE](#2-pgm_type "Program Type")

## 1. PGM_NAME

Allows for stopping a JOB based on a specific program name

Examples:

- IKJEFT01=8-4095

If IKJEFT01 finishes with a Return Code of anything between 8 and 4095, the JOB will stop at this step.

- IKJEFT01=4,8-4095

If IKJEFT01 finishes with a Return Code of 4, or anything between 8 and 4095, the JOB will stop at this step.

*Recommendation:* Check with the customer for which programs/utilities they wish to set up a return code configuration for.

## 2. PGM_TYPE

Allows for stopping a JOB based on a program type.

Examples:

- ALL=16-4095

*Recommendation:* Check with the customer for which program types they wish to set up a return code configuration for.
#!/bin/sh

echo 'Configuring Oracle for user myuser'

# Set archive log mode and enable GG replication
ORACLE_SID=ORCLCDB
export ORACLE_SID



sqlplus C\#\#MYUSER/mypassword@//localhost:1521/ORCLPDB1 << EOF
ALTER SESSION SET CONTAINER=ORCLPDB1;
GRANT select on CUSTOMERS TO C##MYUSER;
GRANT select on REGIONS TO C##MYUSER;
GRANT select on COUNTRIES TO C##MYUSER;
EOF
## Search groups
```
kubectl exec ldap-0 -n cfk-operator -- ldapsearch -LLL -x -H ldap://ldap.cfk-operator.svc.cluster.local:389 -b 'ou=groups,dc=confluentps,dc=io' -D "cn=mds,dc=confluentps,dc=io" -w 'mds-secret'

dn: ou=groups,dc=confluentps,dc=io
objectClass: organizationalUnit
ou: Groups

dn: cn=cp,ou=groups,dc=confluentps,dc=io
objectClass: top
objectClass: posixGroup
cn: cp
gidNumber: 5000
memberUid: cn=kafka,ou=users,dc=confluentps,dc=io
memberUid: cn=sr,ou=users,dc=confluentps,dc=io
memberUid: cn=connect,ou=users,dc=confluentps,dc=io
memberUid: cn=ksql,ou=users,dc=confluentps,dc=io
memberUid: cn=c3,ou=users,dc=confluentps,dc=io
memberUid: cn=krp,ou=users,dc=confluentps,dc=io
memberUid: cn=cl,ou=users,dc=confluentps,dc=io
memberUid: cn=se,ou=users,dc=confluentps,dc=io

dn: cn=admins,ou=groups,dc=confluentps,dc=io
objectClass: top
objectClass: posixGroup
cn: admins
gidNumber: 5000
memberUid: cn=admin1,ou=users,dc=confluentps,dc=io
memberUid: cn=admin2,ou=users,dc=confluentps,dc=io

dn: cn=c3users,ou=groups,dc=confluentps,dc=io
objectClass: top
objectClass: posixGroup
cn: c3users
gidNumber: 5000
memberUid: cn=james,ou=users,dc=confluentps,dc=io
memberUid: cn=client,ou=users,dc=confluentps,dc=io
memberUid: cn=nermin,ou=users,dc=confluentps,dc=io
memberUid: cn=niyi,ou=users,dc=confluentps,dc=io

dn: cn=developers,ou=groups,dc=confluentps,dc=io
objectClass: top
objectClass: posixGroup
cn: developers
gidNumber: 5000
memberUid: cn=dev1,ou=users,dc=confluentps,dc=io
memberUid: cn=dev2,ou=users,dc=confluentps,dc=io
memberUid: cn=dev3,ou=users,dc=confluentps,dc=io

dn: cn=readonlyusers,ou=groups,dc=confluentps,dc=io
objectClass: top
objectClass: posixGroup
cn: readonlyusers
gidNumber: 5000
memberUid: cn=alice,ou=users,dc=confluentps,dc=io
memberUid: cn=nejra,ou=users,dc=confluentps,dc=io
memberUid: cn=alex,ou=users,dc=confluentps,dc=io
```


## search users
```
k exec ldap-0 -n cfk-operator -- ldapsearch -LLL -x -H ldap://ldap.cfk-operator.svc.cluster.local:389 -b 'ou=users,dc=confluentps,dc=io' -D "cn=mds,dc=confluentps,dc=io" -w 'mds-secret'
dn: ou=users,dc=confluentps,dc=io
objectClass: organizationalUnit
ou: Users

dn: cn=c3,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: c3
sn: LookingGlass
givenName: Control Center
cn: c3
displayName: Control Center
uidNumber: 10010
gidNumber: 5000
gecos: c3
loginShell: /bin/bash
homeDirectory: /home/c3

dn: cn=cl,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: cl
sn: LookingGlass
givenName: ClusterLink
cn: cl
displayName: ClusterLink
uidNumber: 10012
gidNumber: 5000
gecos: cl
loginShell: /bin/bash
homeDirectory: /home/cl

dn: cn=se,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: se
sn: LookingGlass
givenName: SchemaExporter
cn: se
displayName: Schema Exporter
uidNumber: 10013
gidNumber: 5000
gecos: se
loginShell: /bin/bash
homeDirectory: /home/se

dn: cn=sr,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: sr
sn: LookingGlass
givenName: Schema Registry
cn: sr
displayName: Confluent Schema Registry
uidNumber: 10007
gidNumber: 5000
gecos: sr
loginShell: /bin/bash
homeDirectory: /home/sr

dn: cn=krp,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: krp
sn: LookingGlass
givenName: KRP
cn: krp
displayName: Kafka Rest Proxy
uidNumber: 10011
gidNumber: 5000
gecos: krp
loginShell: /bin/bash
homeDirectory: /home/krp

dn: cn=alex,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: alex
sn: LookingGlass
givenName: Alex
cn: alex
displayName: Alex Logan
uidNumber: 10005
gidNumber: 5000
gecos: alex
loginShell: /bin/bash
homeDirectory: /home/alex

dn: cn=dev1,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: dev1
sn: LookingGlass
givenName: Developer_1
cn: dev1
displayName: Developer number 1
uidNumber: 10014
gidNumber: 5000
gecos: dev1
loginShell: /bin/bash
homeDirectory: /home/dev1

dn: cn=dev2,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: dev2
sn: LookingGlass
givenName: Developer_2
cn: dev2
displayName: Developer number 2
uidNumber: 10015
gidNumber: 5000
gecos: dev2
loginShell: /bin/bash
homeDirectory: /home/dev2

dn: cn=dev3,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: dev3
sn: LookingGlass
givenName: Developer_3
cn: dev3
displayName: Developer number 3
uidNumber: 10016
gidNumber: 5000
gecos: dev3
loginShell: /bin/bash
homeDirectory: /home/dev3

dn: cn=ksql,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: ksql
sn: LookingGlass
givenName: KSQLDB
cn: ksql
displayName: KSQLDB
uidNumber: 10009
gidNumber: 5000
gecos: ksql
loginShell: /bin/bash
homeDirectory: /home/ksql

dn: cn=niyi,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: niyi
sn: LookingGlass
givenName: niyi
cn: niyi
displayName: Niyi
uidNumber: 11003
gidNumber: 5000
gecos: niyi
loginShell: /bin/bash
homeDirectory: /home/niyi

dn: cn=alice,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: alice
sn: LookingGlass
givenName: Alice
cn: alice
displayName: Alice LookingGlass
uidNumber: 10000
gidNumber: 5000
gecos: alice
loginShell: /bin/bash
homeDirectory: /home/alice

dn: cn=james,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: james
sn: LookingGlass
givenName: James
cn: james
displayName: James Logan
uidNumber: 10001
gidNumber: 5000
gecos: james
loginShell: /bin/bash
homeDirectory: /home/james

dn: cn=kafka,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: kafka
sn: LookingGlass
givenName: Kafka
cn: kafka
displayName: Apache Kafka
uidNumber: 10006
gidNumber: 5000
gecos: kafka
loginShell: /bin/bash
homeDirectory: /home/kafka

dn: cn=nejra,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: nejra
sn: LookingGlass
givenName: Nejra
cn: nejra
displayName: Nejra
uidNumber: 10004
gidNumber: 5000
gecos: nejra
loginShell: /bin/bash
homeDirectory: /home/nejra

dn: cn=admin1,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: admin1
sn: LookingGlass
givenName: Admin_1
cn: admin1
displayName: Admin number 1
uidNumber: 10017
gidNumber: 5000
gecos: admin1
loginShell: /bin/bash
homeDirectory: /home/admin1

dn: cn=admin2,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: admin2
sn: LookingGlass
givenName: Admin_2
cn: admin2
displayName: Admin number 2
uidNumber: 10018
gidNumber: 5000
gecos: admin2
loginShell: /bin/bash
homeDirectory: /home/admin2

dn: cn=client,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: client
sn: LookingGlass
givenName: Client
cn: client
displayName: Client
uidNumber: 10002
gidNumber: 5000
gecos: client
loginShell: /bin/bash
homeDirectory: /home/client

dn: cn=nermin,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: nermin
sn: LookingGlass
givenName: Nermin
cn: nermin
displayName: Nermin
uidNumber: 10003
gidNumber: 5000
gecos: nermin
loginShell: /bin/bash
homeDirectory: /home/nermin

dn: cn=connect,ou=users,dc=confluentps,dc=io
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: connect
sn: LookingGlass
givenName: Kafka Connect
cn: connect
displayName: Apache Kafka Connect
uidNumber: 10008
gidNumber: 5000
gecos: connect
loginShell: /bin/bash
homeDirectory: /home/connect
```
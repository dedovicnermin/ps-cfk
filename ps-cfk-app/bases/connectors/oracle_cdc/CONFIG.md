```
Name:           oracle.server
Type:           STRING
Required:       false
Default:        null
Documentation:  The host name or address for the Oracle server.

Name:           oracle.port
Type:           INT
Required:       false
Default:        1521
Documentation:  The port number used to connect to Oracle.

Name:           oracle.sid
Type:           STRING
Required:       true
Default:        null
Documentation:  The Oracle system identifier (SID).

Name:           oracle.pdb.name
Type:           STRING
Required:       false
Default:        null
Documentation:  The Oracle PDB name. Set this only if using multi-tenant CDB/PDB architecture. By default, this is not set, which indicates that the tables to capture reside in the CDB root.

Name:           oracle.service.name
Type:           STRING
Required:       false
Default:        null
Documentation:  The Oracle service name. If set, the connector always connects to the database using provided service name.

Name:           oracle.username
Type:           STRING
Required:       false
Default:
Documentation:  The name of the Oracle database user. Blank typically only when using Kerberos for authentication.

Name:           oracle.password
Type:           PASSWORD
Required:       false
Default:        [hidden]
Documentation:  The password for the Oracle database user. Blank typically only when using Kerberos for authentication.

Name:           ldap.url
Type:           STRING
Required:       false
Default:        null
Documentation:  The connection URL for LDAP server. This supports OID/OUD LDAP implementations.

Name:           ldap.security.principal
Type:           STRING
Required:       false
Default:        null
Documentation:  LDAP security principal used for authentication.

Name:           ldap.security.credentials
Type:           STRING
Required:       false
Default:        null
Documentation:  LDAP security credentials used for authentication.

Name:           oracle.kerberos.cache.file
Type:           STRING
Required:       false
Default:
Documentation:  If using Kerberose 5 authentication, set this to the location of the Kerberos 5 ticket cache file on all the Connect workers.

Name:           oracle.fan.events.enable
Type:           BOOLEAN
Required:       false
Default:        false
Documentation:  Whether the connection should allow using Oracle RAC Fast Application Notification (FAN) events. This is disabled by default, meaning FAN events will not be used even if they are supported by the database. This should only be enabled when using Oracle RAC set up with FAN events. Enabling this feature may cause connection issues when the database is not set up to use FAN events.

Name:           oracle.ssl.truststore.file
Type:           STRING
Required:       false
Default:
Documentation:  If using SSL for encryption and server authentication, set this to the location of the trust store containing server certificates that should be trusted.

Name:           oracle.ssl.truststore.password
Type:           PASSWORD
Required:       false
Default:        [hidden]
Documentation:  If using SSL for encryption and server authentication, the password of the trust store containing server certificates that should be trusted.

Name:           query.timeout.ms
Type:           LONG
Required:       false
Default:        300000
Documentation:  The timeout in milliseconds for any query submitted to Oracle. The default is 5 minutes (or 300000 milliseconds). If set to negative values, then the connector will not enforce timeout on queries.

Name:           max.retry.time.ms
Type:           LONG
Required:       false
Default:        86400000
Documentation:  The maximum time in milliseconds for any Oracle operation to retry. The default is 24 hours (or 86400000 milliseconds).

Name:           start.from
Type:           STRING
Required:       false
Default:        snapshot
Documentation:  What the connector should do when it starts for the first time. The value is either the literal ``snapshot`` (default), the literal ``current``, the literal ``force_current``. an Oracle System Change Number (SCN), or a database timestamp in the form ``DD-MON-YYYY HH24:MI:SS``. The ``snapshot`` literal instructs the connector to snapshot captured tables the first time it is started, then continue processing redo log events from the point in time when the snapshot was taken. The ``current`` literal instructs the connector to start from the current Oracle SCN without snapshotting. The ``force_current`` literal is the same as ``current`` but it will ignore any previously stored offsets when the connector is restarted. This option should only be used to recover the connector when the SCN stored in offsets is no longer available in the Oracle archive logs.

Name:           oracle.validation.result.fetch.size
Type:           INT
Required:       false
Default:        5000
Documentation:  The fetch size to be used while querying database for validations. This will be used to query list of tables and supplemental logging level validation.

Name:           tasks.max
Type:           INT
Required:       false
Default:        1
Documentation:  Maximum number of tasks to use for this connector.

Name:           db.timezone
Type:           STRING
Required:       false
Default:        UTC
Documentation:  Default timezone to assume when parsing Oracle DATE and TIMESTAMP types for which timezone info is not available. For example, if db.timezone=UTC, data of both DATE and TIMESTAMP will be parsed as if in UTC timezone. The value has to be a valid java.util.TimeZone ID.

Name:           db.timezone.date
Type:           STRING
Required:       false
Default:        null
Documentation:  Default timezone to assume when parsing Oracle DATE type for which timezone info is not available. If this is set, the value will overwrite the value of db.timezone for DATE type. For example, if db.timezone=UTC and db.timezone.date=America/Los_Angeles, data of TIMESTAMP type will be parsed as if in UTC timezone, and data of DATE type will be parsed as if in America/Los_Angeles timezone. The value has to be a valid java.util.TimeZone ID.

Name:           key.converter
Type:           CLASS
Required:       false
Default:        null
Documentation:  Converter class used to convert between Kafka Connect format and the serialized form that is written to Kafka. This controls the format of the keys in messages written to or read from Kafka, and since this is independent of connectors it allows any connector to work with any serialization format. Examples of common formats include JSON and Avro.

Name:           value.converter
Type:           CLASS
Required:       false
Default:        null
Documentation:  Converter class used to convert between Kafka Connect format and the serialized form that is written to Kafka. This controls the format of the values in messages written to or read from Kafka, and since this is independent of connectors it allows any connector to work with any serialization format. Examples of common formats include JSON and Avro.

Name:           enable.metrics.collection
Type:           BOOLEAN
Required:       false
Default:        false
Documentation:  If true, the connector records metrics that can be used to gain insight into the connector and troubleshoot issues. These metrics can be accessed using Java Management Extensions (JMX).

Name:           redo.log.topic.name
Type:           STRING
Required:       false
Default:        ${connectorName}-${databaseName}-redo-log
Documentation:  The name of the Kafka topic to which the connector will record all raw redo log events. A blank topic name (the default) signals that this information should not be written to Kafka.

Name:           redo.log.corruption.topic
Type:           STRING
Required:       false
Default:
Documentation:  The name of the Kafka topic to which the connector will record events that describe the information about corruption in the Oracle redo log, and which signify missed data. A blank topic name (the default) signals that this information should not be written to Kafka.

Name:           redo.log.poll.interval.ms
Type:           LONG
Required:       false
Default:        1000
Documentation:  The interval between polls to retrieve the database redo log events. This has no effect when continuous mine is available and enabled. The default is 1 second (or 1000 milliseconds)

Name:           redo.log.startup.polling.limit.ms
Type:           LONG
Required:       false
Default:        300000
Documentation:  The amount of time to wait for the redo log to be present on connector startup. This is only relevant when connector is configured to capture change events. The default is 5 minutes (or 300000 milliseconds)

Name:           snapshot.row.fetch.size
Type:           INT
Required:       false
Default:        2000
Documentation:  The number of rows to provide as a hint to the JDBC driver when fetching table rows in a snapshot. A value of 0 disables this hint.

Name:           snapshot.threads.per.task
Type:           INT
Required:       false
Default:        4
Documentation:  The number of threads that can be used in each task to perform snapshots. This is only used in each task the value is larger than the number of tables assigned to that task. The default is 4.

Name:           snapshot.by.table.partitions
Type:           BOOLEAN
Required:       false
Default:        false
Documentation:  Whether the connector should perform snapshots on each table partition if the table is defined to use partitions. This is ``false`` by default, meaning that one snapshot is performed on each table in its entirety.

Name:           redo.log.initial.delay.interval.ms
Type:           LONG
Required:       false
Default:        0
Documentation:  The amount of time to wait for in flight transactions to complete after the initial snapshot is taken, before the initial startup of reading redo logs. Only relevant on cold start when connector is configured to capture change events.

Name:           redo.log.row.fetch.size
Type:           INT
Required:       false
Default:        10
Documentation:  The number of rows to provide as a hint to the JDBC driver when fetching rows from the redo log. A value of 0 disables this hint.

Name:           redo.log.row.poll.fields.include
Type:           LIST
Required:       false
Default:
Documentation:  Comma-separated list of the fields to include in the redo log

Name:           redo.log.row.poll.fields.exclude
Type:           LIST
Required:       false
Default:
Documentation:  Comma-separated list of the fields to exclude from the redo log

Name:           redo.log.row.poll.filter
Type:           STRING
Required:       false
Default:
Documentation:  SQL predicate to include the specific rows

Name:           use.transaction.begin.for.mining.session
Type:           BOOLEAN
Required:       false
Default:        false
Documentation:  Set start SCN for log mining session based on if there are active transactions or not. This is used only in the without continuous mining mode

Name:           oracle.dictionary.mode
Type:           STRING
Required:       false
Default:        auto
Documentation:  The dictionary handling mode used by the connector. One of auto, online, or redo_log.

auto: the connector uses the dictionary from the online catalog until a DDL statement to evolve the table schema is encountered. At which point, the connector starts using the dictionary from archived redo logs. Once the DDL statement has been processed, the connector reverts back to using the online catalog. Use this mode if DDL statements are expected.

online: the connector always uses the online dictionary catalog. Use this mode if no DDL statements are expected.

redo_log: the connector always uses the dictionary catalog from archived redo logs. Use this mode if you can not access the online redo log. Note that any CDC events will be delayed until they are archived from online logs before they are processed by the connector.

Name:           record.buffer.mode
Type:           STRING
Required:       false
Default:        connector
Documentation:  Where to buffer records that are part of the transaction but may not yet be committed. Options are:
  * ``database``: buffer the records in database. This option uses the ``COMMITTED_DATA_ONLY`` flag to LogMiner so that the connector only receives committed records. Transactions that are rolled back or in-progress are filtered out, as are internal redo records.
  * ``connector``: buffer uncommitted transactions in connector memory.
The default option is ``connector`` . Use the ``database`` option if the worker where redo log processing task (task 0) is running is memory constrained so you would rather do buffering in the database. Note, though, that this option increases the database memory usage to stage all redo records within a single transaction in memory until LogMiner finds the commit record for that transaction. Therefore, it is possible to exhaust memory.

Name:           redo.log.consumer.bootstrap.servers
Type:           LIST
Required:       false
Default:
Documentation:  A list of host/port pairs to use for establishing the initial connection to the Kafka cluster with the redo log topic. The client will make use of all servers irrespective of which servers are specified here for bootstrapping—this list only impacts the initial hosts used to discover the full set of servers. This list should be in the form ``host1:port1,host2:port2,...``. Since these servers are just used for the initial connection to discover the full cluster membership (which may change dynamically), this list need not contain the full set of servers (you may want more than one, though, in case a server is down).

Name:           redo.log.consumer.client.dns.lookup
Type:           STRING
Required:       false
Default:        use_all_dns_ips
Documentation:  Controls how the client uses DNS lookups. If set to <code>use_all_dns_ips</code>, connect to each returned IP address in sequence until a successful connection is established. After a disconnection, the next IP is used. Once all IPs have been used once, the client resolves the IP(s) from the hostname again (both the JVM and the OS cache DNS name lookups, however). If set to <code>resolve_canonical_bootstrap_servers_only</code>, resolve each bootstrap address into a list of canonical names. After the bootstrap phase, this behaves the same as <code>use_all_dns_ips</code>.

Name:           redo.log.consumer.group.id
Type:           STRING
Required:       false
Default:        null
Documentation:  A unique string that identifies the consumer group this consumer belongs to. This property is required if the consumer uses either the group management functionality by using <code>subscribe(topic)</code> or the Kafka-based offset management strategy.

Name:           redo.log.consumer.group.instance.id
Type:           STRING
Required:       false
Default:        null
Documentation:  A unique identifier of the consumer instance provided by the end user. Only non-empty strings are permitted. If set, the consumer is treated as a static member, which means that only one instance with this ID is allowed in the consumer group at any time. This can be used in combination with a larger session timeout to avoid group rebalances caused by transient unavailability (e.g. process restarts). If not set, the consumer will join the group as a dynamic member, which is the traditional behavior.

Name:           redo.log.consumer.session.timeout.ms
Type:           INT
Required:       false
Default:        45000
Documentation:  The timeout used to detect client failures when using Kafka's group management facility. The client sends periodic heartbeats to indicate its liveness to the broker. If no heartbeats are received by the broker before the expiration of this session timeout, then the broker will remove this client from the group and initiate a rebalance. Note that the value must be in the allowable range as configured in the broker configuration by <code>group.min.session.timeout.ms</code> and <code>group.max.session.timeout.ms</code>.

Name:           redo.log.consumer.heartbeat.interval.ms
Type:           INT
Required:       false
Default:        3000
Documentation:  The expected time between heartbeats to the consumer coordinator when using Kafka's group management facilities. Heartbeats are used to ensure that the consumer's session stays active and to facilitate rebalancing when new consumers join or leave the group. The value must be set lower than <code>session.timeout.ms</code>, but typically should be set no higher than 1/3 of that value. It can be adjusted even lower to control the expected time for normal rebalances.

Name:           redo.log.consumer.partition.assignment.strategy
Type:           LIST
Required:       false
Default:        class org.apache.kafka.clients.consumer.RangeAssignor,class org.apache.kafka.clients.consumer.CooperativeStickyAssignor
Documentation:  A list of class names or class types, ordered by preference, of supported partition assignment strategies that the client will use to distribute partition ownership amongst consumer instances when group management is used. Available options are:<ul><li><code>org.apache.kafka.clients.consumer.RangeAssignor</code>: Assigns partitions on a per-topic basis.</li><li><code>org.apache.kafka.clients.consumer.RoundRobinAssignor</code>: Assigns partitions to consumers in a round-robin fashion.</li><li><code>org.apache.kafka.clients.consumer.StickyAssignor</code>: Guarantees an assignment that is maximally balanced while preserving as many existing partition assignments as possible.</li><li><code>org.apache.kafka.clients.consumer.CooperativeStickyAssignor</code>: Follows the same StickyAssignor logic, but allows for cooperative rebalancing.</li></ul><p>The default assignor is [RangeAssignor, CooperativeStickyAssignor], which will use the RangeAssignor by default, but allows upgrading to the CooperativeStickyAssignor with just a single rolling bounce that removes the RangeAssignor from the list.</p><p>Implementing the <code>org.apache.kafka.clients.consumer.ConsumerPartitionAssignor</code> interface allows you to plug in a custom assignment strategy.</p>

Name:           redo.log.consumer.max.partition.fetch.bytes
Type:           INT
Required:       false
Default:        1048576
Documentation:  The maximum amount of data per-partition the server will return. Records are fetched in batches by the consumer. If the first record batch in the first non-empty partition of the fetch is larger than this limit, the batch will still be returned to ensure that the consumer can make progress. The maximum record batch size accepted by the broker is defined via <code>message.max.bytes</code> (broker config) or <code>max.message.bytes</code> (topic config). See fetch.max.bytes for limiting the consumer request size.

Name:           redo.log.consumer.send.buffer.bytes
Type:           INT
Required:       false
Default:        131072
Documentation:  The size of the TCP send buffer (SO_SNDBUF) to use when sending data. If the value is -1, the OS default will be used.

Name:           redo.log.consumer.receive.buffer.bytes
Type:           INT
Required:       false
Default:        65536
Documentation:  The size of the TCP receive buffer (SO_RCVBUF) to use when reading data. If the value is -1, the OS default will be used.

Name:           redo.log.consumer.fetch.min.bytes
Type:           INT
Required:       false
Default:        1
Documentation:  The minimum amount of data the server should return for a fetch request. If insufficient data is available the request will wait for that much data to accumulate before answering the request. The default setting of 1 byte means that fetch requests are answered as soon as a single byte of data is available or the fetch request times out waiting for data to arrive. Setting this to something greater than 1 will cause the server to wait for larger amounts of data to accumulate which can improve server throughput a bit at the cost of some additional latency.

Name:           redo.log.consumer.fetch.max.bytes
Type:           INT
Required:       false
Default:        52428800
Documentation:  The maximum amount of data the server should return for a fetch request. Records are fetched in batches by the consumer, and if the first record batch in the first non-empty partition of the fetch is larger than this value, the record batch will still be returned to ensure that the consumer can make progress. As such, this is not a absolute maximum. The maximum record batch size accepted by the broker is defined via <code>message.max.bytes</code> (broker config) or <code>max.message.bytes</code> (topic config). Note that the consumer performs multiple fetches in parallel.

Name:           redo.log.consumer.request.timeout.ms
Type:           INT
Required:       false
Default:        30000
Documentation:  The configuration controls the maximum amount of time the client will wait for the response of a request. If the response is not received before the timeout elapses the client will resend the request if necessary or fail the request if retries are exhausted.

Name:           redo.log.consumer.default.api.timeout.ms
Type:           INT
Required:       false
Default:        60000
Documentation:  Specifies the timeout (in milliseconds) for client APIs. This configuration is used as the default timeout for all client operations that do not specify a <code>timeout</code> parameter.

Name:           redo.log.consumer.socket.connection.setup.timeout.ms
Type:           LONG
Required:       false
Default:        10000
Documentation:  The amount of time the client will wait for the socket connection to be established. If the connection is not built before the timeout elapses, clients will close the socket channel.

Name:           redo.log.consumer.socket.connection.setup.timeout.max.ms
Type:           LONG
Required:       false
Default:        30000
Documentation:  The maximum amount of time the client will wait for the socket connection to be established. The connection setup timeout will increase exponentially for each consecutive connection failure up to this maximum. To avoid connection storms, a randomization factor of 0.2 will be applied to the timeout resulting in a random range between 20% below and 20% above the computed value.

Name:           redo.log.consumer.connections.max.idle.ms
Type:           LONG
Required:       false
Default:        540000
Documentation:  Close idle connections after the number of milliseconds specified by this config.

Name:           redo.log.consumer.max.poll.records
Type:           INT
Required:       false
Default:        500
Documentation:  The maximum number of records returned in a single call to poll(). Note, that <code>max.poll.records</code> does not impact the underlying fetching behavior. The consumer will cache the records from each fetch request and returns them incrementally from each poll.

Name:           redo.log.consumer.max.poll.interval.ms
Type:           INT
Required:       false
Default:        300000
Documentation:  The maximum delay between invocations of poll() when using consumer group management. This places an upper bound on the amount of time that the consumer can be idle before fetching more records. If poll() is not called before expiration of this timeout, then the consumer is considered failed and the group will rebalance in order to reassign the partitions to another member. For consumers using a non-null <code>group.instance.id</code> which reach this timeout, partitions will not be immediately reassigned. Instead, the consumer will stop sending heartbeats and partitions will be reassigned after expiration of <code>session.timeout.ms</code>. This mirrors the behavior of a static consumer which has shutdown.

Name:           redo.log.consumer.exclude.internal.topics
Type:           BOOLEAN
Required:       false
Default:        true
Documentation:  Whether internal topics matching a subscribed pattern should be excluded from the subscription. It is always possible to explicitly subscribe to an internal topic.

Name:           redo.log.consumer.isolation.level
Type:           STRING
Required:       false
Default:        read_uncommitted
Documentation:  Controls how to read messages written transactionally. If set to <code>read_committed</code>, consumer.poll() will only return transactional messages which have been committed. If set to <code>read_uncommitted</code> (the default), consumer.poll() will return all messages, even transactional messages which have been aborted. Non-transactional messages will be returned unconditionally in either mode. <p>Messages will always be returned in offset order. Hence, in  <code>read_committed</code> mode, consumer.poll() will only return messages up to the last stable offset (LSO), which is the one less than the offset of the first open transaction. In particular any messages appearing after messages belonging to ongoing transactions will be withheld until the relevant transaction has been completed. As a result, <code>read_committed</code> consumers will not be able to read up to the high watermark when there are in flight transactions.</p><p> Further, when in <code>read_committed</code> the seekToEnd method will return the LSO</p>

Name:           redo.log.consumer.security.protocol
Type:           STRING
Required:       false
Default:        PLAINTEXT
Documentation:  Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL.

Name:           redo.log.consumer.confluent.proxy.protocol.client.version
Type:           STRING
Required:       false
Default:        NONE
Documentation:  The version of the PROXY protocol that the client will use, or NONE if the PROXY protocol will not be used. This value must match that of the brokers to which the client is connecting. See the confluent.proxy.protocol.version configuration option for the broker configuration. See http://www.haproxy.org/download/1.8/doc/proxy-protocol.txt for more information on the PROXY protocol.

Name:           redo.log.consumer.confluent.proxy.protocol.client.address
Type:           STRING
Required:       false
Default:        null
Documentation:  This configuration specifies the connection initiator's IP address. While the configuration option is of type String, the user configuring the client should pass in a value representing an IPv4 or IPv6 address, since the broker will be attempting to parse one of those two IP address types. Note that this should be IP address, not a host name. This configuration option is conditionally required. The default value is null, but if the confluent.proxy.protocol.client.version is set to a valid protocol version, it is an error if this configuration option is not set.

Name:           redo.log.consumer.confluent.proxy.protocol.client.port
Type:           INT
Required:       false
Default:        null
Documentation:  This configuration specifies the connection initiator's port. The configuration option is of type Integer, though the port range is within the limits of a 16-bit value. This configuration option is conditionally required. The default value is null, but if the confluent.proxy.protocol.client.version is set to a valid protocol version, it is an error if this configuration option is not set.

Name:           redo.log.consumer.ssl.protocol
Type:           STRING
Required:       false
Default:        TLSv1.3
Documentation:  The SSL protocol used to generate the SSLContext. The default is 'TLSv1.3' when running with Java 11 or newer, 'TLSv1.2' otherwise. This value should be fine for most use cases. Allowed values in recent JVMs are 'TLSv1.2' and 'TLSv1.3'. 'TLS', 'TLSv1.1', 'SSL', 'SSLv2' and 'SSLv3' may be supported in older JVMs, but their usage is discouraged due to known security vulnerabilities. With the default value for this config and 'ssl.enabled.protocols', clients will downgrade to 'TLSv1.2' if the server does not support 'TLSv1.3'. If this config is set to 'TLSv1.2', clients will not use 'TLSv1.3' even if it is one of the values in ssl.enabled.protocols and the server only supports 'TLSv1.3'.

Name:           redo.log.consumer.ssl.provider
Type:           STRING
Required:       false
Default:        null
Documentation:  The name of the security provider used for SSL connections. Default value is the default security provider of the JVM.

Name:           redo.log.consumer.ssl.enabled.protocols
Type:           LIST
Required:       false
Default:        TLSv1.2,TLSv1.3
Documentation:  The list of protocols enabled for SSL connections. The default is 'TLSv1.2,TLSv1.3' when running with Java 11 or newer, 'TLSv1.2' otherwise. With the default value for Java 11, clients and servers will prefer TLSv1.3 if both support it and fallback to TLSv1.2 otherwise (assuming both support at least TLSv1.2). This default should be fine for most cases. Also see the config documentation for `ssl.protocol`.

Name:           redo.log.consumer.ssl.keystore.type
Type:           STRING
Required:       false
Default:        JKS
Documentation:  The file format of the key store file. This is optional for client. The values currently supported by the default `ssl.engine.factory.class` are [JKS, PKCS12, PEM].

Name:           redo.log.consumer.ssl.keystore.location
Type:           STRING
Required:       false
Default:        null
Documentation:  The location of the key store file. This is optional for client and can be used for two-way authentication for client.

Name:           redo.log.consumer.ssl.keystore.password
Type:           PASSWORD
Required:       false
Default:        null
Documentation:  The store password for the key store file. This is optional for client and only needed if 'ssl.keystore.location' is configured. Key store password is not supported for PEM format.

Name:           redo.log.consumer.ssl.key.password
Type:           PASSWORD
Required:       false
Default:        null
Documentation:  The password of the private key in the key store file or the PEM key specified in 'ssl.keystore.key'.

Name:           redo.log.consumer.ssl.keystore.key
Type:           PASSWORD
Required:       false
Default:        null
Documentation:  Private key in the format specified by 'ssl.keystore.type'. Default SSL engine factory supports only PEM format with PKCS#8 keys. If the key is encrypted, key password must be specified using 'ssl.key.password'

Name:           redo.log.consumer.ssl.keystore.certificate.chain
Type:           PASSWORD
Required:       false
Default:        null
Documentation:  Certificate chain in the format specified by 'ssl.keystore.type'. Default SSL engine factory supports only PEM format with a list of X.509 certificates

Name:           redo.log.consumer.ssl.truststore.certificates
Type:           PASSWORD
Required:       false
Default:        null
Documentation:  Trusted certificates in the format specified by 'ssl.truststore.type'. Default SSL engine factory supports only PEM format with X.509 certificates.

Name:           redo.log.consumer.ssl.truststore.type
Type:           STRING
Required:       false
Default:        JKS
Documentation:  The file format of the trust store file. The values currently supported by the default `ssl.engine.factory.class` are [JKS, PKCS12, PEM].

Name:           redo.log.consumer.ssl.truststore.location
Type:           STRING
Required:       false
Default:        null
Documentation:  The location of the trust store file.

Name:           redo.log.consumer.ssl.truststore.password
Type:           PASSWORD
Required:       false
Default:        null
Documentation:  The password for the trust store file. If a password is not set, trust store file configured will still be used, but integrity checking is disabled. Trust store password is not supported for PEM format.

Name:           redo.log.consumer.sasl.kerberos.service.name
Type:           STRING
Required:       false
Default:        null
Documentation:  The Kerberos principal name that Kafka runs as. This can be defined either in Kafka's JAAS config or in Kafka's config.

Name:           redo.log.consumer.sasl.mechanism
Type:           STRING
Required:       false
Default:        GSSAPI
Documentation:  SASL mechanism used for client connections. This may be any mechanism for which a security provider is available. GSSAPI is the default mechanism.

Name:           redo.log.consumer.sasl.jaas.config
Type:           PASSWORD
Required:       false
Default:        null
Documentation:  JAAS login context parameters for SASL connections in the format used by JAAS configuration files. JAAS configuration file format is described <a href="http://docs.oracle.com/javase/8/docs/technotes/guides/security/jgss/tutorials/LoginConfigFile.html">here</a>. The format for the value is: <code>loginModuleClass controlFlag (optionName=optionValue)*;</code>. For brokers, the config must be prefixed with listener prefix and SASL mechanism name in lower-case. For example, listener.name.sasl_ssl.scram-sha-256.sasl.jaas.config=com.example.ScramLoginModule required;

Name:           redo.log.consumer.sasl.client.callback.handler.class
Type:           CLASS
Required:       false
Default:        null
Documentation:  The fully qualified name of a SASL client callback handler class that implements the AuthenticateCallbackHandler interface.

Name:           redo.log.consumer.sasl.login.callback.handler.class
Type:           CLASS
Required:       false
Default:        null
Documentation:  The fully qualified name of a SASL login callback handler class that implements the AuthenticateCallbackHandler interface. For brokers, login callback handler config must be prefixed with listener prefix and SASL mechanism name in lower-case. For example, listener.name.sasl_ssl.scram-sha-256.sasl.login.callback.handler.class=com.example.CustomScramLoginCallbackHandler

Name:           redo.log.consumer.sasl.login.class
Type:           CLASS
Required:       false
Default:        null
Documentation:  The fully qualified name of a class that implements the Login interface. For brokers, login config must be prefixed with listener prefix and SASL mechanism name in lower-case. For example, listener.name.sasl_ssl.scram-sha-256.sasl.login.class=com.example.CustomScramLogin

Name:           redo.log.consumer.sasl.oauthbearer.token.endpoint.url
Type:           STRING
Required:       false
Default:        null
Documentation:  The URL for the OAuth/OIDC identity provider. If the URL is HTTP(S)-based, it is the issuer's token endpoint URL to which requests will be made to login based on the configuration in sasl.jaas.config. If the URL is file-based, it specifies a file containing an access token (in JWT serialized form) issued by the OAuth/OIDC identity provider to use for authorization.

Name:           redo.log.consumer.sasl.oauthbearer.jwks.endpoint.url
Type:           STRING
Required:       false
Default:        null
Documentation:  The OAuth/OIDC provider URL from which the provider's <a href="https://datatracker.ietf.org/doc/html/rfc7517#section-5">JWKS (JSON Web Key Set)</a> can be retrieved. The URL can be HTTP(S)-based or file-based. If the URL is HTTP(S)-based, the JWKS data will be retrieved from the OAuth/OIDC provider via the configured URL on broker startup. All then-current keys will be cached on the broker for incoming requests. If an authentication request is received for a JWT that includes a "kid" header claim value that isn't yet in the cache, the JWKS endpoint will be queried again on demand. However, the broker polls the URL every sasl.oauthbearer.jwks.endpoint.refresh.ms milliseconds to refresh the cache with any forthcoming keys before any JWT requests that include them are received. If the URL is file-based, the broker will load the JWKS file from a configured location on startup. In the event that the JWT includes a "kid" header value that isn't in the JWKS file, the broker will reject the JWT and authentication will fail.

Name:           key.template
Type:           STRING
Required:       false
Default:        ${primaryKeyStructOrValue}
Documentation:  The template that defines the Kafka record key for each change event. By default the key will contain a struct with the primary key fields, or null if the table has no primary or unique key.

Name:           max.batch.size
Type:           INT
Required:       false
Default:        1000
Documentation:  The maximum number of records that will be returned by the connector to Connect. The connector may still return fewer records if no additional records are available.

Name:           max.buffer.size
Type:           INT
Required:       false
Default:        0
Documentation:  The maximum number of records from all snapshot threads and from the redo log that can be buffered into batches. The default of 0 means a buffer size will be computed from the maximum batch size and number of threads.

Name:           poll.linger.ms
Type:           LONG
Required:       false
Default:        5000
Documentation:  The maximum time to wait for a record before returning an empty batch. The default is 5 seconds.

Name:           max.batch.timeout.ms
Type:           LONG
Required:       false
Default:        5000
Documentation:  Deprecated. Use ``poll.linger.ms`` instead.

Name:           numeric.mapping
Type:           STRING
Required:       false
Default:        none
Documentation:  Map NUMERIC values by precision and optionally scale to primitive or decimal types.
  * Use ``none`` if all NUMERIC columns are to be represented by Connect's DECIMAL logical type.
  * Use ``best_fit_or_decimal`` if NUMERIC columns should be cast to Connect's primitive type based upon the column's precision and scale. If the precision and scale exceed the bounds for any primitive type, Connect's DECIMAL logical type will be used instead.
  * Use ``best_fit_or_double`` if NUMERIC columns should be cast to Connect's primitive type based upon the column's precision and scale. If the precision and scale exceed the bounds for any primitive type, Connect's FLOAT64 type will be used instead.
  * Use ``best_fit_or_string`` if NUMERIC columns should be cast to Connect's primitive type based upon the column's precision and scale. If the precision and scale exceed the bounds for any primitive type, Connect's STRING type will be used instead.
  * Use ``precision_only`` to map NUMERIC columns based only on the column's precision assuming that column's scale is 0.

The ``none`` option is the default, but may lead to serialization issues since Connect's DECIMAL type is mapped to its binary representation. One of the ``best_fit_or`` options will often be preferred. For backwards compatibility reasons, the ``best_fit`` option is also available. It behaves the same as ``best_fit_or_decimal``

Name:           numeric.default.scale
Type:           INT
Required:       false
Default:        127
Documentation:  The default scale to use for numeric types when the scale cannot be determined.

Name:           emit.tombstone.on.delete
Type:           BOOLEAN
Required:       false
Default:        false
Documentation:  If true, delete operations emit a tombstone record with null value.

Name:           behavior.on.dictionary.mismatch
Type:           STRING
Required:       false
Default:        fail
Documentation:  Specifies the desired behavior when the connector is not able to parse the value of a column due to a dictionary mismatch caused by DDL statement. This can happen if the ``online`` dictionary mode is specified but the connector is streaming historical data recorded before DDL changes occurred. The default option ``fail`` will cause the connector task to fail. The ``log`` option will log the unparsable record and skip the problematic record without failing the connector task.

Name:           behavior.on.unparsable.statement
Type:           STRING
Required:       false
Default:        fail
Documentation:  Specifies the desired behavior when the connector encounters a SQL statement that could not be parsed. The default option ``fail`` will cause the connector task to fail. The ``log`` option will log the unparsable statement and skip the problematic record without failing the connector task.

Name:           oracle.date.mapping
Type:           STRING
Required:       false
Default:        date
Documentation:  Map Oracle DATE values to Connect types.
  * Use ``date`` if all DATE columns are to be represented by Connect's Date logical type.
  * Use ``timestamp`` if DATE columns should be cast to Connect's Timestamp.
  The ``date`` option is the default for backward compatibility. Despite the name similarity, Oracle DATE type has different semantics than Connect Date. ``timestamp`` will often be preferred for semantic similarity.

Name:           output.table.name.field
Type:           STRING
Required:       false
Default:        table
Documentation:  The name of the field in the change record written to Kafka that contains the schema-qualified name of the affected Oracle table (e.g., ``dbo.Customers``). A blank value signals that this field should not be included in the change records.

Name:           output.scn.field
Type:           STRING
Required:       false
Default:        scn
Documentation:  The name of the field in the change record written to Kafka that contains the Oracle system change number (SCN) when this change was made. A blank value signals that this field should not be included in the change records.

Name:           output.op.type.field
Type:           STRING
Required:       false
Default:        op_type
Documentation:  The name of the field in the change record written to Kafka that contains the operation type for this change event. A blank value signals that this field should not be included in the change records.

Name:           output.op.ts.field
Type:           STRING
Required:       false
Default:        op_ts
Documentation:  The name of the field in the change record written to Kafka that contains the operation timestamp for this change event. A blank value signals that this field should not be included in the change records.

Name:           output.current.ts.field
Type:           STRING
Required:       false
Default:        current_ts
Documentation:  The name of the field in the change record written to Kafka that contains the connector's timestamp when this change event was processed. A blank value signals that this field should not be included in the change records.

Name:           output.row.id.field
Type:           STRING
Required:       false
Default:        row_id
Documentation:  The name of the field in the change record written to Kafka that contains the row ID of the table changed by this event. A blank value signals that this field should not be included in the change records.

Name:           output.username.field
Type:           STRING
Required:       false
Default:        username
Documentation:  The name of the field in the change record written to Kafka that contains the name of the Oracle user that executed the transaction that resulted in this change. A blank value signals that this field should not be included in the change records.

Name:           output.redo.field
Type:           STRING
Required:       false
Default:
Documentation:  The name of the field in the change record written to Kafka that contains the original redo DML statement from which this change record was created. A blank value signals that this field should not be included in the change records.

Name:           output.undo.field
Type:           STRING
Required:       false
Default:
Documentation:  The name of the field in the change record written to Kafka that contains the original undo DML statement that effectively undoes this change and represents the "before" state of the row. A blank value signals that this field should not be included in the change records.

Name:           output.op.type.read.value
Type:           STRING
Required:       false
Default:        R
Documentation:  The value of the operation type for a read (snapshot) change event. By default this is "R".

Name:           output.op.type.insert.value
Type:           STRING
Required:       false
Default:        I
Documentation:  The value of the operation type for an insert change event. By default this is "I".

Name:           output.op.type.update.value
Type:           STRING
Required:       false
Default:        U
Documentation:  The value of the operation type for an update change event. By default this is "U".

Name:           output.op.type.delete.value
Type:           STRING
Required:       false
Default:        D
Documentation:  The value of the operation type for a delete change event. By default this is "D".

Name:           output.op.type.truncate.value
Type:           STRING
Required:       false
Default:        T
Documentation:  The value of the operation type for a truncate change event. By default this is "T".

Name:           lob.topic.name.template
Type:           STRING
Required:       false
Default:
Documentation:  The template that defines the name of the Kafka topic to which LOB objects should be written. The value can be a constant if all LOB objects from all captured tables are to be written to one topic, or the value can include any supported template variables, including ``${columnName}``, ``${databaseName}``, ``${schemaName}``, ``${tableName}``, ``${connectorName}``, etc. The default is empty, which will ignore all LOB type columns if any exist on captured tables. Special-meaning characters ``\``, ``$``, ``{``, and ``}`` must be escaped with ``\`` when not intended to be part of a template variable.

Name:           enable.large.lob.object.support
Type:           BOOLEAN
Required:       false
Default:        false
Documentation:  If true, the connector will support large LOB objects that are split across multiple redo log records. The connector will emit commit messages to the redo log topic and use these commit messages to track when a large LOB object can be emitted to the LOB topic.

Name:           heartbeat.interval.ms
Type:           LONG
Required:       false
Default:        0
Documentation:  The interval after which the connector would send heartbeats to a heartbeat topic configured via heartbeat.topic.name config. Setting this config to 0 would disable this heartbeating mechanism from the connector.

Name:           heartbeat.topic.name
Type:           STRING
Required:       false
Default:        ${connectorName}-${databaseName}-heartbeat-topic
Documentation:  The name of the Kafka topic to which the connector will record heartbeat events after almost once in a heartbeat.interval.ms milliseconds value. Note that, if heartbeat.interval.ms is set to 0, then no heartbeat messages would be sent and this topic won't be automatically created

Name:           log.sensitive.data
Type:           BOOLEAN
Required:       false
Default:        false
Documentation:  If true, logs sensitive data (such as customer records, SQL queries or exception traces containing sensitive data). Set this to true only in exceptional scenarios where logging sensitive data is acceptable and is necessary for troubleshooting.

Name:           table.inclusion.regex
Type:           STRING
Required:       true
Default:        null
Documentation:  A Java regular expression that matches the schema-qualified names of the tables (e.g., ``dbo.Customers``) to be captured. For example, ``dbo[.](table1|orders|customers)``. Matches are case-sensitive.

Name:           table.exclusion.regex
Type:           STRING
Required:       false
Default:
Documentation:  A Java regular expression that matches the schema-qualified names of the tables (e.g., ``dbo.Customers``) not to be captured. For example, ``dbo[.](table1|orders|customers)``. Matches are case-sensitive. The exclusion pattern is applied after the inclusion pattern. A blank regex (the default) implies no exclusions.

Name:           table.topic.name.template
Type:           STRING
Required:       false
Default:        ${databaseName}.${schemaName}.${tableName}
Documentation:  The template that defines the name of the Kafka topic to which the change event is to be written. The value can be a constant if all records from all captured tables are to be written to one topic, or the value can include any supported template variables, including ``${databaseName}``, ``${schemaName}``, ``${tableName}``, ``${connectorName}``, etc. The default is ``${databaseName}.${schemaName}.${tableName}``. Special-meaning characters ``\``, ``$``, ``{``, and ``}`` must be escaped with ``\`` when not intended to be part of a template variable. May be blank only when a redo log topic is specified, in which case the connector will only write to the redo log topic.

Name:           table.task.reconfig.checking.interval.ms
Type:           LONG
Required:       false
Default:        300000
Documentation:  The interval for the background monitoring thread to examine changes to table set and reconfigure table placement if necessary. The default is 5 minutes.

Name:           table.rps.logging.interval.ms
Type:           LONG
Required:       false
Default:        60000
Documentation:  The interval for the background thread to log current RPS of each table

Name:           oracle.supplemental.log.level
Type:           STRING
Required:       false
Default:        full
Documentation:  Database Supplemental logging level at which the connector would operate. If set to ``full``, the connector validates the same and captures Snapshots and CDC events for the specified tables whenever ``table.topic.name.template`` is not set to "". When it is ``msl``, then the connector only captures snapshots if ``table.topic.name.template`` is not set to "". The redo logs are captured irrespective of the setting. This setting defaults to ``full`` supplemental logging level mode.

Name:           connection.pool.initial.size
Type:           INT
Required:       false
Default:        0
Documentation:  The number of JDBC connections created immediately upon startup, before any connection is needed. A non-zero initial size can be used to reduce the ramp-up time incurred by priming the pool to its optimal size.

Name:           connection.pool.min.size
Type:           INT
Required:       false
Default:        0
Documentation:  The minimum number of available and borrowed JDBC connections in each worker's connection pool. A connection pool always tries to return to the minimum pool size specified unless the minimum number has yet to be reached.

Name:           connection.pool.max.size
Type:           INT
Required:       false
Default:        20
Documentation:  The maximum number of available and borrowed JDBC connections in worker's connection pool. If the maximum number of connections are borrowed (in use), no connections will be available for other uses until a borrowed connection is returned to the pool.

Name:           connection.pool.login.timeout.ms
Type:           LONG
Required:       false
Default:        0
Documentation:  The maximum time in milliseconds wait for a connection to be established before failing. A value of 0 specifies that the system timeout should be used.

Name:           connection.pool.connection.wait.timeout.ms
Type:           LONG
Required:       false
Default:        0
Documentation:  Specifies how long an application request waits to obtain a connection if there are no longer any connections in the pool. A connection pool runs out of connections if all connections in the pool are being used (borrowed) and if the pool size has reached it's maximum connection capacity as specified by the maximum pool size property. This timeout feature improves overall application usability by minimizing the amount of time an application is blocked and provides the ability to implement a graceful recovery. A value of 0 disables the feature.

Name:           confluent.license
Type:           PASSWORD
Required:       false
Default:        [hidden]
Documentation:  Confluent will issue a license key to each subscriber. The license key will be a short snippet of text that you can copy and paste. Without the license key, you can use the connector for a 30-day trial period. If you are a subscriber, please contact Confluent Support for more information.

Name:           confluent.topic.bootstrap.servers
Type:           LIST
Required:       true
Default:        null
Documentation:  A list of host/port pairs to use for establishing the initial connection to the Kafka cluster used for licensing. All servers in the cluster will be discovered from the initial connection. This list should be in the form ``host1:port1,host2:port2,...``. These servers are used only for the initial connection to discover the full cluster membership, which may change dynamically, so this list need not contain the full set of servers. You may want more than one, in case a server is down.

Name:           confluent.topic
Type:           STRING
Required:       false
Default:        _confluent-command
Documentation:  Name of the Kafka topic used for Confluent Platform configuration, including licensing information.

Name:           confluent.topic.replication.factor
Type:           INT
Required:       false
Default:        3
Documentation:  The replication factor for the Kafka topic used for Confluent Platform configuration, including licensing information. This is used only if the topic does not already exist, and the default of 3 is appropriate for production use. If you are using a development environment with less than 3 brokers, you must set this to the number of brokers (often 1).
```
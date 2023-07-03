FROM confluentinc/cp-server-connect:7.4.0
USER root
RUN  confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-http:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-replicator:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest \
  && confluent-hub install --no-prompt confluentinc/connect-transforms:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:latest

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-data-lake-gen2-storage:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-oracle-cdc:latest



ENV CLASSPATH="/usr/share/confluent-hub-components/confluentinc-kafka-connect-replicator/lib/replicator-rest-extension-7.4.0.jar"

ADD nermin.properties /etc/cfk/nermin.properties
ADD connect.properties /etc/cfk/connect.properties
COPY debezium/debezium-connector-oracle /mnt/plugins/debezium_oracle

ADD debezium/debezium-connector-oracle /usr/share/java/debezium-connector-oracle
RUN chmod -R a+rX /usr/share/java/debezium-connector-oracle/


USER 1001

#plugin.path=/usr/share/java,/usr/share/confluent-hub-components,/mnt/plugins,/usr/share/filestream-connectors

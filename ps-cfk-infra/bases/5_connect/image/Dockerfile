FROM confluentinc/cp-server-connect:7.3.3
USER root
RUN   confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-http:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-replicator:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest \
  && confluent-hub install --no-prompt confluentinc/connect-transforms:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:latest


ENV CONFLUENT_SECURITY_MASTER_KEY=$MASTER_KEY
ADD nermin.properties /etc/cfk/nermin.properties
ADD nejra.properties /etc/cfk/nejra.properties
ADD connect.properties /etc/cfk/connect.properties


USER 1001
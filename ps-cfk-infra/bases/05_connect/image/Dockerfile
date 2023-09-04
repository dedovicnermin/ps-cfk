FROM confluentinc/cp-server-connect:7.5.0
USER root
RUN  confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-http:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-replicator:latest \
  && confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest \
  && confluent-hub install --no-prompt confluentinc/connect-transforms:latest



ENV CLASSPATH="/usr/share/confluent-hub-components/confluentinc-kafka-connect-replicator/lib/replicator-rest-extension-7.5.0.jar"

ADD nermin.properties /etc/cfk/nermin.properties
ADD connect.properties /etc/cfk/connect.properties



USER 1001

#plugin.path=/usr/share/java,/usr/share/confluent-hub-components,/mnt/plugins,/usr/share/filestream-connectors

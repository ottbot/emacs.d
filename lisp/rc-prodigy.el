(defun rc/prodigy-confluent-service (name command properties-file)
  (let ((cwd "/home/rob/work/confluent-4.1.0"))
    (prodigy-define-service
      :name name
      :command command
      :args (list (concat cwd "/etc/" properties-file))
      :path (concat cwd "/bin")
      :cwd cwd
      :tags '(confluent))))

(defun rc/prodigy-config ()
  (prodigy-define-tag
    :name 'confluent)

  (prodigy-define-tag
    :name 'landoop)

  (prodigy-define-service
    :name "RabbitMQ"
    :command "rabbitmq-server"
    :sudo t)

  (rc/prodigy-confluent-service "Zookeeper"
                                "zookeeper-server-start"
                                "kafka/zookeeper.properties")

  (rc/prodigy-confluent-service "Kafka"
                                "kafka-server-start"
                                "kafka/server.properties")

  (rc/prodigy-confluent-service "Schema Registry"
                                "schema-registry-start"
                                "schema-registry/schema-registry.properties")

  (rc/prodigy-confluent-service "Kafka Connect"
                                "connect-distributed"
                                "kafka/connect-distributed.properties")

  (rc/prodigy-confluent-service "REST Proxy"
                                "kafka-rest-start"
                                "kafka-rest/kafka-rest.properties")

  (rc/prodigy-confluent-service "Control Center"
                                "control-center-start"
                                "confluent-control-center/control-center-dev.properties")

  (prodigy-define-service
    :name "Landoop KC UI"
    :command "landoop-kc-ui"
    :stop-signal 'int
    :tags '(landoop))

  (prodigy-define-service
    :name "Landoop Registry UI"
    :command "landoop-registry-ui"
    :stop-signal 'int
    :tags '(landoop))

  (prodigy-define-service
    :name "Landoop Topics UI"
    :command "landoop-topics-ui"
    :stop-signal 'int
    :tags '(landoop)))


(provide 'rc-prodigy)

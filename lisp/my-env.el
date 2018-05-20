(dolist (p '("/usr/local/bin" "/Library/TeX/texbin" "/Users/rob/.cabal/bin"))
  (setenv "PATH" (concat (getenv "PATH") ":" p))
  (add-to-list 'exec-path p))

(setenv "KAFKA_ADDRESS" "192.168.99.100:9092")
(setenv "ZOOKEEPER_ADDRESS" "192.168.99.100:2181")
(setenv "SCHEMA_REGISTRY_URL" "http://localhost:8081")

(setenv "RIEMANN_HOST" "localhost")
(setenv "RIEMANN_PORT" "5555")

(provide 'my-env)

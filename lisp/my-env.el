(setenv "BOOT_CLOJURE_VERSION" "1.7.0")
(setenv "BOOT_JVM_OPTIONS" "-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
(setq exec-path (append exec-path '("/usr/texbin")))


(setenv "ZOOKEEPER_ADDRESS" "localhost:2181")
(setenv "SCHEMA_REGISTRY_URL" "http://localhost:8081")

(setenv "RIEMANN_HOST" "localhost")
(setenv "RIEMANN_PORT" "5555")

(provide 'my-env)

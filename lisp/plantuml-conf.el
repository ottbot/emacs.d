;; Enable puml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

(setq puml-plantuml-jar-path "/usr/local/opt/plantuml/plantuml.8031.jar")

(setq puml-output-type "svg")

(provide 'plantuml-conf)

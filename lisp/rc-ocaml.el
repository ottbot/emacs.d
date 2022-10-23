(use-package merlin-eldoc
  :init
  :hook ((tuareg-mode caml-mode) . merlin-eldoc-setup))

(use-package flycheck)

(use-package tuareg)

(use-package merlin-company)

(use-package merlin
  :diminish
  :init
  (require 'merlin-company)
  (add-hook 'caml-mode-hook #'merlin-mode)
  (add-hook 'tuareg-mode-hook
            #'(lambda ()
                (merlin-mode)
                (ocp-index-mode 0)
                (setq mode-name "🧙🏽‍♂️"))))

(use-package dune)

(provide 'rc-ocaml)

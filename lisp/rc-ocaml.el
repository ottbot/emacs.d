(when (require 'dune nil 'noerror)
  (rc/add-parinfer 'dune-mode-hook))

(defun rc/tuareg-mode-hook ()
  (setq lsp-diagnostics-provider :none)
  (lsp-deferred))

(add-hook 'tuareg-mode-hook 'rc/tuareg-mode-hook)

(provide 'rc-ocaml)

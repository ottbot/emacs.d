(when (require 'dune nil 'noerror)
  (rc/add-parinfer 'dune-mode-hook))

(defun rc/tuareg-mode-hook ()
  (setq lsp-diagnostics-provider :none)
  (lsp-deferred))

(add-hook 'tuareg-mode-hook #'rc/tuareg-mode-hook)

(rc/bind-keys
 utop-mode-map
 '("C-p" utop-history-goto-prev
   "C-n" utop-history-goto-next))

(provide 'rc-ocaml)

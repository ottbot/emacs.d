(when (require 'dune nil 'noerror)
  (rc/add-parinfer 'dune-mode-hook))

(defun rc/eglot-hook ()
  (eglot-ensure)
  (add-hook 'before-save-hook 'eglot-format-buffer nil t))

(add-hook 'tuareg-mode-hook 'rc/eglot-hook)

(provide 'rc-ocaml)

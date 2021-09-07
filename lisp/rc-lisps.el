(defun rc/add-parinfer (hook)
  (add-hook hook 'parinfer-rust-mode))

(progn
  (rc/sup 'parinfer-rust-mode)

  (rc/add-parinfer 'emacs-lisp-mode-hook)

  (setq parinfer-rust-library
        "~/.emacs.d/parinfer-rust/libparinfer_rust.dylib"))

(provide 'rc-lisps)

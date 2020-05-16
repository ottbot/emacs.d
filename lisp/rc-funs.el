;;; rc-funs -- summary
;;; commentary:
;;; just some functions

;;; code:
(defun rc/add-path (path)
  "Add the PATH to environment variable and the `exec-path`."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (setq exec-path (append exec-path (list path))))

(defvar is-mac (eq system-type 'darwin))

(defun rc/when-mac (x y)
  "Return X if on a Mac, else you get Y."
  (if is-mac x y))

(defun rc/shell-command-to-trimmed-string (CMD)
  "Returns the result CMD without trailing newline"
  (replace-regexp-in-string
   "\n\\'" ""
   (shell-command-to-string CMD)))

(defun rc/compile-in-dir (DIR CMD)
  "Runs compile with CMD in DIR"
  (with-temp-buffer
    (cd DIR)
    (compile CMD)))


(provide 'rc-funs)
;;; rc-funs.el ends here

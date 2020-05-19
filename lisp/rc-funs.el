;;; rc-funs -- just some common functions
;;; commentary:
;;; code:

(defvar is-mac (eq system-type 'darwin))

(defvar default-exec-path exec-path "The value of exec-path from start-up")

(defun rc/sync-exec-path ()
  "Set emacs 'exec-path' to environment path."
  (setq exec-path (delete-dups
                   (append default-exec-path
                           (split-string (getenv "PATH") ":")))))



(defvar rc/theme-ring '() "A list of themes to toggle through.")

(defun rc/rotate-theme ()
  "Load up the next theme in `rc/theme-ring`."
  (interactive)
  (when rc/theme-ring
    (load-theme (car rc/theme-ring) t)
    (add-to-list 'rc/theme-ring (pop rc/theme-ring) t)))


(defun rc/init-theme-ring (THEMES)
  "Set the theme ring using THEMES, activating the first one."
  (setq rc/theme-ring THEMES)
  (rc/rotate-theme))


(defun rc/add-path (path)
  "Add the PATH to environment variable and the `exec-path`."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (rc/sync-exec-path))


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

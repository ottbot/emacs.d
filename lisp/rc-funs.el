;;; rc-funs -- summary
;;; commentary:
;;; just some functions

;;; code:
(defun add-path (path)
  "Add the PATH to environment variable and the `exec-path`."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (setq exec-path (append exec-path (list path))))

(defvar is-mac (eq system-type 'darwin))

(defun when-mac (x y)
  "Return X if on a Mac, else you get Y."
  (if is-mac x y))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(provide 'rc-funs)
;;; rc-funs.el ends here

(defun my-tramp-header-line-function ()
  (when (string-match "^/su\\(do\\)?:" default-directory)
    (setq header-line-format
          (format-mode-line "----- THIS BUFFER IS VISITED WITH ROOT PRIVILEGES -----"
                            'font-lock-warning-face))))

(add-hook 'find-file-hooks 'my-tramp-header-line-function)
(add-hook 'dired-mode-hook 'my-tramp-header-line-function)


(defun my-tramp-background ()
  (when (string-match "^/sshx:" default-directory)
    (set (make-local-variable 'face-remapping-alist)
         '((default (:background "#33033"))))))

(add-hook 'find-file-hooks 'my-tramp-background)
(add-hook 'dired-mode-hook 'my-tramp-background)


(provide 'tramp-conf)

(setq package-enable-at-startup nil)

;;--- bootstrap straight.el

(defvar bootstrap-version)

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq-default  straight-fix-org t
               straight-fix-flycheck t
               straight-use-package-by-default t)

(straight-use-package 'exec-path-from-shell)
(straight-use-package 'use-package)


(exec-path-from-shell-initialize)

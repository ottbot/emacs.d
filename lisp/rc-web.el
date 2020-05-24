;;; rc-web.el --- web dev stuff
;;; Commentary:
;;; Code:


(defun rc/simple-server (DIR)
  "Run a node simple-server in DIR."
  (interactive "DDirectory to serve: ")
  (let ((buff (generate-new-buffer (concat  "*simple-server[" DIR "]*"))))
    (with-temp-buffer
      (cd DIR)
      (async-shell-command "simple-server" buff))))

(use-package web-mode)

(use-package json-mode
  :config
  (setq js-indent-level 2))


(use-package css-mode
  :config
  (add-to-list 'company-backends 'company-css))


(defun rc/elm-hooks ()
  "Just some hooks for elm."
  (elm-format-on-save-mode)
  (lsp))

(use-package elm-mode
  :config
  (setq elm-indent-offset 2)
  (add-hook 'elm-mode-hook 'rc/elm-hooks))


(provide 'rc-web)
;;; rc-web.el ends here

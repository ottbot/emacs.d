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

(provide 'rc-web)
;;; rc-web.el ends here

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

(use-package web-mode
  :ensure t)

(use-package json-mode
  :ensure t
  :customize js-indent-level 2)

(provide 'rc-lisps)
;;; rc-web.el ends here

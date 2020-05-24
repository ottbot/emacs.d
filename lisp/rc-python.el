;;; rc-python.el -- the python setup
;;; Commentary:
;;; Code:

(defun rc/python-hooks ()
  "The hooks for python."
  (lsp)
  (rc/lsp-format-before-save))

(use-package ipython-shell-send
  :ensure t
  :commands ipython-shell-send)

(use-package python-mode
  :bind
  (:map python-mode-map
        ("C-c C-c" . ipython-shell-send-region)
        ("C-c C-b" . ipython-shell-send-buffer)
        ("C-c C-k" . ipython-shell-send-defun))
  :custom
  (lsp-pyls-plugins-autopep8-enabled nil)
  (lsp-pyls-plugins-yapf-enabled t)
  (python-indent 0)
  (python-indent-offset 0)
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "--simple-prompt -i")
  :init
  (add-hook 'python-mode-hook 'lsp))

(provide 'rc-python)
;;; rc-python.el ends here

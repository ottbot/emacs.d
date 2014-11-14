(require 'multi-term)

(setq multi-term-program "/usr/bin/bash")

(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))

(provide 'multi-term-conf)

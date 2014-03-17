(defun css-custom ()
  "css-mode-hook"
  (set (make-local-variable 'css-indent-offset) 2))

(add-hook 'css-mode-hook
          '(lambda() (css-custom)))


(provide 'css-conf)

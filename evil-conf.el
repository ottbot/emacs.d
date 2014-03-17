(evil-mode 1)

(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(defun evil-enter-normal-state-if-in-insert ()
  (when (evil-insert-state-p) (evil-normal-state)))

(add-hook 'before-save-hook 'evil-enter-normal-state-if-in-insert)

(provide 'evil-conf)

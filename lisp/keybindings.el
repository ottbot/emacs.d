(define-key global-map [f6] 'my-ido-project-files)

(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "M-N") 'forward-page)
(global-set-key (kbd "M-P") 'backward-page)

(global-set-key [f7] 'magit-status)
(global-set-key [f8] 'ansi-term)
(global-set-key [f9] 'eshell)


(avy-setup-default)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)


(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'ace-window)

;; remap C-a to `smarter-move-beginning-of-line
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(provide 'keybindings)

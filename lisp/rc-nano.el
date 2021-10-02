(require 'rc-base)

;; https://github.com/rougier/nano-emacs


;; (rc/sup '(nano-theme :type git :host github
;;                      :repo "rougier/nano-theme"))

(straight-use-package
  '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))

(require 'nano)

;; (setq nano-font-size 16
;;       nano-font-family-proportional "Roboto"
;;       nano-font-family-monospaced "Roboto Mono Nerd Font Complete Mono")




(provide 'rc-nano)

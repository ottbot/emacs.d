(require 'rc-base)

;; https://github.com/rougier/nano-emacs

(straight-use-package
  '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))

(require 'nano-theme-light)
(require 'nano)

(require 'nano-counsel)

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; macos stuff
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(global-hl-line-mode +1)
(column-number-mode t)
(size-indication-mode t)

(setq scroll-preserve-screen-position 1)



















;; (setq nano-font-size 16
;;       nano-font-family-proportional "Roboto"
;;       nano-font-family-monospaced "Roboto Mono Nerd Font Complete Mono")


(provide 'rc-nano)

;; ⊂(◉‿◉)つ


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc-package)
(require 'rc-defaults)
(require 'rc-funs)


(setq use-package-always-ensure t)


(use-package diminish)
(use-package bind-key)

(use-package exwm
  :config
  (require 'rc-exwm)
  (rc/exwm-config))

(use-package ace-jump-mode
  :bind ("C-." . ace-jump-mode))

(use-package unkillable-scratch
  :custom
  (unkillable-scratch-behaviour 'bury))

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (unkillable-scratch auto-package-update ace-jump-mode diminish exwm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

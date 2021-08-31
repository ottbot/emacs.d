;;--- bootstrap straight.el

(defvar bootstrap-version)

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq-default  straight-fix-org t
               straight-fix-flycheck t
               straight-use-package-by-default t)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;;-----


(setq user-full-name "Robert Crim"
      user-mail-address "rob@servermilk.com")

;; don't persist customizations here
(setq custom-file "~/.emacs.d/custom.el")

;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t
  version-control t
  delete-old-versions t
  kept-new-versions 20
  kept-old-versions 5)

(recentf-mode 1)
;; visual

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)


(global-hl-line-mode +1)
(column-number-mode t)
(size-indication-mode t)
(setq inhibit-startup-screen t)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(set-frame-font "Dank Mono 15" nil t)

(setq-default indent-tabs-mode nil)


(use-package unkillable-scratch)

(use-package doom-themes
  :config
  (load-theme 'doom-one-light t)
  (doom-themes-visual-bell-config))

(use-package diminish)

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package crux
  :bind
  ("C-k" . crux-smart-kill-line)
  ("C-c n" . crux-cleanup-buffer-or-region)
  ("C-c f" . crux-recentf-find-file)
  ("C-a" . crux-move-beginning-of-line))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package expand-region
  :bind ("M-m" . er/expand-region))


(use-package feebleline
  :config
  (feebleline-mode 't))

(use-package emojify)

;; macos stuff
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))


(use-package avy
  :bind
  ("C-=" . avy-goto-char)
  :config
  (setq avy-background t))

(use-package company
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))

(use-package ivy
  :config
  (ivy-mode 1))


(use-package counsel
  :bind (("M-x" . counsel-M-x)))

(use-package prescient)

(use-package ivy-prescient
  :config
  (ivy-prescient-mode t))


(use-package ivy-hydra)

(use-package swiper)

(use-package major-mode-hydra
  :bind
  ("C-M-SPC" . major-mode-hydra)
  :config
  (major-mode-hydra-define org-mode
    ()
    ("Tools"
     (("l" org-lint "lint")))))

(use-package which-key
  :diminish which-key-mode
  :config
  (add-hook 'after-init-hook 'which-key-mode))

(use-package ace-window
   :config
   (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package fzf)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package parinfer-rust-mode
  :hook emacs-lisp-mode
  :init
  (setq parinfer-rust-library "~/.emacs.d/parinfer-rust/libparinfer_rust.dylib"))


(use-package projectile)

(use-package rust-mode)

(use-package ein)


;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

;;; rc.el --- Personal Package -*- lexical-binding: t -*-

(setq custom-file "~/.emacs.d/lisp/custom.el")

(global-set-key (kbd "s-w") 'bury-buffer)

(defalias 'yes-or-no-p 'y-or-n-p)

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(use-package dash)

(use-package info-look
  :no-require t
  :config
  (dash-register-info-lookup))


(use-package unkillable-scratch)

(use-package ivy)
(use-package ivy-hydra)
(use-package ivy-prescient)

(use-package swiper)

(use-package diminish)

(use-package company
  :config
  (global-company-mode))

(use-package which-key
  :config
  (which-key-mode))

(use-package vterm
  :bind ("s-t" . vterm))


(use-package counsel
  :bind ("M-x" . counsel-M-x))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package avy
  :bind ("C-=" . avy-goto-char))

(use-package expand-region)

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package crux
  :bind (("C-k" . crux-smart-kill-line)
         ("C-a" . crux-move-beginning-of-line)
         ("C-c n" . crux-cleanup-buffer-or-region)
         ("C-c f" . crux-recentf-find-file)))

(use-package smartparens
  :init
  (require 'smartparens-config))


(use-package doom-themes
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (load-theme 'doom-one-light t t))

(use-package solaire-mode
  :config
  (solaire-global-mode +1))

(use-package project)

(provide 'rc)

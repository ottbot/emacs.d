;;; rc.el --- Personal Package -*- lexical-binding: t -*-

(setq custom-file "~/.emacs.d/lisp/custom.el")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(require 'project)

(defalias 'yes-or-no-p 'y-or-n-p)

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(use-package dash)

(use-package info-look
  :no-require t
  :config
  (dash-register-info-lookup))

(use-package unkillable-scratch)

(use-package diminish
  :config
  (diminish 'eldoc-mode))

(use-package ivy
  :diminish)

(use-package ivy-hydra)
(use-package ivy-prescient)

(use-package swiper)

(use-package company
  :diminish
  :config
  (global-company-mode))

(use-package which-key
  :diminish
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
  :bind ("C-x o" . ace-window)
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-scope 'frame))

(use-package crux
  :bind (("C-k" . crux-smart-kill-line)
         ("C-a" . crux-move-beginning-of-line)
         ("C-c n" . crux-cleanup-buffer-or-region)
         ("C-c f" . crux-recentf-find-file)))

(use-package smartparens
  :diminish
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

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq frame-resize-pixelwise t)
  (setq mouse-sel-mode t))

(require 'ansi-color)

(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)


(provide 'rc)

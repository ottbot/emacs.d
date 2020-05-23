;;; rc-common -- packages most things want
;;; commentary:
;;; code:

(require 'rc-funs)

(use-package undo-tree)

(use-package diminish)

(use-package bind-key)

(use-package spacemacs-theme
  :defer t
  :init
  (rc/init-theme-ring '(spacemacs-light spacemacs-dark)))

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package avy
  :chords (("jj" . avy-goto-char)
           ("jk" . avy-goto-char-2)
           ("jl" . avy-goto-line)))

(use-package counsel)

(use-package ivy
  :diminish ivy-mode
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :bind (("M-x" . counsel-M-x)
         ("C-s" . swiper)
         ("C-r" . swiper))
  :config
  (ivy-mode 1))

(use-package crux
  :config
  (global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line))

(use-package company
  :diminish company-mode
  :chords ("[tab][tab]" . company-complete)
  :config (global-company-mode))

(use-package company-quickhelp)

(use-package unkillable-scratch
  :commands unkillable-scratch-buffer
  :custom
  (unkillable-scratch-behaviour 'bury))

(use-package flycheck
  :diminish flycheck-mode
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (global-flycheck-mode))

(use-package magit
  :config
  (bind-key "C-x g" 'magit))

(use-package electric)

(provide 'rc-common)
;;; rc-common.el ends here

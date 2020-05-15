
;; ⊂(◉‿◉)つ

;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc-straight)
(require 'rc-funs)
(require 'rc-defaults)

(use-package undo-tree)
(use-package diminish)
(use-package bind-key)

(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-dark t))

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package avy
  :bind (("C-:" . avy-goto-char-2)
         ("C-'" . avy-goto-char)))

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
  :bind ("<C-tab>" . company-complete)
  :config
  (global-company-mode))

(use-package company-quickhelp)

(use-package unkillable-scratch
  :config
  (unkillable-scratch-buffer t)
  :custom
  (unkillable-scratch-behaviour 'bury))

(use-package flycheck
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (global-flycheck-mode))


(use-package magit)

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-cleanup-known-projects)
  (projectile-global-mode))

(use-package electric)

(use-package cider)

(use-package clojure-mode)

(use-package paredit
  :diminish paredit-mode
  :bind (:map paredit-mode-map
	      ("C-c <right>" . paredit-forward-slurp-sexp)
	      ("C-c <left>" . paredit-forward-barf-sexp)
	      ("C-j" . 'eval-last-sexp))
  :hook ((emacs-lisp-mode clojure-mode dune-mode) . enable-paredit-mode))

(defun rc/opam-bin-path ()
  "Get the path for binaries installed by opam."
  (replace-regexp-in-string
   "\n\\'" ""
   (shell-command-to-string "opam config var bin --safe")))

(rc/add-path (rc/opam-bin-path))

(defun rc/opam-bin (cmd)
  "Prefix your CMD with the path for opam bin."
  (concat (opam-bin-path) "/" cmd))

(defun rc/tuareg-hooks ()
  "The hooks for tuareg."
  (merlin-mode)
  (utop-minor-mode)
  (electric-pair-local-mode))

(use-package merlin
  :config
  (setq merlin-completion-with-doc t))

(use-package caml
  :config
  (add-hook 'caml-mode-hook 'merlin-mode))

(use-package dune)

(use-package utop
  :config
  (setq utop-command "dune utop . -- -emacs"))

(use-package tuareg
  :config
  (add-hook 'tuareg-mode-hook 'rc/tuareg-hooks))

(use-package reason-mode)

(use-package ocp-indent)

(use-package web-mode)

;;   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ
;;------------------------------------------------------------------------
;;; init.el ends here


;; ⊂(◉‿◉)つ

;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'rc-straight)
(require 'rc-funs)
(require 'rc-defaults)

(require 'rc-ocaml)

(use-package undo-tree)
(use-package diminish)
(use-package bind-key)

(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-light t))

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
  (unkillable-scratch-buffer)
  :custom
  (unkillable-scratch-behaviour 'bury))

(use-package flycheck
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (global-flycheck-mode))


(use-package magit)

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

(use-package web-mode)

(use-package json-mode
  :config
  (setq js-indent-level 2))

;;   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ
;;------------------------------------------------------------------------
;;; init.el ends here

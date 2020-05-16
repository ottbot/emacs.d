
;; ⊂(◉‿◉)つ

;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'rc-package)
(require 'rc-funs)
(require 'rc-defaults)

(require 'rc-ocaml)

(use-package undo-tree
  :ensure t)

(use-package diminish
  :ensure t)

(use-package bind-key
  :ensure t)

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-light t))

(use-package ace-window
  :ensure t
  :bind ("C-x o" . ace-window))

(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-char-2)
         ("C-'" . avy-goto-char)))

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
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
  :ensure t
  :config
  (global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line))

(use-package company
  :ensure t
  :bind ("<C-tab>" . company-complete)
  :config
  (global-company-mode))

(use-package company-quickhelp
  :ensure t)

(use-package unkillable-scratch
  :ensure t
  :config
  (unkillable-scratch-buffer)
  :custom
  (unkillable-scratch-behaviour 'bury))

(use-package flycheck
  :ensure t
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (global-flycheck-mode))

(use-package magit
  :ensure t
  :config
  (bind-key "C-x g" 'magit))

(use-package electric
  :ensure t)

(use-package paredit
  :ensure t
  :diminish paredit-mode
  :bind (:map paredit-mode-map
	      ("C-c <right>" . paredit-forward-slurp-sexp)
	      ("C-c <left>" . paredit-forward-barf-sexp)
	      ("C-j" . 'eval-last-sexp))
  :hook ((emacs-lisp-mode clojure-mode dune-mode) . enable-paredit-mode))

(use-package web-mode
  :ensure t)

(use-package json-mode
  :ensure t
  :config
  (setq js-indent-level 2))


;;   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ
;;------------------------------------------------------------------------
;;; init.el ends here

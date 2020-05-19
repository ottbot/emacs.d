;;; rc-common -- packages most things want
;;; commentary:
;;; code:

(require 'rc-funs)

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
  (rc/init-theme-ring '(spacemacs-light spacemacs-dark)))

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
  :commands unkillable-scratch-buffer
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

(provide 'rc-common)
;;; rc-common.el ends here

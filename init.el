;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for base / keep ## emacs this line

(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)

(use-package flycheck)

(use-package tuareg)

(use-package dune)

(use-package parinfer-rust-mode
  :hook ((emacs-lisp-mode scheme-mode dune-mode) . parinfer-rust-mode))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (tuareg-mode . lsp))
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy :commands lsp-ivy-workplace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(load custom-file)

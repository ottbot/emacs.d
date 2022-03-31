;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)


;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(use-package tuareg
  :after (lsp)
  :hook (tuareg-mode . lsp))

(load custom-file)

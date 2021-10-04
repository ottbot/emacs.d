;; ⊂(◉‿◉)つ
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc-base)
(require 'rc-look)

(setq user-full-name "Robert Crim"
      user-mail-address "rob@servermilk.com")

(rc/the-look "JetBrains Mono-13")

(require 'rc-lsp)
(require 'rc-lisps)

(rc/sup 'rust-mode)
(rc/sup 'ein)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(require 'rc-ocaml)

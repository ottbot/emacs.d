;; ⊂(◉‿◉)つ
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc-base)
(require 'rc-fancy)

(setq user-full-name "Robert Crim"
      user-mail-address "rob@servermilk.com")


(rc/sup '(nano-theme :type git :host github
                     :repo "rougier/nano-theme"))
(require 'nano-theme)
(nano-dark)
(nano-setup)

(set-frame-font "Roboto Mono" nil t)

(server-start)

(require 'rc-lsp)
(require 'rc-lisps)

(rc/sup 'rust-mode)
(rc/sup 'ein)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(require 'rc-ocaml)

(defun rc/vterm-is-active ()
  (string-equal "*vterm*" (buffer-name)))

(defun rc/toggle-vterm ()
  (interactive)
  (if (rc/vterm-is-active)
    (bury-buffer)
    (vterm)))

(rc/global-key '("s-w" . bury-buffer))

(rc/global-key '("s-t" . rc/toggle-vterm))

;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(rc-sup 'doom-themes)

(require 'doom-themes)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)

(doom-themes-visual-bell-config)
(doom-themes-org-config)

(rc-sup 'solaire-mode)
(solaire-global-mode +1)

(rc-sup 'project)
(rc-sup 'geiser-chez)

(-each '(scheme-mode-hook emacs-lisp-mode-hook)
  (lambda (some-mode-hook)
    (add-hook some-mode-hook
              'parinfer-rust-mode)))


;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(-each '(tuareg utop dune merlin-company merlin-iedit)
  (lambda (pkg)
    (rc-sup pkg)))

(load custom-file)

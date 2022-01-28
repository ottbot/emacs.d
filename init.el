;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(rc-sup 'doom-themes)


(require 'doom-themes)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)

(load-theme 'doom-one t)

(doom-themes-visual-bell-config)
(doom-themes-org-config)

(rc-sup 'solaire-mode)
(solaire-global-mode +1)

(rc-sup 'project)
(rc-sup 'geiser-chez)
(rc-sup 'racket-mode)

(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)

(-each '(racket-mode-hook emacs-lisp-mode-hook)
  (lambda (some-mode-hook)
    (add-hook some-mode-hook
              'parinfer-rust-mode)))

(load custom-file)

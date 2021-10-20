;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(-each
   '(solaire-mode doom-themes)
   'rc-sup)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(rc-set-themes 'doom-one-light 'doom-city-lights)

(doom-themes-visual-bell-config)

(setq doom-themes-treemacs-theme "doom-colors")

(doom-themes-treemacs-config)
(doom-themes-org-config)

(set-frame-font "JetBrains Mono-14")

(rc-sup 'racket-mode)

(rc-sup 'clojure-mode)

(rc-sup 'inf-clojure)

(rc-sup 'swift-mode)

(rc-sup 'lsp-sourcekit)

(eval-after-load 'lsp-mode
  (progn
    (require 'lsp-sourcekit)

    (setq lsp-sourcekit-executable
          (string-trim
           (shell-command-to-string "xcrun --find sourcekit-lsp")))))

(add-hook 'swift-mode-hook 'lsp)

(-each '(clojure-mode-hook
         racket-mode-hook
         emacs-lisp-mode-hook)

  (lambda (some-hook)
    (add-hook some-hook
              'parinfer-rust-mode)))

(rc-sup 'rust-mode)
(rc-sup 'ein)

(load custom-file)

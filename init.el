;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(rc-sup 'doom-themes)

(set-frame-font "JetBrains Mono-10")

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(load-theme 'doom-city-lights t)

(-each '(emacs-lisp-mode-hook)
  (lambda (some-mode-hook)
    (add-hook some-mode-hook
              'parinfer-rust-mode)))

;; scheme!

(load custom-file)

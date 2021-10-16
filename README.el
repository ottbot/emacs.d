(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(defalias 'yes-or-no-p 'y-or-n-p)

(-each
    '((smartparens)
      (unkillable-scratch)
      (ivy)
      (swiper)
      (ivy-hydra)
      (ivy-prescient)
      (company)
      (which-key)
      (writeroom-mode)
      (treemacs)
      (all-the-icons)
      (parinfer-rust-mode)
      (vterm         ("s-t" rc-toggle-vterm))
      (counsel       ("M-x" counsel-M-x))
      (magit         ("C-x g" magit-status))
      (avy           ("C-=" avy-goto-char))
      (expand-region ("M-m" er/expand-region))
      (ace-window    ("C-x o" ace-window))
      (crux          ("C-k" crux-smart-kill-line
                      "C-c n" crux-cleanup-buffer-or-region
                      "C-c f" crux-recentf-find-file
                      "C-a" crux-move-beginning-of-line)))
  (-lambda ((pkg kb))
    (rc-sup pkg :bind-global kb)))

(require 'smartparens-config)
(setq parinfer-rust-library "~/.emacs.d/parinfer-rust/libparinfer_rust.dylib")
(add-hook 'after-init-hook 'which-key-mode)
(add-hook 'after-init-hook 'global-company-mode)

(rc-global-key "s-w" 'winner-undo)

(rc-global-key "s-t" 'rc-toggle-vterm)

(-each
     '(feebleline
       diminish
       solaire-mode
       doom-themes)
   'rc-sup)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(rc-set-themes 'doom-one-light 'doom-city-lights)

(doom-themes-visual-bell-config)

(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(doom-themes-org-config)

(-each
    '(ivy-mode
      which-key-mode
      company-mode
      eldoc-mode)
  'diminish)

(progn
  (-each '(lsp-mode
           lsp-ivy
           lsp-ui
           lsp-treemacs)
    'rc-sup))

(rc-sup 'racket-mode)

(rc-sup 'clojure-mode)

(rc-sup 'inf-clojure)

(-each '(clojure-mode-hook
         racket-mode-hook
         emacs-lisp-mode-hook)
  (lambda (some-hook)
    (add-hook some-hook
              'parinfer-rust-mode)))

(rc-sup 'rust-mode)
(rc-sup 'ein)

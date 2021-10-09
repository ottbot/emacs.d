;; ⊂(◉‿◉)つ
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

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
      (parinfer-rust-mode)
      (vterm         ("s-t" rc/toggle-vterm))
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
    (rc/sup pkg :bind-global kb)))


(-each
    '(feebleline
      diminish
      solaire-mode
      (nano-theme :type git :host github :repo "rougier/nano-theme"))
    'rc/sup)

(require 'nano-theme)

(set-frame-font "JetBrains Mono-14")

(solaire-global-mode 't)
(feebleline-mode 't)

(rc/apply-system-appearance ns-system-appearance)

(require 'smartparens-config)
(smartparens-global-mode 1)

(setq avy-background t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(global-hl-line-mode +1)
(column-number-mode t)
(size-indication-mode t)

;; macos stuff
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq inhibit-startup-screen t)

(ivy-mode 1)
(ivy-prescient-mode t)

(add-hook 'after-init-hook 'which-key-mode)
(add-hook 'after-init-hook 'global-company-mode)

(rc/sup 'rust-mode)
(rc/sup 'ein)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line


(progn
  (-each '(lsp-mode
           lsp-ivy
           lsp-ui
           treemacs
           all-the-icons
           lsp-treemacs)
         'rc/sup)

  (setq lsp-enable-symbol-highlighting nil
        lsp-ui-doc-show-with-cursor nil
        lsp-ui-doc-show-with-mouse nil
        lsp-headerline-breadcrumb-enable nil
        lsp-enable-snippet nil
        lsp-lens-enable nil
        lsp-eldoc-enable-hover nil
        lsp-modeline-code-actions-enable nil
        lsp-modeline-diagnostics-enable nil
        lsp-signature-auto-activate nil
        lsp-signature-render-documentation nil)

  (setq lsp-ui-doc-show-with-mouse t
        lsp-signature-auto-activate t)

  (lsp-treemacs-sync-mode 1))


(require 'dune nil 'noerror)

(defun rc/tuareg-mode-hook ()
  (setq lsp-diagnostics-provider :none)
  (lsp-deferred))

(add-hook 'tuareg-mode-hook 'rc/tuareg-mode-hook)

(when (require 'utop nil 'noerror)
  (rc/bind-keys
   utop-mode-map
   '("C-p" utop-history-goto-prev
     "C-n" utop-history-goto-next)))


(-each '(dune-mode-hook emacs-lisp-mode-hook)
  (lambda (hook)
    (add-hook hook 'parinfer-rust-mode)))

(setq parinfer-rust-library
      "~/.emacs.d/parinfer-rust/libparinfer_rust.dylib")

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
      (treemacs)
      (all-the-icons)
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

(rc/apply-system-appearance ns-system-appearance)

(rc/global-key "s-w" 'winner-undo)

(add-hook 'after-init-hook 'which-key-mode)
(add-hook 'after-init-hook 'global-company-mode)


;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line


(progn
  (-each '(lsp-mode
           lsp-ivy
           lsp-ui
           lsp-treemacs)
         'rc/sup))


(rc/sup 'rust-mode)
(rc/sup 'ein)

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


(rc/load-custom)

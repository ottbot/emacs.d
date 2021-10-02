(require 'rc-base)

(rc/sup 'fzf)

(progn
  (rc/sup 'magit)
  (rc/global-key '("C-x g" . magit-status)))

(progn
 (rc/sup 'smartparens)
 (require 'smartparens-config)
 (smartparens-global-mode 1)
 (show-paren-mode t))

(rc/sup 'vterm)
(rc/sup 'unkillable-scratch)
(rc/sup 'emojify)

(progn
  (rc/sup 'solaire-mode)
  (solaire-global-mode +1))



(progn
  (rc/sup 'diminish)
  (diminish 'smartparens-mode))

(progn
 (rc/sup 'expand-region)
 (rc/global-key '("M-m" . er/expand-region)))

(progn
  (rc/sup 'feebleline)
  (feebleline-mode 't))

(progn
  (rc/sup 'avy)
  (rc/global-key '("C-=" . avy-goto-char))
  (setq avy-background t))


(progn
  (dolist (pkg (list 'ivy 'counsel 'swiper 'ivy-hydra 'ivy-prescient))
    (rc/sup pkg))
  (ivy-mode 1)
  (ivy-prescient-mode t)
  (rc/global-key '("M-x" . counsel-M-x)))


(progn
  (rc/sup 'company)
  (add-hook 'after-init-hook #'global-company-mode))


(progn
  (rc/sup 'which-key)
  (add-hook 'after-init-hook 'which-key-mode))

(progn
  (rc/sup 'ace-window)
  (rc/global-key '("C-x o" . ace-window)))




(provide 'rc-fancy)

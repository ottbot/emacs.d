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
  (rc/sup 'doom-themes)
  (rc/sup 'solaire-mode)
  (solaire-global-mode +1)

 (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
       doom-themes-enable-italic t) ; if nil, italics is universally disabled

 (doom-themes-visual-bell-config)
 (doom-themes-org-config)

 (doom-themes-visual-bell-config))

(setq-default rc/dark-theme 'doom-one
              rc/light-theme 'doom-one-light)

(defun rc/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme rc/light-theme t))
    ('dark (load-theme rc/dark-theme t))))

(defun rc/set-current-theme ()
  (rc/apply-theme ns-system-appearance))

(add-hook 'ns-system-appearance-change-functions #'rc/apply-theme)

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

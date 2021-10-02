(defalias 'rc/sup 'straight-use-package "RC's Straight Use Package")

(defun rc/global-key (kpair)
  (global-set-key (kbd (car kpair)) (cdr kpair)))


;; don't persist customizations in init
(setq custom-file "~/.emacs.d/custom.el")

(global-auto-revert-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
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

;; (progn
;;   (rc/sup 'feebleline)
;;   (feebleline-mode 't))

(progn
  (rc/sup 'avy)
  (rc/global-key '("C-=" . avy-goto-char))
  (setq avy-background t))

(progn
  (dolist (pkg (list 'ivy 'counsel 'smex 'swiper 'ivy-hydra 'ivy-prescient))
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

(progn
  (straight-use-package 'crux)

  (let ((crux-keys '(("C-k" . crux-smart-kill-line)
                     ("C-c n" . cruz-cleanup-buffer-or-region)
                     ("C-c n" . crux-cleanup-buffer-or-region)
                     ("C-c f" . crux-recentf-find-file)
                     ("C-a" . crux-move-beginning-of-line))))

    (dolist (kb crux-keys)
      (rc/global-key kb))))


(defun rc/vterm-is-active ()
  (string-equal "*vterm*" (buffer-name)))

(defun rc/toggle-vterm ()
  (interactive)
  (if (rc/vterm-is-active)
    (bury-buffer)
    (vterm)))

(rc/global-key '("s-w" . bury-buffer))

(rc/global-key '("s-t" . rc/toggle-vterm))

(provide 'rc-base)

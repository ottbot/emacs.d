(defalias 'rc/sup 'straight-use-package "RC's Straight Use Package")

(defun rc/global-key (kpair)
  (global-set-key (kbd (car kpair)) (cdr kpair)))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; don't persist customizations here
(setq custom-file "~/.emacs.d/custom.el")

;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 5)

(setq-default indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode)

(recentf-mode 1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq ring-bell-function 'ignore)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(rc/sup 'fzf)
(rc/sup 'vterm)
(rc/sup 'unkillable-scratch)


(defun rc/vterm-is-active ()
  (string-equal "*vterm*" (buffer-name)))

(defun rc/toggle-vterm ()
  (interactive)
  (if (rc/vterm-is-active)
    (bury-buffer)
    (vterm)))

(rc/global-key '("s-w" . bury-buffer))
(rc/global-key '("s-t" . rc/toggle-vterm))


(progn
  (straight-use-package 'crux)

  (let ((crux-keys '(("C-k" . crux-smart-kill-line)
                     ("C-c n" . crux-cleanup-buffer-or-region)
                     ("C-c f" . crux-recentf-find-file)
                     ("C-a" . crux-move-beginning-of-line))))

    (dolist (kb crux-keys)
      (rc/global-key kb))))

(progn
  (rc/sup 'magit)
  (rc/global-key '("C-x g" . magit-status)))

(progn
 (rc/sup 'expand-region)
 (rc/global-key '("M-m" . er/expand-region)))


(progn
 (rc/sup 'smartparens)
 (require 'smartparens-config)
 (smartparens-global-mode 1)
 (show-paren-mode t))


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


(provide 'rc-base)

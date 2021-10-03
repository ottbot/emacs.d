(defalias 'rc/sup 'straight-use-package "RC's Straight Use Package")

(defun rc/global-key (kpair)
  (global-set-key (kbd (car kpair)) (cdr kpair)))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; don't persist customizations here
(setq custom-file "~/.emacs.d/custom.el")

;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")) backup-by-copying t version-control t
      delete-old-versions t kept-new-versions 20 kept-old-versions 5)

(setq-default indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode)

;; macos stuff
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(recentf-mode 1)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(global-hl-line-mode +1)
(column-number-mode t)
(size-indication-mode t)

(setq inhibit-startup-screen t)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq ring-bell-function 'ignore)

(add-hook 'before-save-hook 'delete-trailing-whitespace)


(progn
  (straight-use-package 'crux)

  (let ((crux-keys '(("C-k" . crux-smart-kill-line)
                     ("C-c n" . cruz-cleanup-buffer-or-region)
                     ("C-c n" . crux-cleanup-buffer-or-region)
                     ("C-c f" . crux-recentf-find-file)
                     ("C-a" . crux-move-beginning-of-line))))

    (dolist (kb crux-keys)
      (rc/global-key kb))))

(provide 'rc-base)

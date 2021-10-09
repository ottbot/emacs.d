(defun rc/global-key (key cmd)
  (global-set-key (kbd key) cmd))

(defun rc/each-pair (lst fn)
  (-each (-partition 2 lst)
    (-applify fn)))

(defun rc/global-keys (keycmds)
  (rc/each-pair keycmds #'rc/global-key))

(defun rc/bind-key (mode-map key cmd)
  (define-key mode-map (kbd key) cmd))

(defun rc/key-binder (mode-map)
  #'(lambda (key cmd)
     (rc/bind-key mode-map key cmd)))

(defun rc/bind-keys (mode-map keycmds)
  (rc/each-pair keycmds (rc/key-binder mode-map)))

(defun rc/append-sym (sym suffix)
  (intern
   (->
     (symbol-name sym)
     (concat suffix))))

(defun rc/bind-keys (&rest opts)
  (-when-let ((&plist :global ks))
    (rc/global-keys ks))
  (-when-let ((&plist :local (mode-map ks)))
    (rc/bind-keys mode-map ks)))


(defun rc/sup (pkg &rest opts)
  (straight-use-package pkg)

  (-when-let ((&plist :global ks) opts)
    (rc/bind-keys ks))

  (-when-let ((&plist :setup fn) opts)
    (fn)))


(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; don't persist customizations in init.el, innit
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

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


(rc/sup 'dash :setup
        #'(lambda ()
            (global-dash-fontify-mode t)

            (with-eval-after-load 'info-look
              (dash-register-info-lookup))))

(setq truncate-partial-width-windows 't)



(rc/sup 'crux
        :bind '(:global ("C-k" crux-smart-kill-line
                         "C-c n" crux-cleanup-buffer-or-region
                         "C-c f" crux-recentf-find-file
                         "C-a" crux-move-beginning-of-line)))

(progn
  (rc/sup 'magit)
  (rc/global-key "C-x g" 'magit-status))

(progn
 (rc/sup 'expand-region)
 (rc/global-key "M-m" 'er/expand-region))

(progn
 (rc/sup 'smartparens)
 (require 'smartparens-config)
 (smartparens-global-mode 1)
 (show-paren-mode t))

(progn
  (rc/sup 'avy)
  (rc/global-key "C-=" avy-goto-char)
  (setq avy-background t))

(progn
  (dolist (pkg (list 'ivy 'counsel 'swiper 'ivy-hydra 'ivy-prescient))
    (rc/sup pkg))
  (ivy-mode 1)
  (ivy-prescient-mode t)
  (rc/global-key "M-x" counsel-M-x))

(progn
  (rc/sup 'company)
  (add-hook 'after-init-hook #'global-company-mode))

(progn
  (rc/sup 'which-key)
  (add-hook 'after-init-hook 'which-key-mode))

(progn
  (rc/sup 'ace-window)
  (rc/global-key "C-x o" ace-window))

(defun rc/vterm-is-active ()
  (string-equal "*vterm*" (buffer-name)))

(defun rc/toggle-vterm ()
  (interactive)
  (if (rc/vterm-is-active)
    (bury-buffer)
    (vterm)))

(progn
  (setq winner-dont-bind-my-keys t)
  (winner-mode t)
  (rc/global-key "s-w" winner-undo)
  (rc/global-key "s-t" rc/toggle-vterm))

(provide 'rc-base)

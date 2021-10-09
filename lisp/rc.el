(progn
  (straight-use-package 'dash)
  (global-dash-fontify-mode t)
  (with-eval-after-load 'info-look
    (dash-register-info-lookup)))


(defun rc/global-key (key cmd)
  (global-set-key (kbd key) cmd))


(defun rc/each-pair (lst fn)
  (-each (-partition 2 lst)
    (-applify fn)))


(defun rc/global-keys (keycmds)
  (rc/each-pair keycmds 'rc/global-key))


(defun rc/bind-key (mode-map key cmd)
  (define-key mode-map (kbd key) cmd))


(defun rc/key-binder (mode-map)
  #'(lambda (key cmd)
     (rc/bind-key mode-map key cmd)))


(defun rc/bind-keys (mode-map keycmds)
  (rc/each-pair keycmds (rc/key-binder mode-map)))


(defun rc/sup (pkg &rest opts)
  (straight-use-package pkg)

  (-when-let ((&plist :bind-global ks) opts)
    (rc/global-keys ks))

  (-when-let ((&plist :bind-local ks))
    (-> (symbol-name pkg)
        (concat "-map")
        (intern)
        (rc/bind-keys ks))))

(defun rc/toggle-vterm ()
  (interactive)
  (if (string-equal "*vterm*" (buffer-name))
    (bury-buffer)
    (vterm)))


(defun rc/apply-system-appearance (appearance)
  "Set up themes, etc, as system appearance changes from 'light to 'dark"
  (setq frame-background-mode appearance)
  (mapc #'disable-theme custom-enabled-themes)
  (mapc #'frame-set-background-mode (frame-list))
  (pcase appearance
    ('light (nano-light))
    ('dark (nano-dark))))

(add-hook 'ns-system-appearance-change-functions
          'rc/apply-system-appearence)

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

(setq truncate-partial-width-windows 't)

(progn
  (setq winner-dont-bind-my-keys t)
  (winner-mode t)
  (rc/global-key "s-w" 'winner-undo))

(provide 'rc)

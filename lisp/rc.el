(setq custom-file "~/.emacs.d/lisp/custom.el")

(defalias 'yes-or-no-p 'y-or-n-p)

(straight-use-package 'dash)

(require 'dash)

(with-eval-after-load 'info-look
  (dash-register-info-lookup))

(defun rc/load-custom ()
  (load custom-file))

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

(provide 'rc)

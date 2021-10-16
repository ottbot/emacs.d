;;; rc.el --- Personal Package -*- lexical-binding: t -*-

(straight-use-package 'dash)

(require 'dash)

(with-eval-after-load 'info-look
  (dash-register-info-lookup))

(defun rc-global-key (key cmd)
  (global-set-key (kbd key) cmd))

(defun rc-each-pair (lst fn)
  (-each (-partition 2 lst)
    (-applify fn)))

(defun rc-global-keys (keycmds)
  (rc-each-pair keycmds 'rc-global-key))

(defun rc-bind-key (mode-map key cmd)
  (define-key mode-map (kbd key) cmd))

(defun rc-key-binder (mode-map)
  #'(lambda (key cmd)
     (rc-bind-key mode-map key cmd)))

(defun rc-bind-keys (mode-map keycmds)
  (rc-each-pair keycmds (rc-key-binder mode-map)))


(defun rc-sup (pkg &rest opts)
  (straight-use-package pkg)

  (-when-let ((&plist :bind-global ks) opts
              (rc-global-keys ks))

   (-when-let ((&plist :bind-local ks))
     (-> (symbol-name pkg)
         (concat "-map")
         (intern)
         (rc-bind-keys ks))))

 (defun rc-toggle-vterm ()
   (interactive)
   (if (string-equal "*vterm*" (buffer-name))
     (bury-buffer)
     (vterm)))

 (defvar rc-themes nil "A plist with 'light and 'dark themes to use")

 (defun rc-get-theme (appearance)
   (plist-get rc-themes appearance))

 (defun rc-set-themes (light-theme dark-theme)
   (setq rc-themes (list 'light light-theme 'dark dark-theme))
   (rc-set-theme ns-system-appearance))

 (defun rc-set-theme (appearance)
   (interactive)

   (setq frame-background-mode appearance)

   (mapc #'disable-theme custom-enabled-themes)
   (mapc #'frame-set-background-mode (frame-list))

   (load-theme (rc-get-theme appearance))) t t)

(add-hook 'ns-system-appearance-change-functions 'rc-set-theme)

(provide 'rc)

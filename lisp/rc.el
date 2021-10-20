;;; rc.el --- Personal Package -*- lexical-binding: t -*-

(straight-use-package 'dash)

(require 'dash)

(setq custom-file "~/.emacs.d/lisp/custom.el")

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
              (rc-global-keys ks)))

  (-when-let ((&plist :bind-local ks))
    (-> (symbol-name pkg
         (concat "-map")
         (intern)
         (rc-bind-keys ks)))))

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

  (load-theme (rc-get-theme appearance) t t))

(add-hook 'ns-system-appearance-change-functions
          'rc-set-theme)

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(defalias 'yes-or-no-p 'y-or-n-p)

(-each
    '((smartparens)
      (unkillable-scratch)
      (ivy)
      (swiper)
      (ivy-hydra)
      (ivy-prescient)
      (diminish)
      (feebleline)
      (lsp-mode)
      (lsp-ivy)
      (lsp-ui)
      (lsp-treemacs)
      (company)
      (which-key)
      (writeroom-mode)
      (treemacs)
      (all-the-icons)
      (parinfer-rust-mode)
      (vterm         ("s-t" rc-toggle-vterm))
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
    (rc-sup pkg :bind-global kb)))

(require 'smartparens-config)

(setq parinfer-rust-library "~/.emacs.d/parinfer-rust/libparinfer_rust.dylib")

(--each '(which-key-mode
          global-company-mode)
    (add-hook 'after-init-hook it))

(rc-global-key "s-w" 'winner-undo)

(rc-global-key "s-t" 'rc-toggle-vterm)

(-each
    '(ivy-mode
      which-key-mode
      company-mode
      eldoc-mode)
  'diminish)

(provide 'rc)

;;; rc-defaults -- the settings
;;; commentary:
;;; code:

(require 'rc-funs)
(require 'ansi-color)

(set-frame-font
 (font-spec :family "Source Code Pro" :size 14 :antialias t)
 t t)

(rc/set-emoji-font nil)

(setq custom-file (make-temp-file "emacs-custom.el"))

(rc/add-path "/usr/local/bin")

(global-display-line-numbers-mode)

(display-battery-mode)
(display-time-mode 1)
(fringe-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(tooltip-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(require 'uniquify)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default truncate-lines t)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(modify-syntax-entry ?_ "w")
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-auto-revert-mode 1)
(auto-compression-mode t)
(global-font-lock-mode t)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(transient-mark-mode 1)
(delete-selection-mode 1)
(recentf-mode 1)

(defvar ispell-program-name)
(defvar ispell-list-command)
(defvar display-line-numbers-type)
(defvar ansi-color-for-comint-mode)

(setq select-enable-clipboard t
      line-number-mode t
      column-number-mode t
      display-line-numbers-type t
      ansi-color-for-comint-mode t
      fill-column 80
      echo-keystrokes 0.1
      inhibit-startup-message t
      shift-select-mode nil
      uniquify-buffer-name-style 'forward
      frame-title-format '(buffer-file-name "%f" ("%b"))
      ring-bell-function 'ignore
      ispell-program-name "/usr/local/bin/aspell"
      ispell-list-command "list")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun rc/colorize-compilation-buffer ()
  "Colorize your compilation if needed."
  (when (eq major-mode 'compilation-mode)
    (ansi-color-apply-on-region compilation-filter-start (point-max))))

(add-hook 'compilation-filter-hook 'rc/colorize-compilation-buffer)

(provide 'rc-defaults)
;;; rc-defaults.el ends here

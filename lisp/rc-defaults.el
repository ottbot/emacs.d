(set-frame-font
 (font-spec :family "Source Code Pro" :size 24 :antialias t)
 t t)



(global-hl-line-mode)

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

(setq x-select-enable-clipboard t
      global-auto-revert-non-file-buffers t
      line-number-mode t
      column-number-mode t
      fill-column 80
      echo-keystrokes 0.1
      inhibit-startup-message t
      shift-select-mode nil
      uniquify-buffer-name-style 'forward
      frame-title-format '(buffer-file-name "%f" ("%b"))
      ring-bell-function 'ignore
      ispell-program-name "/usr/bin/aspell"
      ispell-list-command "list")

(provide 'rc-defaults)

(set-frame-font
 (font-spec :family "Source Code Pro" :size 24 :antialias t)
 t t)

(setq frame-title-format '(buffer-file-name "%f" ("%b"))
      ring-bell-function 'ignore
      ispell-program-name "/usr/bin/aspell"
      ispell-list-command "list")

(global-hl-line-mode)

(display-time-mode 1)
(fringe-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(tooltip-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(provide 'rc-defaults)

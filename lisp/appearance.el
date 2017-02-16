(load-theme 'leuven t)

(global-anzu-mode +1)

(global-hl-line-mode)

(display-time-mode 1)
(fringe-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq org-todo-keyword-faces
      '(("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))))

(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(set-frame-font
 (font-spec :family "Triplicate T3c" :size 20 :antialias t))

(provide 'appearance)

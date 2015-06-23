(load-theme 'smyx t)

(display-time-mode 1)
(fringe-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(powerline-vim-theme)

;; org-mode colors
(setq org-todo-keyword-faces
      '(("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(set-default-font "Inconsolata-22")

(provide 'appearance)

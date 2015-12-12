
(require 'powerline)
(require 'moe-theme)

(setq moe-theme-highlight-buffer-id t)

(powerline-moe-theme)
(moe-theme-set-color 'w/b)

(moe-dark)

;(load-theme 'smyx t)

(global-anzu-mode +1)

(display-time-mode 1)
(fringe-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)

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

;;(set-default-font "SourceCodePro-20")
(set-default-font "TriplicateT3c-22")



(set-frame-parameter nil 'fullscreen 'fullboth)

(provide 'appearance)

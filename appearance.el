;;(require 'powerline-my-theme)
;;(powerline-default-theme)

(load-theme 'noctilux t)

(display-time-mode 1)
(fringe-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight current line
(add-hook 'after-change-major-mode-hook
          '(lambda () (hl-line-mode (if (equal major-mode 'term-mode) 0 1))))


;; org-mode colors
(setq org-todo-keyword-faces
      '(("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))))


;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(set-mouse-color "#ffffff")

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(set-default-font "Inconsolata-14")
;;(set-default-font "-unknown-Dina-normal-normal-normal-*-13-*-*-*-c-*-iso10646-1")

(provide 'appearance)

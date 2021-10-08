(require 'rc-base)

(rc/sup 'feebleline)
(rc/sup 'diminish)
(rc/sup 'solaire-mode)

(rc/sup '(nano-theme :type git :host github
                     :repo "rougier/nano-theme"))

(require 'nano-theme)

;; macos stuff
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(global-hl-line-mode +1)
(column-number-mode t)
(size-indication-mode t)

(setq inhibit-startup-screen t)

(defun rc/apply-system-appearance (appearance)
  "Set up themes, etc, as system appearance changes from 'light to 'dark"
  (setq frame-background-mode appearance)
  (mapc #'disable-theme custom-enabled-themes)
  (mapc #'frame-set-background-mode (frame-list))
  (pcase appearance
    ('light (nano-light))
    ('dark (nano-dark))))

(add-hook 'ns-system-appearance-change-functions #'rc/apply-system-appearence)

(defun rc/look (font)
  (interactive)
  (set-frame-font font)
  (solaire-global-mode 't)
  (feebleline-mode 't)
  (rc/apply-system-appearance ns-system-appearance))


(provide 'rc-look)

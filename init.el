(use-package emacs
  :ensure nil
  :bind ("C-c I" . (lambda () (interactive) (find-file user-init-file)))
  :custom
  (menu-bar-mode nil)
  (tool-bar-mode nil)
  (scroll-bar-mode nil)
  (custom-file (expand-file-name "custom.el" (file-name-directory user-init-file)))
  (inhibit-startup-message 't)
  :config
  (load custom-file)
)

(use-package package
  :ensure nil
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize))

(use-package vterm
  :ensure t
  :bind ("s-t" . vterm)) ;; how to use super key in Blink.app ?








 

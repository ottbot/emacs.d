(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-background t)
 '(aw-ignored-buffers '(treemacs-mode "*Calc Trail*" " *LV*" "*compilation*"))
 '(backup-by-copying t)
 '(backup-directory-alist '(("." . "~/.emacs.d/backup")))
 '(before-save-hook '(delete-trailing-whitespace))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-minimum-prefix-length 1)
 '(compilation-scroll-output t)
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "e3b2bad7b781a968692759ad12cb6552bc39d7057762eefaf168dbe604ce3a4b" "3d54650e34fa27561eb81fc3ceed504970cc553cfd37f46e8a80ec32254a3ec3" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "584c03e1f1a5d552c24b4edcf4c441654440ca86227c7807d0e609c6878d0056" default))
 '(delete-old-versions t)
 '(extended-command-suggest-shorter nil)
 '(font-lock-global-modes '(not speedbar-mode))
 '(frame-background-mode 'light)
 '(global-auto-revert-mode t)
 '(global-dash-fontify-mode t)
 '(global-hl-line-mode t)
 '(global-prettify-symbols-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(ivy-prescient-mode t)
 '(kept-new-versions 20)
 '(kept-old-versions 5)
 '(lsp-lens-enable nil)
 '(lsp-ui-doc-show-with-mouse nil)
 '(lsp-ui-doc-use-webkit t)
 '(lsp-ui-imenu-auto-refresh t)
 '(menu-bar-mode nil)
 '(recentf-mode t)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 100000)
 '(scroll-preserve-screen-position 1)
 '(size-indication-mode t)
 '(smartparens-global-mode t)
 '(tab-always-indent 'complete)
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows t)
 '(tuareg-manual-url
   "file:///home/rob/.opam/mm-core/var/cache/odig/html/index.html")
 '(tuareg-other-file-alist
   '(("_intf.ml\\'"
      (".ml" ".mli"))
     ("\\.ml\\'"
      ("_intf.ml" ".mli"))
     ("\\.mli\\'"
      (".ml" ".mll" ".mly" ".pp.ml"))))
 '(winner-dont-bind-my-keys t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 120 :width normal :foundry "JB" :family "JetBrains Mono"))))
 '(message "set-faces, dummy")
 '(tuareg-font-lock-governing-face ((t (:weight bold)))))

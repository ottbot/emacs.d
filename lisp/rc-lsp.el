
(rc/sup 'lsp-mode)
(rc/sup 'lsp-ivy)
(rc/sup 'lsp-ui)

;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/

(setq lsp-enable-symbol-highlighting nil
      lsp-ui-doc-show-with-cursor nil
      lsp-ui-doc-show-with-mouse nil
      lsp-headerline-breadcrumb-enable nil
      lsp-enable-snippet nil
      lsp-lens-enable nil
      lsp-eldoc-enable-hover nil
      lsp-modeline-code-actions-enable nil
      lsp-modeline-diagnostics-enable nil
      lsp-signature-auto-activate nil
      lsp-signature-render-documentation nil)

(setq lsp-ui-doc-show-with-mouse t
      lsp-signature-auto-activate t)


(progn
 (rc/sup 'treemacs)
 (rc/sup 'all-the-icons)
 (rc/sup 'lsp-treemacs)
 (lsp-treemacs-sync-mode 1)
 (setq doom-themes-treemacs-theme "doom-colors")
 (doom-themes-treemacs-config))

(provide 'rc-lsp)

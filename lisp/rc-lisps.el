;;; rc-lisps.el --- things for lisps, like paredit
;;; Commentary:
;;; Code:

(use-package paredit
  :ensure t
  :diminish paredit-mode
  :bind (:map paredit-mode-map
	      ("C-c <right>" . paredit-forward-slurp-sexp)
	      ("C-c <left>" . paredit-forward-barf-sexp)
	      ("C-j" . 'eval-last-sexp))
  :hook ((emacs-lisp-mode clojure-mode dune-mode) . enable-paredit-mode))

(provide 'rc-lisps)
;;; rc-lisps.el ends here

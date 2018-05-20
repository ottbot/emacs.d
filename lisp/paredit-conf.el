(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(eval-after-load "paredit"
  '(progn (define-key paredit-mode-map (kbd "C-c <right>") 'paredit-forward-slurp-sexp)
          (define-key paredit-mode-map (kbd "C-c <left>") 'paredit-forward-barf-sexp)
          (define-key paredit-mode-map (kbd "C-j") 'eval-last-sexp)))

(provide 'paredit-conf)

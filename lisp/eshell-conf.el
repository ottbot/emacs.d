(require 'eshell-sensitive-conf) ;; variables not for vc
(setenv "NODE_NO_READLINE" "1")
(setenv "PAGER" "cat")
(setenv "LANG" "en_US.UTF8")
(setenv "EDITOR" "emacsclient")

(setq eshell-cmpl-cycle-completions nil
      eshell-history-size 20000
      eshell-save-history-on-exit t
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-output t
      eshell-scroll-show-maximum-output t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(eval-after-load 'esh-opt
  '(progn
     (require 'em-cmpl)
     (require 'em-prompt)
     (require 'em-term)
     ;; (add-hook 'eshell-mode-hook
     ;;           '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-visual-commands "top")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))))

;; (setq eshell-prompt-function
;;       (lambda nil
;;         (concat
;;          "[" (user-login-name) "@" (getenv "HOSTNAME") ":"
;;          (eshell/pwd)
;;          "]$ ")))

(defun eshell/clear ()
  "sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/ec (&rest args)
  "Use `compile' to do background makes."
  (if (eshell-interactive-output-p)
      (let ((compilation-process-setup-function
             (list 'lambda nil
                   (list 'setq 'process-environment
                         (list 'quote (eshell-copy-environment))))))
        (compile (eshell-flatten-and-stringify args))
        (pop-to-buffer compilation-last-buffer))
    (throw 'eshell-replace-command
           (let ((l (eshell-stringify-list (eshell-flatten-list args))))
             (eshell-parse-command (car l) (cdr l))))))

(put 'eshell/ec 'eshell-no-numeric-conversions t)

(provide 'eshell-conf)

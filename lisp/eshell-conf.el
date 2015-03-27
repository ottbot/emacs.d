(require 'eshell-sensitive-conf) ;; variables not for vc
(setenv "NODE_NO_READLINE" "1")
(setenv "PAGER" "cat")
(setenv "LANG" "en_US.UTF8")
(setenv "EDITOR" "emacsclient")

(setenv "DOCKER_HOST" "tcp://192.168.59.103:2376")
(setenv "DOCKER_CERT_PATH" "/Users/rob/.boot2docker/certs/boot2docker-vm")
(setenv "DOCKER_TLS_VERIFY" "1")


(setq eshell-cmpl-cycle-completions nil
      eshell-history-size 20000
      eshell-save-history-on-exit t
      eshell-hist-ignoredups t
      eshell-prefer-lisp-functions t
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

(defun tyler-eshell-view-file (file)
  "A version of `view-file' which properly respects the eshell prompt."
  (interactive "fView file: ")
  (unless (file-exists-p file) (error "%s does not exist" file))
  (let ((had-a-buf (get-file-buffer file))
        (buffer (find-file-noselect file)))
    (if (eq (with-current-buffer buffer (get major-mode 'mode-class))
            'special)
        (progn
          (switch-to-buffer buffer)
          (message "Not using View mode because the major mode is special"))
      (let ((undo-window (list (window-buffer) (window-start)
                               (+ (window-point)
                                  (length (funcall eshell-prompt-function))))))
        (switch-to-buffer buffer)
        (view-mode-enter (cons (selected-window) (cons nil undo-window))
                         'kill-buffer)))))

(defun eshell/less (&rest args)
  "Invoke `view-file' on a file. \"less +42 foo\" will go to line 42 in
    the buffer for foo."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
        (let* ((line (string-to-number (match-string 1 (pop args))))
               (file (pop args)))
          (tyler-eshell-view-file file)
          (goto-line line))
      (tyler-eshell-view-file (pop args)))))

(defalias 'eshell/more 'eshell/less)

(provide 'eshell-conf)

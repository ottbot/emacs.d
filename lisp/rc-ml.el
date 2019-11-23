;;; rc-ml.el --- summary

;;; Commentary:
;; This is a mess.. just need to get a move on, fix OCaml later

(defun yarn-cmd (cmd)
  "Return STDOUT from a yarn command (CMD), igoring errors."
  (car (ignore-errors
         (apply 'process-lines
                (split-string
                 (concat "~/.yarn/bin/" cmd))))))

(defvar merlin-command)
(defvar merlin-ac-setup)

;;; Code:
(use-package caml :ensure t)

(use-package reason-mode
  :ensure t
  :hook
  (reason-mode . (lambda ()
                   (add-hook 'before-save-hook 'refmt-before-save)
                   (merlin-mode)))
  :config
  (let* ((refmt-bin (yarn-cmd "refmt ----where"))
         (merlin-bin (yarn-cmd "ocamlmerlin ----where"))
         (merlin-base-dir (when merlin-bin
                          (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))

    (message "~~~>")
    (message merlin-bin)

    ;; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
    (when merlin-bin
      (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
      (setq merlin-command merlin-bin))

    (when refmt-bin
      (setq refmt-command refmt-bin)))

  (require 'merlin)

  (setq merlin-ac-setup t))


(use-package utop
  :custom
  (utop-edit-command nil)
  :hook
  (reason-mode . (lambda ()
                   (setq utop-command "rtop -emacs")
                   (setq utop-prompt
                         (lambda ()
                           (let ((prompt (format "rtop[%d]> " utop-command-number)))
                             (add-text-properties 0 (length prompt) '(face utop-prompt) prompt)
                             prompt)))
                   (utop-minor-mode))))




(provide 'rc-ml)
;;; rc-ml ends here

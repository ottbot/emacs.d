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

    ;; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
    (when merlin-bin
      (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
      (setq merlin-command merlin-bin))

    (when refmt-bin
      (setq refmt-command refmt-bin)))

  (require 'merlin)

  (setq merlin-ac-setup t))



(use-package tuareg
  :config
  (let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
    (when (and opam-share (file-directory-p opam-share))
      (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
      (autoload 'ocamlformat "ocamlformat" nil t nil)
      ;; Automatically start it in OCaml buffers


      (setq merlin-command 'opam)

      (add-hook 'tuareg-mode-hook (lambda ()
                                    (add-hook 'before-save-hook #'ocamlformat-before-save)
                                    (utop-minor-mode)
                                    (company-mode)
                                    (merlin-mode))))))

(use-package utop
  :custom
  (utop-edit-command nil))


(provide 'rc-ml)
;;; rc-ml ends here

;;; rc-ml.el --- summary
;;; Commentary:
;;; TODO: add support for reason.
;;; Code:


(defvar opam-bin "/usr/local/bin/opam")

(defun opam-exec (cmd)
  (concat
   opam-bin
   " exec -- "
   cmd))

(defun opam-bin-path ()
  (replace-regexp-in-string
   "\n\\'" ""
   (shell-command-to-string
    (concat opam-bin " config var bin --safe"))))

(defun opam-bin (cmd)
  (concat (opam-bin-path) "/" cmd))

(use-package caml :ensure t)

(use-package merlin
  :config
  (setq merlin-command (opam-bin "ocamlmerlin"))
  :hook
  (tuareg-mode . merlin-mode)
  (caml-mode . merlin-mode))

(use-package dune)

(use-package tuareg
  :hook
  (tuareg-mode . company-mode))

(use-package utop
  :config
  (setq utop-command (opam-exec "dune utop . -- -emacs"))
  :hook
  (tuareg-mode . utop-minor-mode))

(use-package ocp-indent
  :init
  (setq ocp-indent-path (opam-bin "/ocp-indent")))

(provide 'rc-ml)
;;; rc-ml ends here

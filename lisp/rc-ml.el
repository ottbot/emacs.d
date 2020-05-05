;;; rc-ml.el --- summary
;;; Commentary:
;;; Code:

(defun opam-exec (cmd)
  "Get string that prefixes CMD with absolute path fpr \"opam exec --\"."
  (concat "opam exec -- " cmd))

(defun opam-bin-path ()
  "Get the path for binaries installed by opam."
  (replace-regexp-in-string
   "\n\\'" ""
   (shell-command-to-string "opam config var bin --safe")))

(add-path (opam-bin-path))

(defun opam-bin (cmd)
  "Prefix your CMD with the path for opam bin."
  (concat (opam-bin-path) "/" cmd))

(use-package merlin)

(use-package caml
  :config
  (add-hook 'caml-mode-hook 'merlin-mode))

(use-package dune)

(use-package utop
  :config
  (setq utop-command "dune utop . -- -emacs"))

(defun rc/tuareg-hooks ()
  (merlin-mode)
  (utop-minor-mode)
  (electric-pair-local-mode))

(use-package tuareg
  :config
  (add-hook 'tuareg-mode-hook 'rc/tuareg-hooks))





(use-package ocp-indent)

(provide 'rc-ml)
;;; rc-ml ends here

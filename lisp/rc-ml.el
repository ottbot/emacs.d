;;; rc-ml.el --- summary
;;; Commentary:
;;; TODO: add support for reason.
;;; Code:
(use-package caml :ensure t)

(use-package merlin
  :hook
  (tuareg-mode . merlin-mode)
  (caml-mode . merlin-mode))

(use-package dune)

(use-package tuareg)

(use-package utop
  :hook
  (tuareg-mode . utop-minor-mode))


(provide 'rc-ml)
;;; rc-ml ends here

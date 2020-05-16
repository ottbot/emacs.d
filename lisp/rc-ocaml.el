;;; rc-ocaml -- summary
;;; commentary:
;;; Use opam for ocaml tooling
;;; code:

(require 'rc-funs)

(defun rc/opam-bin-path ()
  "Get the path for binaries installed by opam."
  (rc/shell-command-to-trimmed-string "opam config var bin --safe"))

(defun rc/opam-site-lisp-path ()
  "Get the path for opam's share dir."
  (concat
   (rc/shell-command-to-trimmed-string "opam config var share")
   "/emacs/site-lisp"))

(defun rc/bsb-project-path ()
  "Get the Bucklescript project root dir or nil."
  (locate-dominating-file default-directory "bsconfig.json"))

(defun rc/dune-project-path ()
  "Get the Dune project root dir or nil."
  (locate-dominating-file default-directory "dune-project"))

(defun rc/ocaml-compile ()
  "Use bsb, dune, or just interactively call compile."
  (interactive)
  (let ((bsb (rc/bsb-project-path))
        (dune (rc/dune-project-path)))
    (cond
     (bsb (rc/compile-in-dir bsb "bsb"))
     (dune (rc/compile-in-dir dune "dune build"))
     (t (call-interactively 'compile)))))

(defun rc/ocamlformat-before-save ()
  "A named function for the ocamlformat save hook."
  (add-hook 'before-save-hook 'ocamlformat-before-save))

(defun rc/ocaml-hooks ()
  "The hooks for tuareg."
  (merlin-mode)
  (utop-minor-mode)
  (electric-pair-local-mode)
  (ocamlformat-before-save))

;;; run setup --------------------
(rc/add-path (rc/opam-bin-path))
(add-to-list 'load-path (rc/opam-site-lisp-path))

(require 'merlin)
(setq-default merlin-completion-with-doc t)

(require 'dune)
(require 'tuareg)

(add-hook 'tuareg-mode-hook 'rc/ocaml-hooks)

(require 'ocamlformat)
(setq-default ocamlformat-enable 'enable-outside-detected-project
              ocamlformat-show-errors nil)

(require 'utop)
(setq-default utop-command "dune utop . -- -emacs")

(require 'ocp-indent)

(provide 'rc-ocaml)
;;; rc-ocaml.el ends here

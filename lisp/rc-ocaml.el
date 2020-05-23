;;; rc-ocaml -- it's for ocaml
;;; commentary:
;;; uses opam for package management
;;; code:

(require 'rc-funs)

(defun rc/opam-env ()
  "Shell out to get the current opam environment."
  (car
   (read-from-string
    (shell-command-to-string "opam config env --sexp"))))

(defun rc/sync-opam-env ()
  "Update the environment based on current opam switch.  Inlcudes $PATH."
  (interactive)
  (dolist (val (rc/opam-env))
    (setenv (car val) (cadr val)))
  (rc/sync-exec-path))

(defun rc/opam-lisp-path ()
  "Get the path for opam's share site-lisp dir."
  (concat
   (rc/shell-command-to-trimmed-string "opam config var share")
   "/emacs/site-lisp"))

(defun rc/current-opam-switch ()
  (interactive)
  (print (rc/shell-command-to-trimmed-string "opam config var switch")))

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

(defun rc/load-tuareg ()
  "Load the tuareg autoloads."
  (load (concat (rc/opam-lisp-path) "/tuareg-site-file")))

(defun rc/ocamlformat-before-save ()
  "A named function for the ocamlformat save hook."
  (add-hook 'before-save-hook 'ocamlformat-before-save))

(defun rc/tuareg-mode-hook ()
  "The hooks for tuareg."
  (rc/sync-opam-env)
  (merlin-mode)
  (setq mode-name "🐪")
  (setq-local auto-compile-command 'rc/ocaml-compile)
  (utop-minor-mode)
  (electric-pair-local-mode)
  (when (fboundp 'ocamlformat)
    (rc/ocamlformat-before-save)))


(defun rc/tuareg-load-hook ()
  "Stuff to load after tuareg is initialized."

  (require 'merlin)
  (require 'dune)
  (require 'ocamlformat "ocamlformat" t) ;; don't puke if not there
  (require 'utop)
  (require 'ocp-indent)

  (setq-default
   merlin-completion-with-doc t
   ocamlformat-enable 'enable-outside-detected-project
   ocamlformat-show-errors nil
   utop-command "dune utop . -- -emacs")

  (substitute-key-definition 'compile 'rc/ocaml-compile tuareg-mode-map))


(defun rc/tuareg-reload ()
  "Resync opam env and reload tuareg."
  (interactive)

  (rc/sync-opam-env)

  (remove-hook 'tuareg-mode-hook 'rc/tuareg-mode-hook)
  (remove-hook 'tuareg-load-hook 'rc/tuareg-load-hook)
  (add-hook 'tuareg-mode-hook 'rc/tuareg-mode-hook)
  (add-hook 'tuareg-load-hook 'rc/tuareg-load-hook)

  (diminish 'utop-minor-mode)
  (diminish 'merlin-mode "🧙‍")

  (rc/load-tuareg))


(rc/tuareg-reload)


(provide 'rc-ocaml)
;;; rc-ocaml.el ends here

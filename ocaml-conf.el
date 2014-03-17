
;; (autoload 'utop "utop" "Toplevel for OCaml" t)
;; (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)


;; Add OCP Indent
;; (add-to-list 'load-path (concat
;;                          (replace-regexp-in-string "\n$" ""
;;                                                    (shell-command-to-string "opam config var share"))
;;                          "/emacs/site-lisp"))
;; (require 'ocp-indent)

(eval-after-load "tuareg"
  (let ((opamdir (car (split-string (shell-command-to-string "opam config var share")))))
    (load-file (concat opamdir "/emacs/site-lisp/ocp-indent.el"))))



;; make OCaml-generated files invisible to filename completion
(mapc #'(lambda (ext) (add-to-list 'completion-ignored-extensions ext))
      '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi" ".cmxs" ".cmt" ".annot"))


(provide 'ocaml-conf)

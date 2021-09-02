
(defun rc/use-packages (pkgs)
  (dolist (p pkgs)
    (straight-use-package p)))


(rc/use-packages (list 'projectile 'counsel-projectile))

(require 'projectile)

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)




(provide 'dune-project)

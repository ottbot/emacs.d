;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for base / keep ## emacs this line

(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)

(use-package eldoc-overlay)

(use-package flycheck)

(use-package tuareg)

(use-package merlin-company)

(use-package merlin
  :diminish
  :init
  (require 'merlin-company)
  (add-hook 'caml-mode-hook #'merlin-mode)
  (add-hook 'tuareg-mode-hook
            #'(lambda ()
                (merlin-mode)
                (setq mode-name "🧙🏽‍♂️"))))


(use-package dune)

(use-package merlin-eldoc
  :init
  :hook ((tuareg-mode caml-mode) . merlin-eldoc-setup))


(use-package parinfer-rust-mode
  :diminish
  :hook ((emacs-lisp-mode scheme-mode dune-mode) . parinfer-rust-mode))

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(require 'ansi-color)

(load custom-file)

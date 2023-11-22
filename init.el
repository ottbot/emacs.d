;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(require 'rc-vertico)

(require 'rc-cpp)

(use-package eldoc-overlay)


(use-package eglot
  :init
  (require 'project)
  :config
  (add-hook 'c-mode-hook 'rc-c++-hook)
  (add-hook 'c++-mode-hook 'rc-c++-hook))

(use-package cmake-mode)
(use-package cmake-font-lock)

(defun rc-c++-hook ()
  (eglot-ensure)
  (setq mode-name "🙃")
  (add-hook 'before-save-hook 'eglot-format nil 't))

(use-package cmake-mode)


(use-package parinfer-rust-mode
  :diminish
  :init
  (setq parinfer-rust-auto-download 'f)
  :hook ((emacs-lisp-mode scheme-mode) . parinfer-rust-mode))


(load custom-file)
(load-theme 'doom-one t nil)

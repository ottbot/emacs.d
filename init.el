;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(require 'rc-cpp)

(use-package eldoc-overlay)

(use-package cmake-mode)
(use-package cmake-font-lock)

(defun rc-c++-hook ()
  (eglot-ensure)
  (c-set-style "llvm.org")
  (setq mode-name "😵‍"))

(use-package eglot
  :init
  (require 'project)
  :config
  (add-hook 'c-mode-hook 'rc-c++-hook)
  (add-hook 'c++-mode-hook 'rc-c++-hook))
  

(use-package cmake-mode)

(use-package protobuf-mode)

(use-package parinfer-rust-mode
  :diminish
  :hook ((emacs-lisp-mode scheme-mode) . parinfer-rust-mode))

(load custom-file)
(load-theme 'doom-one t nil)

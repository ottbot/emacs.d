;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(require 'rc-cpp)

(use-package exwm)

(use-package eldoc-overlay)

(use-package xah-wolfram-mode
  :straight '(xah-wolfram-mode
              :repo "https://github.com/xahlee/xah-wolfram-mode")
  :mode ("\\.wl\\'" . xah-wolfram-mode))

;;TODO move below to rc-cpp

(use-package bazel)

(defun rc-c++-hook ()
  (eglot-ensure)
  (c-set-style "llvm.org")
  (setq mode-name "😵‍💫"))

(use-package eglot
  :config
  (require 'project)
  (add-hook 'c++-mode-hook 'rc-c++-hook)
  (add-hook 'c-mode-hook 'rc-c++-hook)
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(use-package cmake-mode)

(use-package protobuf-mode)

(use-package parinfer-rust-mode
  :diminish
  :hook ((emacs-lisp-mode scheme-mode) . parinfer-rust-mode))



(load custom-file)

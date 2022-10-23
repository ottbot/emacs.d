;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'rc)

(use-package exwm)


(use-package eldoc-overlay)

(use-package xah-wolfram-mode
  :straight '(xah-wolfram-mode
              :repo "https://github.com/xahlee/xah-wolfram-mode")
  :mode ("\\.wl\\'" . xah-wolfram-mode))


(require 'ansi-color)

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq frame-resize-pixelwise t)
  (setq mouse-sel-mode t))


(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)

(use-package bazel)


(use-package eglot
  :config
  (require 'project)
  (add-hook 'c++-mode-hook #'(lambda ()
                               (eglot-ensure)
                               (setq mode-name "😵‍💫")))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(use-package cmake-mode)

(use-package protobuf-mode)


;(require 'rc-ocaml)

(use-package parinfer-rust-mode
  :diminish
  :hook ((emacs-lisp-mode scheme-mode dune-mode) . parinfer-rust-mode))

(use-package org-project
  :straight (org-project :type git :host github :repo "delehef/org-project")
  :custom
  ;; If invoked outside of a project, prompt for a valid project to capture for
  (org-project-prompt-for-project t)


  (org-project-todos-per-project t)
  (org-project-per-project-file "TODO.org")

  ;; Use custom capture templates
  (org-project-capture-template "* TODO %?\n%t\n") ;; Ask for a TODO and a date
  (org-project-quick-capture-template "* TODO %? %(org-insert-time-stamp (org-read-date nil t \"+2d\"))\n") ;; Quick TODOs ae scheduled in two days

  ;; Add some binding for org-project in project.el map
  :bind (:map project-prefix-map
              ("t" . org-project-quick-capture)
              ("T" . org-project-capture)
              ("o" . org-project-open-todos)))


(load custom-file)

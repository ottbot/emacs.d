;; ⊂(◉‿◉)つ

(add-to-list 'load-path "~/.emacs.d/lisp/")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'rc-package)
(require 'rc-funs)
(require 'rc-defaults)

(use-package undo-tree)
(use-package diminish)
(use-package bind-key)

(use-package exwm
  :config
  (require 'rc-exwm)
  (rc/exwm-config))

(use-package ace-window
  :bind ("M-o" . ace-window))

(use-package avy
  :bind (("C-:" . avy-goto-char)
	 ("C-'" . avy-goto-char-2)))

(use-package counsel)

(use-package ivy
  :diminish ivy-mode
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :bind (("M-x" . counsel-M-x)
	 ("C-s" . swiper)
	 ("C-r" . swiper))
  :config
  (ivy-mode 1))

(use-package company
  :ensure t
  :bind ("<C-tab>" . company-complete)
  :init
  (global-company-mode))

(use-package unkillable-scratch
  :custom
  (unkillable-scratch-behaviour 'bury))

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package clojure-mode)

(use-package cider
  :custom
  (cider-repl-displau-help-banner nil)
  (nrepl-log-messages t)
  (nrepl-hide-special-buffers t))

(use-package paredit
  :diminish paredit-mode
  :bind (:map paredit-mode-map
	      ("C-c <right>" . paredit-forward-slurp-sexp)
	      ("C-c <left>" . paredit-forward-barf-sexp)
	      ("C-j" . 'eval-last-sexp))
  :hook ((emacs-lisp-mode clojure-mode) . enable-paredit-mode))

(use-package clj-refactor
  :diminish yas-minor-mode
  :config
  (add-hook 'clojure-mode-hook (lambda ()
				 (clj-refactor-mode 1)
				 (yas-minor-mode 1)
				 (cljr-add-keybindings-with-prefix "C-c C-m"))))

(use-package magit
  :ensure t
  :pin "melpa-stable")

(use-package julia-mode)

(use-package julia-repl
  :init
  (add-hook 'julia-mode-hook 'julia-repl-mode))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-cleanup-known-projects)
  (projectile-global-mode))

(use-package prodigy
  :config
  (require 'rc-prodigy)
  (rc/prodigy-config))


(global-set-key [remap move-beginning-of-line]
		'smarter-move-beginning-of-line)


;;   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ   ᕦ(òᴥó)ᕥ
;;------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-repl-displau-help-banner nil t)
 '(custom-safe-themes
   (quote
    ("b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default)))
 '(enable-recursive-minibuffers t)
 '(ivy-use-virtual-buffers t)
 '(nrepl-hide-special-buffers t t)
 '(nrepl-log-messages t t)
 '(package-selected-packages
   (quote
    (julia evil-magit 0blayout prodigy base16-theme clj-refactor cider clojure-mode magit counsel company ivy ace-window paredit unkillable-scratch auto-package-update ace-jump-mode diminish exwm use-package)))
 '(unkillable-scratch-behaviour (quote bury) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

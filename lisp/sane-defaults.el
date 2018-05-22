
;; No TABs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Write backup files to own directory
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(xterm-mouse-mode t)

;; Make underscores make up words
(modify-syntax-entry ?_ "w")

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired
(setq global-auto-revert-non-file-buffers t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)


(setq inhibit-startup-message t)
(setq delete-by-moving-to-trash t)
(setq shift-select-mode nil)

(auto-compression-mode t)

(global-font-lock-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


(transient-mark-mode 1)
(delete-selection-mode 1)

(setq line-number-mode t)
(setq column-number-mode t)


(setq fill-column 80)

(recentf-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)


(set-default 'indicate-empty-lines t)

(mouse-wheel-mode t)


(setq-default truncate-lines t)

;; (require 'smooth-scrolling)

;; Represent undo-history as an actual tree (visualize with C-x u)
(require 'undo-tree)
(global-undo-tree-mode)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Clobber suspsend frame
;; (global-set-key (kbd "C-x C-z") nil)
;; (global-set-key (kbd "C-z") nil)
;; (put 'suspend-frame 'disabled t)

(provide 'sane-defaults)

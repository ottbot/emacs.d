;; rob's emacs

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq lisp-dir (expand-file-name "lisp" dotfiles-dir))

(add-to-list 'load-path lisp-dir)


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))


(require 'pig-mode)
(require 'magit)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; load up others
(require 'paredit-conf)
(require 'ac-conf)
(require 'ido-conf)
(require 'elisp-conf)
(require 'clojure-conf)
(require 'css-conf)
(require 'org-conf)
(require 'tramp-conf)
(require 'sane-defaults)
(require 'ruby-conf)
(require 'c-conf)
;;(require 'mu4e-conf)
;;(require 'rsense-conf)
(require 'defuns)
(require 'sql-conf)
(require 'ocaml-conf)
(require 'recentf-conf)
;;(require 'swank-conf)
;;(require 'multi-term-conf)
;; (require 'tex-site)
;;(require 'evil-conf)
(require 'paxedit-conf)
(require 'keybindings)

;; hooks
(defvar keep-trailing-whitespace-modes)
(setq keep-trailing-whitespace-modes '(org-mode))


(add-hook 'before-save-hook 'my-delete-trailing-whitespace)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Use aspell
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq-default ispell-list-command "list")

;; Fire up the server
(require 'server)
(unless (server-running-p)
  (server-start))


(require 'appearance)


;; Variables
(setq compilation-scroll-output t)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#292929" "#ff3333" "#aaffaa" "#aaeecc" "#aaccff" "#FF1F69" "#aadddd" "#999999"])
 '(auth-source-cache-expiry 7200)
 '(auth-source-debug nil)
 '(auth-source-do-cache t)
 '(background-color "#202020")
 '(background-mode dark)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cursor-color "#cccccc")
 '(custom-safe-themes (quote ("1b5790d1235a935a2767bbda6f122e5bbdca4934a31b89ed43ce492577529da6" "b6f7795c2fbf75baf3419c60ef7625154c046fc2b10e3fdd188e5757e08ac0ec" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "90af7d0da6b97c28098177271c1d9198234435a2d1874880ba36e5bdae9da113" "53c542b560d232436e14619d058f81434d6bbcdc42e00a4db53d2667d841702e" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7a9f392481b6e2fb027ab9d8053ab36c0f23bf5cc1271206982339370d894c74" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "5bd5af0deb1ab0e2c1b9c54d94a3f030529b6c7034fdf0d3cc4b0e7e0338cb91" "92777c893be4ba0a3082a8c76ef840b892d3959fd652d3c97dce21167cdc5dcb" "865d6cb994f89c13b2d7e5961df4eabeea12494583c240c8fe9a788d0f4ee12c" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "13086a97be7ca9fcf7356f94ed1c77353138e00d70176ef4ae691bc58fda5eea" "41b995882dc29bc318669ffbdf9489c3ff18cda49e55bae832ae792c0dc2f0e2" "a68fa33e66a883ce1a5698bc6ff355b445c87da1867fdb68b9a7325ee6ea3507" "5ce9c2d2ea2d789a7e8be2a095b8bc7db2e3b985f38c556439c358298827261c" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" "d24e10524bb50385f7631400950ba488fa45560afcadd21e6e03c2f5d0fad194" "6615e5aefae7d222a0c252c81aac52c4efb2218d35dfbb93c023c4b94d3fa0db" "cc83fa4ffec1545d4bde6a44b1fb8431f9090874a22554920c709fa97338d0aa" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "fca8ce385e5424064320d2790297f735ecfde494674193b061b9ac371526d059" "159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "e9a1226ffed627ec58294d77c62aa9561ec5f42309a1f7a2423c6227e34e3581" "211bb9b24001d066a646809727efb9c9a2665c270c753aa125bace5e899cb523" "27b53b2085c977a8919f25a3a76e013ef443362d887d52eaa7121e6f92434972" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "8281168b824a806489ca7d22e60bb15020bf6eecd64c25088c85b3fd806fc341" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(display-time-mode t)
 '(emms-mode-line-icon-image-cache (quote (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-emacs-state-modes (quote (archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode Custom-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-commit-mode magit-diff-mode magit-key-mode magit-log-mode magit-mode magit-reflog-mode magit-show-branches-mode magit-branch-manager-mode magit-stash-mode magit-status-mode magit-wazzup-mode mh-folder-mode monky-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode occur-mode org-agenda-mode package-menu-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode mu4e-headers-mode mu4e-view-mode mu4e-compose-mode mu4e-main-mode)))
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color monokai-bg-1)
 '(feature-cucumber-command "rake cucumber RAILS_ENV=cucumber  CUCUMBER_OPTS=\"{options}\" FEATURE=\"{feature}\"")
 '(fit-frame-to-buffer-bottom-margin 0)
 '(foreground-color "#cccccc")
 '(gnus-logo-colors (quote ("#528d8d" "#c0c0c0")))
 '(gnus-mode-line-image-cache (quote (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t)
 '(linum-format " %5i ")
 '(magit-default-tracking-name-function (quote magit-default-tracking-name-branch-only))
 '(menu-bar-mode nil)
 '(rspec-compilation-buffer-name "*rspec compilation*")
 '(rspec-spec-command "rspec")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-rake-flag nil)
 '(rspec-use-rake-when-possible nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-file-dialog nil)
 '(vc-annotate-background monokai-bg)
 '(vc-annotate-color-map (quote ((20 . monokai-fg-1) (40 . monokai-bg+2) (60 . monokai-red) (80 . monokai-red+1) (100 . monokai-orange) (120 . monokai-orange+1) (140 . monokai-green) (160 . monokai-green+1) (180 . monokai-yellow) (200 . monokai-yellow+1) (220 . monokai-blue) (240 . monokai-blue+1) (260 . monokai-purple) (280 . monokai-purple+1) (300 . monokai-cyan) (320 . monokai-cyan+1) (340 . monokai-magenta) (360 . monokai-magenta+1))))
 '(vc-annotate-very-old-color monokai-magenta))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line-highlight ((t nil))))

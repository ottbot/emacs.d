;; ORG MODE STUFFS
;; ===============
;; Set to the location of Org files on local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Dropbox/MobileOrg/inbox.org")
(setq org-startup-indented t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org"))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)


;; for babel clojure
(setq org-babel-clojure-backend 'cider)

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-src-window-setup 'current-window)

(setq org-src-preserve-indentation t)

(require 'ob-plantuml)
(setq org-plantuml-jar-path "/usr/local/opt/plantuml/plantuml.8031.jar")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))



(provide 'org-conf)

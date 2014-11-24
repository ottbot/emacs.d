(require 'rcirc)

;; Turn on spell checking.
(add-hook 'rcirc-mode-hook (lambda ()
			     (flyspell-mode 1)))

;; ;; Keep input line at bottom.
;; (add-hook 'rcirc-mode-hook
;; 	  (lambda ()
;; 	    (set (make-local-variable 'scroll-conservatively)
;; 		 8192)))

;; Adjust the colours of one of the faces.
(set-face-foreground 'rcirc-my-nick "red" nil)

;; (add-to-list 'rcirc-server-alist
;;              '("localhost"))
;;              ;;'(("irc.freenode.net" :channels ("#emacs" "#rcirc" "#fundingcircle"))))


(setq rcirc-default-nick "rob")
(setq rcirc-default-user-name "rob")
(setq rcirc-default-full-name "Robert Crim")

(rcirc-track-minor-mode 1)

(provide 'rcirc-conf)

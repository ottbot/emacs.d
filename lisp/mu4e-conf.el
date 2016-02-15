(require 'mu4e)

(setq mu4e-mu-binary "/usr/local/bin/mu")

(setq mu4e-maildir "/Users/rob/.mail")

(require 'sendmail)
;(require 'org-mu4e)

;; hooks
(add-hook 'mu4e-compose-mode-hook
          (defun my-compose-stuff ()
            (set-fill-column 72)
            ))

;; my e-mail addresses
(setq mu4e-user-mail-address-list '("rjcrim@gmail.com"
                                    "rob@fundingcircle.com"))

;; general settings
(setq mail-user-agent 'mu4e-user-agent                     ; mu4e as default mail agent
      user-full-name "Robert Crim"
      mu4e-attachment-dir "~/Downloads"                    ; put attachements in download dir
      mu4e-get-mail-command "mbsync -a --pull-new --push"  ; fetch email with mbsync
      mu4e-confirm-quit nil                                ; don't ask me to quit
      mu4e-headers-skip-duplicates t                       ; skip duplicate email, great for gmail
      mu4e-headers-date-format "%d %b, %Y at %H:%M"        ;   date format
      mu4e-headers-leave-behavior 'apply                   ; apply all marks at quit
      mu4e-html2text-command "w3m -dump -T text/html"      ; html to text
      mu4e-compose-dont-reply-to-self t                    ; don't reply to myself
      mu4e-compose-signature-auto-include nil
      mu4e-compose-signature ""
      message-signature ""                               ; signature
      message-kill-buffer-on-exit t                      ; don't keep message buffers around
      smtpmail-queue-mail nil                            ; start in non queue mode
      ;;mu4e-update-interval 300
      mu4e-headers-auto-update t
      mu4e-use-fancy-chars nil)


(setq mu4e-view-show-images t)

(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq mu4e-view-prefer-html t)


;; maildir locations
(setq mu4e-maildir "~/.mail"
      mu4e-sent-folder "/personal/[Gmail]/.Sent Mail"
      mu4e-drafts-folder "/personal/[Gmail]/.Drafts"
      mu4e-trash-folder "/personal/[Gmail]/.All Mail"
      mu4e-refile-folder "/personal/[Gmail]/.All Mail"
      smtpmail-queue-dir   "~/.mail/queue/cur")

;; sending mail
(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      starttls-gnutls-program "/usr/local/bin/gnutls-cli"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      smtpmail-debug-info t
      smtpmail-debug-verb t)

;; multiple accounts
(setq my-mu4e-account-alist
      '(("personal"
         (user-mail-address "rjcrim@gmail.com")
         (mu4e-sent-folder "/personal/[Gmail]/.Sent Mail")
         (mu4e-drafts-folder "/personal/[Gmail]/.Drafts")
         (mu4e-refile-folder "/personal/[Gmail]/.All Mail")
         (mu4e-trash-folder  "/personal/[Gmail]/.All Mail")
         (smtpmail-smtp-server "smtp.gmail.com")
         (smtpmail-smtp-user "rjcrim@gmail.com"))
        ("work"
         (user-mail-address "rob@fundingcircle.com")
         (mu4e-sent-folder "/work/[Gmail]/.Sent Mail")
         (mu4e-drafts-folder "/work/[Gmail]/.Drafts")
         (mu4e-refile-folder "/work/[Gmail]/.All Mail")
         (mu4e-trash-folder  "/work/[Gmail]/.All Mail")
         (smtpmail-smtp-server "smtp.gmail.com")
         (smtpmail-smtp-user "robert.crim@fundingcircle.com"))))

;; Gmail IMAP will do this
(setq mu4e-sent-messages-behavior 'delete)

(defun my-mu4e-set-account ()
  "Set the account for composing a message by looking at the maildir"
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-msg-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars))))
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

;; org-mode integration
;; (setq mu4e-org-contacts-file "/home/rob/org/contacts.org")

;; (add-to-list 'mu4e-headers-actions
;;              '("org-contact-add" . mu4e-action-add-org-contact) t)
;; (add-to-list 'mu4e-view-actions
;;              '("org-contact-add" . mu4e-action-add-org-contact) t)


(defun mu4e-msgv-action-view-in-browser (msg)
  "View the body of the message in a web browser."
  (interactive)
  (let ((html (mu4e-msg-field (mu4e-message-at-point t) :body-html))
        (tmpfile (format "%s/%d.html" temporary-file-directory (random))))
    (unless html (error "No html part for this message"))
    (with-temp-file tmpfile
      (insert
       "<html>"
       "<head><meta http-equiv=\"content-type\""
       "content=\"text/html;charset=UTF-8\">"
       html))
    (browse-url (concat "file://" tmpfile))))

(add-to-list 'mu4e-view-actions
             '("View in browser" . mu4e-msgv-action-view-in-browser) t)


;; set bookmarks
(setq mu4e-bookmarks
  '(("flag:unread"                       "All new messages"      ?u)
    ("maildir:/personal/inbox"           "Personal inbox"        ?p)
    ("maildir:/work/inbox"               "Work inbox"            ?w)
    ("date:today..now"                   "Today's messages"      ?t)
    ("flag:flagged"                      "Flagged messages"      ?f)))

;; shortcuts
(setq mu4e-maildir-shortcuts
       '(("/personal/inbox"   . ?i)
         ("/work/inbox"       . ?I)))

(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(provide 'mu4e-conf)

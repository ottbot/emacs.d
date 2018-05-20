(require 'exwm)
(require 'exwm-randr)


(defun rc/display-status ()
  (let ((res '()))
    (with-temp-buffer
      (call-process "xrandr" nil t t)
      (beginning-of-buffer)
      (save-match-data
        (while (re-search-forward "\\(\\\w+-[0-9]+\\) \\(\\\w+\\)" nil t)
          (message (concat (match-string 1) (match-string 2)))
          (push (cons (match-string 1) (match-string 2)) res))))
    res))

(defun rc/exwm-auto-toggle-screen ()
  (let ((displays (rc/display-status)))
    (if (string= "disconnected" (cdr (assoc "DP-1" displays)))
        (message "Hey now!!"))))



;; (add-hook 'exwm-randr-screen-change-hook        )

;; Global key bindings

(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset)
        ([?\s-w] . exwm-workspace-switch)
        ([?\s-&] . (lambda (cmd)
                     (interactive (list (read-shell-command "$> ")))
                     (start-process-shell-command cmd nil cmd)))
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))


(setq exwm-input-simulation-keys
      '(([?\C-b] . [left])
        ([?\C-f] . [right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])))

(add-hook 'exwm-update-class-hook
          (lambda ()
            (exwm-workspace-rename-buffer
             exwm-class-name)))

(setq exwm-workspace-number 4)

(exwm-enable)


(provide 'exwm-conf)

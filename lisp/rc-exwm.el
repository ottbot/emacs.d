(require 'exwm)
(require 'exwm-randr)

(defun rc/display-status ()
  (let ((res '()))
    (with-temp-buffer
      (call-process "xrandr" nil t t)
      (beginning-of-buffer)
      (save-match-data
        (while (re-search-forward "\\(\\\w+-[0-9]+\\) \\(\\\w+\\)" nil t)
          (push (cons (match-string 1) (match-string 2)) res))))
    res))

(defun rc/connected-displays (displays)
  (mapcar 'car
          (seq-filter (lambda (a)
                        (string= "connected" (cdr a)))
                      displays)))


(defun rc/connected-external-displays (displays)
  (seq-filter (lambda (x)
                (member x '("DP-1" "DP-2")))
              (rc/connected-displays displays)))

(setq exwm-workspace-number 10)

(defun rc/workspace-output-plist (display)
  (append '(0 "eDP-1")
          (cl-mapcan (lambda (i)
                    (list i display))
                  (number-sequence 1 9))))

(defun rc/run-randr (ext)
  (shell-command
   (concat "xrandr --output eDP-1 --auto "
           (when ext
             (concat  "--output " ext " --auto --right-of eDP-1 "))
           "--primary")))

(defun rc/exwm-auto-toggle-screen ()
  (let ((ext (car (rc/connected-external-displays (rc/display-status)))))
    (rc/run-randr ext)
    (setq exwm-randr-workspace-output-plist
          (rc/workspace-output-plist (or ext "eDP-1")))))

(add-hook 'exwm-randr-screen-change-hook
          'rc/exwm-auto-toggle-screen)


(setq rc/exwm-workspace-visited-ring (make-ring 5))

(defun rc/exwm-workspace-switch-previous ()
  (interactive)
  (unless (ring-empty-p rc/exwm-workspace-visited-ring)
    (exwm-workspace-switch
     (ring-ref rc/exwm-workspace-visited-ring 1))))

(add-hook 'exwm-workspace-switch-hook
          (lambda ()
            (ring-insert rc/exwm-workspace-visited-ring
                         exwm-workspace-current-index)))

(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset)
        ([?\s-w] . exwm-workspace-switch)
        ([?\s-&] . (lambda (cmd)
                     (interactive (list (read-shell-command "$> ")))
                     (start-process-shell-command cmd nil cmd)))
        (,[s-tab] . rc/exwm-workspace-switch-previous)
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

(exwm-input-set-key
 (kbd "C-c s")
 (lambda ()
   (interactive)
   (start-process "slock" "*Messages*" "slock")))

(exwm-input-set-key
 (kbd "C-c RET")
 (lambda ()
   (interactive)
   (start-process "st" "*Messages*" "st")))

(setq exwm-workspace-show-all-buffers t)
(setq exwm-layout-show-all-buffers t)

(defun rc/exwm-config ()
  (exwm-randr-enable)
  (exwm-enable))

(provide 'rc-exwm)

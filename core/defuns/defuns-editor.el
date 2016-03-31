;;; defuns-editor.el
;; for ../core-editor.el

(defvar *linum-mdown-line* nil)

(defun narf--line-at-click ()
  (save-excursion
    (let ((click-y (cdr (cdr (mouse-position))))
          (line-move-visual-store line-move-visual))
      (setq line-move-visual t)
      (goto-char (window-start))
      (next-line (1- click-y))
      (setq line-move-visual line-move-visual-store)
      ;; If you are using tabbar substitute the next line with
      ;; (line-number-at-pos))))
      (1+ (line-number-at-pos)))))

;;;###autoload
(defun narf/mouse-drag-line ()
  (interactive)
  (goto-line (narf--line-at-click))
  (set-mark (point))
  (setq *linum-mdown-line* (line-number-at-pos)))

;;;###autoload
(defun narf/mouse-select-line ()
  (interactive)
  (when *linum-mdown-line*
    (let (mu-line)
      (setq mu-line (narf--line-at-click))
      (goto-line *linum-mdown-line*)
      (if (> mu-line *linum-mdown-line*)
          (progn
            (set-mark (point))
            (goto-line mu-line)
            (end-of-line))
        (set-mark (line-end-position))
        (goto-line mu-line)
        (beginning-of-line))
      (setq *linum-mdown-line* nil))))

;;;###autoload
(defun narf*load-hs-minor-mode ()
  (hs-minor-mode 1)
  (advice-remove 'evil-toggle-fold 'narf-load-hs-minor-mode))

;;;###autoload
(defun narf/reselect-paste ()
  (interactive)
  (evil-goto-mark ?\[)
  (evil-visual-state)
  (evil-goto-mark ?\]))

(provide 'defuns-editor)
;;; defuns-editor.el ends here
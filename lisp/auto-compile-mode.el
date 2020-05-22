;;; auto-compile-mode.el -- compile on save
;;; commentary:
;;; A minor mode to run a compile command via a local save
;;; hook, closing the window on success.
;;; code:

(require 'compile)

(defvar auto-compile-buffer-name "*auto-compilation*")

(defvar auto-compile-always-kill t
  "If you want to kill any current compilations.")

(defvar auto-compile-auto-close t
  "Automatically close the compilation buffer.")

(defvar-local auto-compile-command 'compile
  "The command used to compile in the 'after-save-hook'.")

(defvar auto-compile-just-launched nil
  "Used to determine if we need an auto-compile buffer.  There is a race-condition here but we'll probably be fine.")

(defun auto-compile-when-active ()
  "Only compile when auto-compile-mode is enabled."
  (when auto-compile-mode
    (setq auto-compile-just-launched t)
    (funcall auto-compile-command)))

(defun auto-compile-clean-p (MSG)
  "True if MSG suggests the compilation is clean."
  (string= MSG "finished\n"))

(defun auto-compile-close-if-clean (BUF MSG)
  "Close the automated compilation window BUF based on MSG."
  (when (and (string= auto-compile-buffer-name (buffer-name BUF))
             (auto-compile-clean-p MSG))
    (bury-buffer BUF)
    (delete-window (get-buffer-window BUF))))

(defvar auto-compile-global-name-function nil
  "The existing buffer naming function.")

(defun auto-compile-buffer-name-function (BUF)
  "Generate a buffer name for the compilation buffer.  The BUF is passed to existing naming function."
  (cond
   (auto-compile-just-launched
    (progn
      (setq auto-compile-just-launched nil)
      auto-compile-buffer-name))
   (auto-compile-global-name-function
    (funcall auto-compile-global-name-function BUF))
   (t "*compilation*")))


(define-minor-mode auto-compile-mode
  "A minor mode to call 'auto-compile-command' on save."
  :init-value nil
  :lighter " ♻"

  (setq auto-compile-global-name-function
        compilation-buffer-name-function
        compilation-buffer-name-function
        'auto-compile-buffer-name-function)

  (setq-local compilation-always-kill
              auto-compile-always-kill)

  (when auto-compile-auto-close
    (add-hook 'compilation-finish-functions 'auto-compile-close-if-clean))

  (add-hook 'after-save-hook 'auto-compile-when-active t t))


(provide 'auto-compile-mode)
;;; auto-compile-mode.el ends here

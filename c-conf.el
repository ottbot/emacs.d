(load "~/.emacs.d/google-c-style")
(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)

(provide 'c-conf)
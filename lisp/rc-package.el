;;; rc-package -- summary
;;; commentary:
;;; Set up package.el and bootstrap use-package
;;; code:

(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package use-package-chords
  :config (key-chord-mode 1))


(provide 'rc-package)
;;; rc-package.el ends here

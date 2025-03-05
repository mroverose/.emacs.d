;;; package --- summary
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-const)
(require 'init-funcs)
(require 'init-packages)
(require 'init-hydra)
(require 'init-general)
(require 'init-tools)
(require 'init-ui)
(require 'init-completion)
(require 'init-programs)
(require 'init-window)
(require 'init-emacs-w3m)
(require 'init-org)
(require 'init-org-roam)
(require 'init-markdown)
(require 'init-dired)
(require 'init-rust)



(setq custom-file (expand-file-name "~/.emacs.d/lisp/custom.el"))
(load custom-file 'no-error 'no-message)

(provide 'init)
;;; init.el ends here

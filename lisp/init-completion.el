;;; package --- summary
;;; Commentary:
;;; Code:


(use-package company
  :ensure t
  :commands (global-company-mode)
  :init
  (global-company-mode t)
  :custom
  (company-tooltip-align-annotations 't)
  (company-minimum-prefix-length 1)
  (company--idle-delay 0.1))



(provide 'init-completion)

;;; init-completion.el ends here

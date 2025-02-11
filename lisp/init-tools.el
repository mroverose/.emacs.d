;;; package --- summary
;;; Commentary:

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)))

;;为minibuffer中的选项添加注解
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode t))

;;modeline上显示操作的按键
;;(use-package keycast
;;  :ensure t
;;  :init
;;  (keycast-mode t))

(use-package anzu
  :ensure t
  :demand t
  :init
  (global-anzu-mode t))


(use-package which-key
  :ensure t
  :commands (which-key-mode)
  :init
  (which-key-mode))


(use-package vertico
  :ensure t
  :init
  (vertico-mode t))

(use-package embark
  :ensure t
  :init
  (global-set-key (kbd "C-c ;") 'embark-act)
  :config
  (setq prefix-help-command 'embark-prefix-help-command))

(use-package consult
  :ensure t
  :init
  (global-set-key (kbd "C-s") 'consult-line)
  (global-set-key (kbd "C-x b") 'consult-buffer)
  (global-set-key (kbd "M-s i") 'consult-imenu))

(use-package wgrep
  :ensure t)

(use-package embark-consult
  :ensure t
  :init
  (setq wgrep-auto-save-buffer t))

(eval-after-load 'consult
  '(eval-after-load 'embark
     '(progn
	(require 'embark-consult)
	(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))))

(defun embark-export-write ()
  "Export the current vertico results to a writable buffer if possible.
Supports exporting consult-grep to wgrep,file to wdeired,and consult-location to occur-edit"
  (interactive)
  (require 'embark)
  (require 'wgrep)
  (pcase-let ((`(,type . ,candidates)
	       (run-hook-with-args-until-success 'embark-candidate-collectors)))
    (pcase type
      ('consult-grep (let ((embark-after-export-hook #'wgrep-change-to-wdired-mode))
		       (embark-export)))
      ('file (let ((embark-after-export-hook #'wdired-change-to-wdired-mode))
	       (embark-export)))
      (x (user-error "embark category %s doesn't supports writable export" x)))))

(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)

(provide 'init-tools)
;;; init-tools.el ends here

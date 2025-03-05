;;; package --- summary
;;; Commentary:
;;; Code:

(use-package nerd-icons
  :ensure t
  :config
  (when (not (font-installed-p nerd-icons-font-family))
    (nerd-icons-install-fonts t)))


(use-package emacs
  :init
  (tool-bar-mode -1)
  (when scroll-bar-mode
    (scroll-bar-mode -1))
  (load-theme 'wombat)
  ;; (set-face-attribute 'default nil :font "CaskaydiaCove Nerd Font Mono" :height 160)
  ;; (fido-vertical-mode)
  :config
  ;; (setq treesit-language-source-alist
  ;; '((ruby "https://github.com/tree-sitter/tree-sitter-ruby")))
  )

(provide 'init-ui)
;;; init-ui.el ends here

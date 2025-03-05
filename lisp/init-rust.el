;;; package --- Summary:
;;; Commentary:

;;; Code:

(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rustic-mode)
  :init (setq rust-format-on-save t
              rust-mode-treesitter-derive t)
  :config
  ;;`global-treesit-auto-mode` will override rust-mode
  (define-derived-mode rustic-mode rust-mode "Rust"
    "Major mode for Rust code.
\\{rust-mode-map}")
  )

(use-package ron-mode
  :ensure t
  :mode ("\\.ron" . ron-mode))

(provide 'init-rust)
;;; init-rust.el ends here

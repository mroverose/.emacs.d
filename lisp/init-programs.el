;;; package --- summary
;;; Commentary:
;;; Code:

(use-package quickrun
  :ensure t
  :commands (quickrun)
  :init
  (quickrun-add-command "c++20"       ;;"c++/clz"
	`((:command . "clang++")
	  (:exec . ("%c -std=c++20 %o -o %e %s"
				"%e %a"))
	  (:remove . ("%e")))
	:default "c++"))
(global-set-key (kbd "<f5>") 'quickrun)

(use-package rainbow-delimiters
  :ensure t
  :config
  (rainbow-delimiters-mode t))


(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status))


(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
         (org-mode . yas-minor-mode))
  :init
  :config
  (progn
    (setq hippie-expand-try-functions-list
          '(yas/hippie-try-expand
            try-complete-file-name-partially
            try-expand-all-abbrevs
            try-expand-dabbrev
            try-expand-dabbrev-all-buffers
            try-expand-dabbrev-from-kill
            try-complete-lisp-symbol-partially
            try-complete-lisp-symbol))))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package typescript-mode
  :ensure t 
  :after tree-sitter
  :config
                                        ; we choose this instead of tsx-mode so that eglot can automatically figure out language for server
  ;; see https://github.com/joaotavora/eglot/issues/624 and https://github.com/joaotavora/eglot#handling-quirky-servers
  (define-derived-mode typescriptreact-mode typescript-mode
    "TypeScript TSX")

  ;; use our derived mode for tsx files
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
  ;; by default, typescript-mode is mapped to the treesitter typescript parser
  ;; use our derived mode to map both .tsx AND .ts -> typescriptreact-mode -> treesitter tsx
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx)))

;; https://github.com/orzechowskid/tsi.el/
;; great tree-sitter-based indentation for typescript/tsx, css, json
(use-package tsi
  :after tree-sitter
  :quelpa (tsi :fetcher github :repo "orzechowskid/tsi.el")
  ;; define autoload definitions which when actually invoked will cause package to be loaded
  :commands (tsi-typescript-mode tsi-json-mode tsi-css-mode)
  :init
  (add-hook 'typescript-mode-hook (lambda () (tsi-typescript-mode 1)))
  (add-hook 'json-mode-hook (lambda () (tsi-json-mode 1)))
  (add-hook 'css-mode-hook (lambda () (tsi-css-mode 1)))
  (add-hook 'scss-mode-hook (lambda () (tsi-scss-mode 1))))

;; auto-format different source code files extremely intelligently
;; https://github.com/radian-software/apheleia
(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1))


(use-package treesit-auto
  :demand t
  :init
  (setq treesit-font-lock-level 4)
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode t))

(setq major-mode-remap-alist
      '((css-mode . css-ts-mode)
        (rust-mode . rust-ts-mode)
        (ruby-mode . ruby-ts-mode)
        (js-mode . js-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (cmake-mode . cmake-ts-mode)
        (python-mode python-ts-mode)
        (java-mode . java-ts-mode)
        (kotlin-mode . kotlin-ts-mode)
        (php-mode . php-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (dockerfile-mode . dockerfile-ts-mode)
        (sh-mode . bash-ts-mode)
        (yaml-mode . yaml-ts-mode)
        (json-mode . json-ts-mode)
        (js2-mode . js-ts-mode)))

(use-package eldoc
  :ensure t
  :init
  (global-eldoc-mode t))

(require  'eglot)
(add-to-list 'eglot-server-programs '(html-mode  "vscode-html-language-server"))
(add-hook 'html-mode #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)

;;(use-package eglot
;;  :ensure nil
;; :hook (prog-mode . eglot-ensure)
;;    :init
;;    (setq eglot-stay-out-of '(flymake))
;;    :bind (:map
;;           eglot-mode-map
;;           ("C-c e a" . eglot-code-actions)
;;           ("C-c e o" . eglot-code-actions-organize-imports)
;;           ("C-c e r" . eglot-rename)
;;           ("C-c e f" . eglot-format))
;;    :config
;;    (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;;    (add-hook 'c-mode-hook #'eglot-ensure)
;;    (add-hook 'c++-mode-hook #'eglot-ensure)
;;    )
;;    (unbind-key "M-." typescript-ts-base-mode-map))



(use-package flymake
  :hook (prog-mode . flymake-mode)
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-prev-error)
              ("C-c ! l" . flymake-show-buffer-diagnostics)))

(provide 'init-programs)
;;; init-programs.el ends here

;;; package --- summary
;;; Commentary:

;;init-emacs-w3m.el


(use-package w3m
  :commands (w3m)
  :config
  ;;(require 'w3m-load)
  (setq w3m-coding-system 'utf-8
        w3m-file-coding-system 'utf-8
        w3m-file-name-coding-system 'utf-8
        w3m-input-coding-system 'utf-8
        w3m-output-coding-systme 'utf-8
        w3m-terminal-coding-system 'utf-8)
  (setq w3m-use-cookies t)
  (setq w3m-cookie-accept-bad-cookies t)
  (setq w3m-home-page
        (if (file-readable-p (expand-file-name "html/home.html" unimacs-tempfiles-dir)))
        (concat "file://" (expand-file-name "html/home.html" unimacs-tempfiles-dir) "http://www.baidu.com" ))

  (setq w3m-use-toolbar t
        w3m-key-binding 'info)

  (setq w3m-view-this-url-new-session-in-background t)
  ;;显示图标
  (setq w3m-show-graphic-icons-in-header-line t)
  (setq w3m-show-graphic-icons-in-mode-line t)

  (setq w3m-search-default-engine "b")
 )
(provide 'init-emacs-w3m)

;;; init-emacs-w3m.el ends here

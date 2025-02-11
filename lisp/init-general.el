;;; package --- summary
;;; Commentary:

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;;Emacs自动加载外部修改过的文件
(global-auto-revert-mode t)
;;关闭自动保存文件
(setq auto-save-default nil)

;;关闭默认欢迎界面
(setq inhibit-splash-screen t)

(defalias 'yes-or-no-p 'y-or-n-p)

;;显示行号
(global-display-line-numbers-mode t)


;;Dired设置
;;(setq ls-lisp-dirs-first t)  ;;首先显示目录
(setq dired-listing-switches "-alh");;用k/M/G等单位显示文件大小
;;(setq tab-always-indent 'complete)
(setq dired-dwim-target t) ;;双面板管理
;;(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(electric-pair-mode t)


;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;;(windmove-default-keybindings)

;;绑定Shift+Space设定Mark
;;(global-unset-key (kbd "C-SPC"))
;;(global-set-key (kbd "S-SPC") 'set-mark-command)

;;禁用工具栏、菜单栏和滚动条
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;启动时窗口大小
(add-to-list 'default-frame-alist '(width . 90))
(add-to-list 'default-frame-alist '(height . 120))

;;设置默认字体
(set-face-attribute 'default nil :height 160)

;;启用语法高亮
(global-font-lock-mode t)
(global-hl-line-mode t)
;;设置语言环境为UTF-8
(set-language-environment 'UTF-8)


;;优先使用UTF-8编码
(prefer-coding-system 'utf-8)

;;取消自动备份文件
(setq make-backup-files nil)

;;默认打开最近使用的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-item 10)

;;保存光标历史，记住命令
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ;;Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

;;modeline上显示操作的按键和执行的命令
;;(use-package keycast
;;  :ensure t
;;  :init
;;  (keycast-mode-line-mode t))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;;内置包，显示文件行、列、大小
(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)




(provide 'init-general)
;;; init-general.el ends here

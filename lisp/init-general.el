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

;;seletct then  edit will delete automaticly
(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

;; Automatic parenthesis pairing
(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode)
  :init (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))


                                        ; Multiple cursors
(use-package multiple-cursors
  :ensure  t
  :bind (("C-c m" . multiple-cursors-hydra/body)
         ("C-S-c C-S-c"   . mc/edit-lines)
         ("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-c C-<"       . mc/mark-all-like-this)
         ("C-M->"         . mc/skip-to-next-like-this)
         ("C-M-<"         . mc/skip-to-previous-like-this)
         ("s-<mouse-1>"   . mc/add-cursor-on-click)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         :map mc/keymap
         ("C-|" . mc/vertical-align-with-space))
  :pretty-hydra
  ((:title (pretty-hydra-title "Multiple Cursors" 'mdicon "nf-md-cursor_move")
           :color amaranth :quit-key ("q" "C-g"))
   ("Up"
	(("p" mc/mark-previous-like-this "prev")
	 ("P" mc/skip-to-previous-like-this "skip")
	 ("M-p" mc/unmark-previous-like-this "unmark")
	 ("|" mc/vertical-align "align with input CHAR"))
    "Down"
    (("n" mc/mark-next-like-this "next")
	 ("N" mc/skip-to-next-like-this "skip")
	 ("M-n" mc/unmark-next-like-this "unmark"))
    "Misc"
    (("l" mc/edit-lines "edit lines" :exit t)
	 ("a" mc/mark-all-like-this "mark all" :exit t)
	 ("s" mc/mark-all-in-region-regexp "search" :exit t)
     ("<mouse-1>" mc/add-cursor-on-click "click"))
    "% 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")"
	(("0" mc/insert-numbers "insert numbers" :exit t)
	 ("A" mc/insert-letters "insert letters" :exit t)))))


(provide 'init-general)
;;; init-general.el ends here

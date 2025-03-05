;;; package --- summary
;;; Commentary:

;;;org-roam
(use-package org-roam
  :ensure t ;;自动安装
  :custom
  (org-roam-directory (file-truename "~/roam-notes")) ;;默认笔记目录，提前手动创建好
  (org-roam-dailies-directory  "daily") ;;默认日记目录，上一目录的相对路径
  (org-roam-db-gc-threshold most-positive-fixnum) ;;提高性能

  :bind (("C-c n f" . org-roam-node-find)
         ;;如果中文输入法会拦截非Ctrl开头的快捷键，也可考虑类似如下设置
         ;;（"C-c C-n C-f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n l" . org-roam-buffer-toggle) ;;显示后链窗口
         ("C-c n u" . org-roam-ui-mode)) ;;浏览器中可视化
   :bind-keymap
   ("C-c n d" . org-roam-dailies-map) ;; 日记菜单
   :config
   (require 'org-roam-dailies) ;;启用日记功能
   (org-roam-db-autosync-mode 1) ;; 启动时自动同步数据库
)
(use-package org-roam-ui
  :ensure t
  :after org-roam
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)   ;;笔记节点跟随
  (org-roam-ui-update-on-save t))
;;org-download lets you screenshot and yank images from the web into your notes
(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

(provide 'init-org-roam)
;;; init-org-roam.el ends here

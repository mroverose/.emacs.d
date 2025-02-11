;;; package --- Summary
;;; Commentary:
;;; Code:

;;包管理器
(require 'package)
(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)

;;防止反复调用package-refresh-contents影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;;安装quelpa
(use-package quelpa
  :ensure t)

(unless (package-installed-p 'quelpa-use-package)
  (quelpa
   '(quelpa-use-package
     :fetcher git
     :url "https://github.com/quelpa/quelpa-use-package.git")))
(use-package quelpa-use-package
  :init
  (setq quelpa-use-package-inhibit-loading-quelpa t)
  :demand t)

(provide 'init-packages)

;;; init-packages.el ends here

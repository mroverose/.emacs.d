;;; package --- summary
;;; Commentary:

;;与Latex有关的设置
(use-package org
  :defer t
  :custom
  (org-highlight-latex-and-related '(native latex entities)) ;;Latex 高亮设置
  (org-pretty-entities t) ;;LaTeX 代码的prettify
  (org-pretty-entities-include-sub-superscripts nil) ;;不隐藏LaTeX的上下标更容易编辑
  (org-format-latex-options
   '(:foreground default :background default :scale 1.8 :html-forground "Black" :html-background "Transparent" :html-scale 1.0 :matchers ("Begin" "$1" "$" "$$" "\\(" "\\[")))
  :config
  (add-hook 'org-mode-hook #'org-cdlatex-mode);;打开 cdlatex
)
(use-package org-contrib
  :ensure t)



(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(S)" "|" "DONE(d!/!)")
	      (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))
(require  'org-checklist)

(setq org-log-done 'note)
(setq org-log-into-drawer t)

(setq org-agenda-files '("~/work/gtd.org"))
(setq org-agenda-span 'day)

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline "~/work/gtd.org" "Workspace")
	 "* TODO [#B] %?\n %U"
	 :empty-lines 1)))

;;(global-set-key (kbd "C-c r") 'org-capture)



(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(provide 'init-org)
;;; init-org.el ends here

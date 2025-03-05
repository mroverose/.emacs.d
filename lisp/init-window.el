;;; package --- summary
;;; Commentary:
;;; Code:
(use-package window-numbering
  :ensure t
  :init
  :config
  (window-numbering-mode t))

(use-package es-windows
  :ensure t)

(use-package buffer-move
  :ensure t)

(use-package resize-window
  :ensure t
  :init
  (defvar resize-window-dispatch-alist
    `((?n resize-window--enlarge-down " Resize - Expand down" t)
      (?p resize-window--enlarge-up " Resize - Expand up" t)
      (?f resize-window--enlarge-horizontally " Resize - horizontally" t)
      (?b resize-window--shrink-horizontally " Resize - shrink horizontally" t)
      (?r resize-window--reset-windows " Resize - reset window layout" nil)
      (?w resize-window--cycle-window-positive " Resize - cycle window" nil)
      (?W resize-window--cycle-widnow-negative " Resize - cycle window" nil)
      (?2 split-window--below " Split window horizontally nil")
      (?3 split-window-right " Split window vertically" nil)
      (?0 resize-window--delete-window " Delete window" nil)
      (?K resize-window--kill-other-windows " Kill oter windows (save state)" nil)
      (?y resize-window--restore-windows " (when state) Restore window config uration" nil)
      (?? resize-window--display-menu " Resize - display menu" nil))
    "List of actions for `resize-window-dispatch-default.
Main data structure of the dispatcher  with the form:
\(char function documentation match-capitals\)"))


(use-package winner
  :ensure nil
  :commands (winner-undo winner-redo)
  :hook (after-init . winner-mode)
  :init (setq winner-boring-buffers '("*Completions*"
				                      "*Compile-Log*"
				                      "*inferior-lisp*"
				                      "*Fuzzy Completions*"
				                      "*Apropos*"
				                      "*Help*"
				                      "*cvs*"
				                      "*Buffer List*"
				                      "*Ibuffer*"
				                      "*esh command on file*")))


(use-package tab-bar
  :ensure nil
  :init
  (tab-bar-mode t)
  (setq tab-bar-new-tab-choice "*scratch*")   ;;buffer to show in new tabs
  (setq tab-bar-close-button-show nil)        ;; hide tab close button
  (setq tab-bar-show 1)                       ;; hide bar if <= 1 tabs open
  (setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator))

  (custom-set-faces
   `(tab-bar ((t (:inherit mode-line))))
   `(tab-bar-tab ((t (:inherit mode-line :foreground "#993644"))))
   `(tab-bar-tab-inactive ((t (:inherit mode-line-inactive :foreground "white")))))

  (defvar ct/circle-numbers-alist
    `((0 . "♈")
      (1 . "♉")
      (2 . "♋")
      (3 . "♊")
      (4 . "♌")
      (5 . "♍")
      (6 . "♎")
      (7 . "♏")
      (8 . "♐")
      (9 . "♑"))
    "A list of integers to strings of circled unicode numbers.")

  (defun ct/tab-bar-tab-name-format-default (tab i)
    (let ((current-p (eq (car tab) 'current-tab))
	      (tab-num (if (and tab-bar-tab-hints (< i 10))
		               (alist-get i ct/circle-numbers-alist) "")))
      (propertize
       (concat tab-num
	           " "
	           (alist-get 'name tab)
	           (or (and tab-bar-close-button-show
			            (not (eq tab-bar-close-button-show
				                 (if current-p 'non-selected 'selected)))
			            tab-bar-close-button)
		           "")
	           " ")
       'face (funcall tab-bar-tab-face-function tab))))
  (setq tab-bar-tab-name-format-function #'ct/tab-bar-tab-name-format-default)
  (setq tab-bar-tab-hints t))


(use-package tabspaces
  :ensure t
  :hook (after-init . tabspaces-mode)
  :commands (tabspaces-switch-or-create-workspace
	         tabspaces-open-or-create-project-and-workspace)
  :custom
  (tabspaces-use-filtered-buffers-as-default t)
  (tabspaces-default-tab "Default")
  (tabspaces-remove-to-default t)
  (tabspaces-include-buffers '("*scratch*"))
  ;;maybe slow
  (tabspaces-session t)
  (tabspaces-session-auto-restore t)
  :config
  ;;Filter buffers for Consult-Buffer
  (with-eval-after-load 'consult
    ;; hide full buffer list(still availabel with "b" prefix)
    (consult-customize consult--source-buffer :hidden nil :default nil)
    ;;set consult-workspace buffer list
    (defvar consult--source-workspace
      (list :name "Workspace Buffers"
	        :narrow ?w
	        :history 'buffer-name-history
	        :category 'buffer
	        :state #'consult--buffer-state
	        :default t
	        ;; :items (lambda () (consult--buffer-query
	        ;;	       :prdicate #'tabspaces--local-buffer-p
	        ;;		       :sort 'visibility
	        ;;		       :as #'buffer-name))
	        )
      "Set workspace buffer list for consult-buffer.")
    (add-to-list 'consult-buffer-sources 'consult--source-workspace)))

(provide 'init-window)
;;; init-window.el ends here

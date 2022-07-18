(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
;;; init-evil.el --- javascript initialization
(use-package evil
  :init
  (evil-mode 1)
  (setq evil-search-module 'evil-search)

  :config
  ; global maps
  ;(evil-define-key 'normal 'global (kbd "/") 'consult-line)
  (evil-define-key 'normal 'global (kbd "C-u") 'evil-scroll-up)
  (evil-define-key 'normal 'global (kbd "C-w q") 'delete-window)

  (evil-define-key 'normal 'global (kbd "zf") 'outline-toggle-children)
  (evil-define-key 'normal 'global (kbd "zS") 'outline-show-all)
  (evil-define-key 'normal 'global (kbd "zs") 'outline-show-subtree)
  (evil-define-key 'normal 'global (kbd "zh") 'outline-hide-subtree)

  (evil-define-key 'normal 'global (kbd "gh") 'embark-act)
  (evil-define-key 'normal 'global (kbd "gw") 'embark-dwim)
  (evil-define-key 'normal 'global (kbd "g?") 'embark-bindings)

  ; orgmode maps
  (evil-define-key 'normal org-mode-map (kbd "t") 'org-todo)
  (evil-define-key 'normal org-mode-map (kbd "T") 'org-todo-list)
  (evil-define-key 'normal org-mode-map (kbd "H") 'org-shiftleft)
  (evil-define-key 'normal org-mode-map (kbd "L") 'org-shiftright)
  (evil-define-key 'normal org-mode-map (kbd "J") 'org-insert-heading-after-current)
  (evil-define-key 'normal org-mode-map (kbd "K") 'org-insert-subheading)
  (evil-define-key 'normal org-mode-map (kbd "<") 'org-metaleft)
  (evil-define-key 'normal org-mode-map (kbd ">") 'org-metaright)
  (evil-define-key 'normal org-mode-map (kbd "mk") 'org-move-subtree-up)
  (evil-define-key 'normal org-mode-map (kbd "mj") 'org-move-subtree-down)
  )

(use-package evil-surround
  :init
  (global-evil-surround-mode 1)
  :after evil)

(use-package evil-nerd-commenter
             :after evil)

(use-package evil-mc
  :init
  (global-evil-mc-mode  1)
  (evil-define-key 'visual evil-mc-key-map
	"A" #'evil-mc-make-cursor-in-visual-selection-end
	"I" #'evil-mc-make-cursor-in-visual-selection-beg)
  (evil-define-key 'normal evil-mc-key-map (kbd "gb") 'evil-mc-make-and-goto-next-match)
  (evil-define-key 'normal evil-mc-key-map (kbd "gB") 'evil-mc-make-all-cursors)
  (evil-define-key 'normal evil-mc-key-map (kbd "gk") 'evil-mc-skip-and-goto-next-match)
  (evil-define-key 'normal evil-mc-key-map (kbd "gK") 'evil-mc-undo-all-cursors)
  (evil-define-key 'normal evil-mc-key-map (kbd "<escape>") 'evil-mc-undo-all-cursors)
  :after evil
  :straight t)

(use-package evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "<SPC>" 'execute-extended-command
    "r" 'consult-recent-file
    "d" 'project-find-dir
    "f" 'project-find-file
    "F" 'consult-line-multi
    "p" 'consult-project-buffer
    ;"o" 'consult-outline
    "." 'consult-line-multi
    "/" 'consult-grep
    "b" 'consult-buffer
    "k" 'kill-buffer
    "g" 'magit-status
    "e" 'treemacs-find-file
    "t" 'treemacs
    "\\" 'toggle-frame-fullscreen
    "cl" 'evilnc-comment-or-uncomment-lines
    "cu" 'uncomment-region
    "a" 'org-agenda
    "z" 'org-show-todo-tree
    "x" 'org-archive-subtree
    "ui" (lambda () (interactive)
           (find-file-other-window user-init-file))
    "op" (lambda () (interactive)
           (find-file-other-window *global-todo-org*)))
  :after evil)

(use-package evil-collection
  :straight t
  :after evil
  :ensure t
  :custom (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(provide 'evil-package)


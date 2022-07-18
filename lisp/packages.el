(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)

; list the packages you want
(straight-use-package 'use-package)
;; (require 'package)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (package-initialize)

;; ;; bootstrap use-package
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; ;; load packages
;; (require 'use-package)
;; (setq use-package-always-ensure t)
;; (setq use-package-always-defer t)

(defun load-directory (dir)
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))
                 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory packages-directory)
(load-directory lsp-directory)
(load-directory dap-directory)

(provide 'packages)

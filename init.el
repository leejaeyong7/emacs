;;; init.el --- Emacs Settings
;;; Commentary:
;;      Jae Yong Lee - Custon Emacs init.el file
;;; Code:
;; -*- lexical-binding: t -*-
(setq debug-on-error t)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;; global variable and path setup
(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst lisp-directory (expand-file-name "lisp" user-emacs-directory))
(defconst packages-directory (expand-file-name "packages" lisp-directory))
(defconst lsp-directory (expand-file-name "lsp" lisp-directory))
(defconst dap-directory (expand-file-name "dap" lisp-directory))
(add-to-list 'load-path lisp-directory)

;;------------------------------------------------------------------------------
;; Bootstrap config
;;------------------------------------------------------------------------------

;; Emacs Default modes
(if window-system
    (progn
      ;; remove scroll bar
      (scroll-bar-mode -1)
      (tool-bar-mode -1)))

(menu-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(recentf-mode 1)
(xterm-mouse-mode 1)
;;------------------------------------------------------------------------------
;; Package list setup
;;------------------------------------------------------------------------------

;; ;; local requires
(require 'packages)

;;------------------------------------------------------------------------------
;; Interface Setup
;;------------------------------------------------------------------------------
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;------------------------------------------------------------------------------
;; Auto Gen
;;------------------------------------------------------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

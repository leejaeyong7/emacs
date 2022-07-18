
;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :config
	(defun noct-consult-line-evil-history (&rest _)
	"Add latest `consult-line' search pattern to the evil search history ring.
	This only works with orderless and for the first component of the search."
	(when (and (bound-and-true-p evil-mode)
				(eq evil-search-module 'evil-search))
		(let ((pattern (car (orderless-pattern-compiler (car consult--line-history)))))
		(add-to-history 'regexp-search-ring pattern)
		(add-to-history 'evil-ex-search-history pattern)
		(setq evil-ex-search-pattern (list pattern t t))
		(setq evil-ex-search-direction 'backward)
		(when evil-ex-search-persistent-highlight
			(evil-ex-search-activate-highlight evil-ex-search-pattern)))))

	(advice-add #'consult-line :after #'noct-consult-line-evil-history)
  )


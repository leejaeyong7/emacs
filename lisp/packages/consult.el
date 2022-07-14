;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :hook (completion-list-mode . consult-preview-at-point-mode))

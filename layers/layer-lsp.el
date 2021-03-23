(use-package lsp-mode
  :ensure t
  :custom
  (lsp-headerline-breadcrumb-enable nil))

(use-package helm-lsp
  :ensure t)

(use-package lsp-treemacs
  :ensure t)

(setq lsp-keymap-prefix "C-c l")
(setq helm-lsp-treemacs-icons nil)

(define-key lsp-mode-map (kbd "C-N") 'helm-lsp-workspace-symbol)
(define-key lsp-mode-map (kbd "C-S-SPC") nil)
(define-key lsp-mode-map (kbd "C-c ^") 'lsp-rename)
(define-key lsp-mode-map (kbd "C-c &") 'lsp-find-references)
(define-key lsp-mode-map (kbd "M-<return>") 'helm-lsp-code-actions)
(define-key lsp-mode-map (kbd "C-U") 'lsp-find-definition)
(define-key lsp-mode-map (kbd "C-M-B") 'lsp-goto-implementation)
(define-key lsp-mode-map (kbd "C-N") 'helm-lsp-workspace-symbol)

(use-package dap-mode
  :ensure t)

(require 'dap-gdb-lldb)
(dap-gdb-lldb-setup)

(provide 'layer-lsp)

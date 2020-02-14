;; (use-package rust-mode
;;   :ensure t)

(use-package cargo
  :ensure t)

(use-package lsp-mode
  :ensure t)

(use-package company-lsp
  :ensure t)

(use-package lsp-treemacs
  :ensure t)

;; (use-package helm-lsp
;;   :ensure t)

;; (use-package highlight-numbers :ensure t
;;   :config
;;   (add-hook 'rust-mode-hook 'highlight-numbers-mode))

;; (add-hook 'rust-mode-hook 'linum-mode)

(use-package rustic
  :ensure t)

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'rustic-mode-hook 'highlight-numbers-mode))

(add-hook 'rustic-mode-hook 'linum-mode)
(setq lsp-keymap-prefix "C-c l")

(define-key lsp-mode-map (kbd "C-S-SPC") nil)
(define-key rustic-mode-map (kbd "C-M-L") 'rustic-format-buffer)

(defun my-rust-hook ()
  (setq truncate-lines t))

(add-hook 'rustic-mode-hook 'my-rust-hook)
(add-hook 'rustic-mode-hook 'auto-save-mode)

(push 'rustic-clippy flycheck-checkers)

(setq auto-save-visited-file-name t)

;; TODO:
;; (flycheck-list-errors)

(provide 'layer-lang-rust)

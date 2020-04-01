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

(use-package helm-lsp
  :ensure t)

(use-package rustic
  :ensure t
  :init
  (setq rustic-lsp-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-command '("~/.cargo/bin/ra_lsp_server"))
  (setq rustic-flycheck-setup-mode-line-p nil))

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'rustic-mode-hook 'highlight-numbers-mode))

(add-hook 'rustic-mode-hook 'linum-mode)
(setq lsp-keymap-prefix "C-c l")

(define-key lsp-mode-map (kbd "C-S-SPC") nil)
(define-key lsp-mode-map (kbd "S-<f6>") 'lsp-rename)
(define-key rustic-mode-map (kbd "C-M-L") 'rustic-format-buffer)

(defun my-rust-hook ()
  (setq truncate-lines t)
  (setq require-final-newline nil)
  (setq mode-require-final-newline nil)
  ;; (set (make-local-variable 'company-backends)
  ;;      '((company-lsp company-files :with company-yasnippet)
  ;;        (company-dabbrev-code company-dabbrev)))
  )

(add-hook 'rustic-mode-hook 'my-rust-hook)
(remove-hook 'rustic-mode-hook 'flycheck-mode)

;; (add-hook 'rustic-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'rustic-mode-hook 'fci-mode)

;; (setq rustic-lsp-server nil)
;; (setq rustic-analyzer-command, "")
;; (setq lsp-rust-analyzer-server-command '("~/.cargo/bin/rust-analyzer"))

;; (push 'rustic-clippy flycheck-checkers)

;; (setq auto-save-visited-file-name t)

(font-lock-add-keywords 'rustic-mode
                        '(("dyn" . font-lock-keyword-face)))

(font-lock-add-keywords 'rustic-mode
                        '(("\\<\\(TODO\\):" 1 font-lock-warning-face prepend)
                          ("\\<\\(FIXME\\):" 1 font-lock-doc-face prepend)))

(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)

(setq-default fci-rule-column 100)

;; TODO:
;; (flycheck-list-errors)

(provide 'layer-lang-rust)

(use-package cargo
  :ensure t)

(use-package rustic
  :ensure t
  :config (progn (add-to-list 'compilation-error-regexp-alist-alist
                              (cons 'rustic-error rustic-compilation-error))
                 (add-to-list 'compilation-error-regexp-alist-alist
                              (cons 'rustic-warning rustic-compilation-warning))
                 (add-to-list 'compilation-error-regexp-alist-alist
                              (cons 'rustic-info rustic-compilation-info))
                 (add-to-list 'compilation-error-regexp-alist-alist
                              (cons 'rustic-panic rustic-compilation-panic))

                 (add-to-list 'compilation-error-regexp-alist 'rustic-error)
                 (add-to-list 'compilation-error-regexp-alist 'rustic-warning)
                 (add-to-list 'compilation-error-regexp-alist 'rustic-info)
                 (add-to-list 'compilation-error-regexp-alist 'rustic-panic))
  :init
  (setq rustic-lsp-server 'rust-analyzer)
  (setq rustic-flycheck-setup-mode-line-p nil))

(defun create-rusty-tags ()
  "Create tags file."
  (interactive)
  (when (derived-mode-p 'sr-mode 'rustic-mode)
    (with-temp-buffer
      (shell-command "rusty-tags emacs -O TAGS" t))
    (message "Tags rebuilt sucessfully")))

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'rustic-mode-hook 'highlight-numbers-mode))

(add-hook 'rustic-mode-hook 'linum-mode)

(define-key rustic-mode-map (kbd "C-M-L") 'rustic-format-buffer)
(define-key rustic-mode-map (kbd "C-<return>") 'comment-indent-new-line)

(defun my-rust-hook ()
  (setq truncate-lines t)
  (setq require-final-newline nil)
  (setq mode-require-final-newline nil)
  (setq lsp-ui-doc-enable 0)

  (add-hook 'after-save-hook 'create-rusty-tags)

  ;; (set (make-local-variable 'company-backends)
  ;;      '((company-lsp company-files :with company-yasnippet)
  ;;        (company-dabbrev-code company-dabbrev)))
  )

(add-hook 'rustic-mode-hook 'my-rust-hook)
(remove-hook 'rustic-mode-hook 'flycheck-mode)

;; (add-hook 'rustic-mode-hook 'display-fill-column-indicator-mode)
;; (add-hook 'rustic-mode-hook 'fci-mode)

;; (setq rustic-lsp-server nil)
;; (setq rustic-analyzer-command, "")
;; (setq lsp-rust-analyzer-server-command '("~/.cargo/bin/rust-analyzer"))

;; (push 'rustic-clippy flycheck-checkers)

;; (setq auto-save-visited-file-name t)

(font-lock-add-keywords 'rustic-mode
                        '(("dyn" . font-lock-keyword-face)))

(font-lock-add-keywords 'rustic-mode
                        '(("\\<\\(TODO\\)\\(([a-zA-Z0-9_\.]+)\\)?:" 1 font-lock-warning-face prepend)
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

(setq rustic-lsp-server 'rust-analyzer)

(dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                                   :gdbpath "/usr/bin/gdb"
                                   :target nil
                                   :cwd nil))

;; TODO:
;; (flycheck-list-errors)

(defun save-all-and-cargo-run ()
  (interactive)
  (save-some-buffers 1)
  (projectile-run-compilation "cargo run"))

(defun save-all-and-cargo-clippy ()
  (interactive)
  (save-some-buffers 1)
  (projectile-run-compilation "cargo clippy"))

(defun save-all-and-cargo-test ()
  (interactive)
  (save-some-buffers 1)
  (projectile-run-compilation "cargo test"))

(defun save-all-and-cargo-doc ()
  (interactive)
  (save-some-buffers 1)
  (projectile-run-compilation "cargo doc"))

(defhydra hydra-run ()
  "Run"
  ("l" save-all-and-cargo-clippy "cargo clippy" :exit t)
  ("r" save-all-and-cargo-run "cargo run" :exit t)
  ("t" save-all-and-cargo-test "cargo test" :exit t)
  ("d" save-all-and-cargo-doc "cargo doc" :exit t)
  ("c" save-all-and-compile "custom" :exit t))

(define-key rustic-mode-map (kbd "C-6") 'hydra-run/body)

(provide 'layer-lang-rust)

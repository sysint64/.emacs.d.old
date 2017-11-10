(font-lock-add-keywords 'd-mode
                        '(("pragma" . font-lock-keyword-face)
                          ("function" . font-lock-keyword-face)
                          ("delegate" . font-lock-keyword-face)))

(font-lock-add-keywords 'd-mode
                        '(("\\<\\(TODO\\):" 1 font-lock-warning-face prepend)
                          ("\\<\\(FIXME\\):" 1 font-lock-doc-face prepend)))

(defun my-d-hook ()
  (setq-default indent-tabs-mode nil)
  (when (featurep 'yasnippet) (yas-minor-mode-on))

  (setq truncate-lines t)
  ;; (rainbow-identifiers-mode)

  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)

  (add-to-list
   'compilation-error-regexp-alist
   '("^\\([^ \n]+\\)@\\([^ \n]+\\):\\([0-9]+\\):\\([^\n]+\\)"
     2 3 nil (4 . 5)))

  (add-to-list
   'compilation-error-regexp-alist
   '("^\\([^ \n]+\\)(\\([0-9]+\\)): \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
     1 2 nil (3 . 4)))

  (add-to-list
   'compilation-error-regexp-alist
   '("^\\([^ \n]+\\):\\([0-9]+\\) \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
     1 2 nil (3 . 4)))

  (define-key d-mode-map (kbd "C-d") 'er/expand-region))

(use-package d-mode :ensure t
             :config
             (add-hook 'd-mode-hook 'my-d-hook)
             (use-package company-dcd :ensure t
                          :config
                          (add-hook 'd-mode-hook 'company-dcd-mode)))

(use-package rainbow-identifiers
             :init
             (add-hook 'd-mode-hook 'rainbow-identifiers-mode))

(provide 'layer-lang-d)

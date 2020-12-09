(use-package dart-mode :ensure t
  :custom
  (dart-sdk-path (concat (getenv "HOME") "/dev/flutter/bin/cache/dark-sdk/")
                 dart-format-on-save t))

(defun my-dart-hook ()
  (add-to-list 'compilation-error-regexp-alist 'dart-analyze)
  (add-to-list 'compilation-error-regexp-alist-alist '(dart-analyze "\\([^ ]*\\.dart\\):\\([0-9]+\\):\\([0-9]+\\)" 1 2 3))
  (setq tab-width 2)
  (setq lsp-dart-line-length 100)
  (setq truncate-lines t))

(use-package lsp-mode :ensure t)
(use-package lsp-dart
  :ensure t
  :hook (dart-mode . lsp))

(define-key lsp-mode-map (kbd "C-N") 'helm-lsp-workspace-symbol)
(define-key dart-mode-map (kbd "C-M-l") 'lsp-format-buffer)

(add-hook 'dart-mode-hook 'linum-mode)
(add-hook 'dart-mode-hook 'my-dart-hook)

;; (use-package lsp-ui :ensure t)
;; (setq lsp-ui-doc-enable nil)

(provide 'layer-lang-dart)

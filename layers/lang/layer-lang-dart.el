(use-package dart-mode :ensure t)

(use-package lsp-mode :ensure t)
(use-package lsp-dart
  :ensure t
  :hook (dart-mode . lsp))

(use-package lsp-ui :ensure t)

(setq lsp-ui-doc-enable 0)

(provide 'layer-lang-dart)

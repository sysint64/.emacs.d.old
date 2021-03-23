(use-package swift-mode :ensure t)

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

(define-key swift-mode-map (kbd "C-M-l") 'lsp-format-buffer)

(defun my-swift-hook ()
  (lsp)
  (setq truncate-lines t))

(add-hook 'swift-mode-hook 'linum-mode)
(add-hook 'swift-mode-hook 'my-swift-hook)

(provide 'layer-lang-swift)

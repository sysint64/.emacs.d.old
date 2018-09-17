(use-package go-mode
  :ensure t
  :bind (("C-M-L" . gofmt)
         ("M-RET" . go-import-add)
         ("C-c ." . godef-jump))
  :config
  (add-hook 'go-mode-hook 'highlight-numbers-mode)
  (add-hook 'go-mode-hook 'my-go-mode)
  (add-hook 'before-save-hook 'gofmt-before-save))

(defun my-go-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode 1))

(provide 'layer-lang-go)

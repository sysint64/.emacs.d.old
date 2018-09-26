(use-package js2-mode :ensure t)

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'js2-mode-hook 'highlight-numbers-mode)
  (add-hook 'js2-mode-hook 'linum-mode)
  (add-hook 'js2-mode-hook (lambda () (setq truncate-lines t))))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(provide 'layer-lang-js)

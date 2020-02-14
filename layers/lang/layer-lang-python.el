(defun my-python-hook ()
  (setq truncate-lines t)
  (define-key python-mode-map (kbd "C-d") 'er/expand-region))

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'python-mode-hook 'highlight-numbers-mode))

(use-package jedi :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi:setup))

(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'my-python-hook)

(provide 'layer-lang-python)

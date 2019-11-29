(c-set-offset 'case-label '+)
(setq-default c-basic-offset 4)

(defun my-c-hook ()
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'brace-list-intro '+)
  (setq truncate-lines t)
  (define-key c-mode-map (kbd "C-d") 'er/expand-region)
  (define-key c++-mode-map (kbd "C-d") 'er/expand-region))

(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'my-c-hook)
(add-hook 'c++-mode-hook 'my-c-hook)

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'c-mode-common-hook 'highlight-numbers-mode))

(add-hook 'c-mode-common-hook 'linum-mode)

(provide 'layer-lang-cpp)

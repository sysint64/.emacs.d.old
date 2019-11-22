(c-set-offset 'case-label '+)
(setq-default c-basic-offset 4)

(defun my-c-hook ()
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (define-key c-mode-map (kbd "C-d") 'er/expand-region)
  (define-key c++-mode-map (kbd "C-d") 'er/expand-region))

(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'my-c-hook)

(provide 'layer-lang-cpp)

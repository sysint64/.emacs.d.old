(c-set-offset 'case-label '+)
(setq-default c-basic-offset 4)

(defun my-c-hook ()
  (define-key cpp-mode-map (kbd "C-d") 'er/expand-region))

(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'cpp-mode-hook 'my-c-hook)

(provide 'layer-lang-cpp)

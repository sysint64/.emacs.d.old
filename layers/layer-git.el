(use-package magit :ensure t
             :bind (("M-9" . magit-log)
                    ("M-C-k" . magit-status)
                    ("C-c k" . magit-commit)
                    ("C-c C-S-k" . magit-push)))

(use-package diff-hl :ensure t
             :init
             (global-diff-hl-mode)
             (diff-hl-flydiff-mode))

(provide 'layer-git)

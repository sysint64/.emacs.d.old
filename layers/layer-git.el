(use-package magit :ensure t
             :bind (("M-9" . magit-log)
                    ("M-C-k" . magit-status)
                    ("C-k" . magit-commit)
                    ("C-S-k" . magit-push)))

(use-package diff-hl :ensure t
             :init
             (global-diff-hl-mode))

(provide 'layer-git)

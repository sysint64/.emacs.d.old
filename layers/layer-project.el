(use-package bs :ensure t
             :bind (("<f2>" . bs-show))
             :init
             (setq bs-configurations
                   '(("files" "^\\*scratch\\*"
                      nil nil bs-visits-non-file bs-sort-buffer-interns-are-last))))

(use-package helm :ensure t
             :bind (("C-<f12>" . helm-semantic-or-imenu)
                    ("<f12>" . helm-occur)))

(use-package yasnippet :ensure t
             :init
             (yas-global-mode 1)
             (yas/load-directory "~/.emacs.d/snippets"))

(provide 'layer-project)

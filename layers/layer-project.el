(use-package bs :ensure t
             :bind ("<f2>" . bs-show)
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

(use-package projectile :ensure t
             :bind ("S-<f10>" . projectile-compile-project)
             :init
             (projectile-mode)
             :config
             (use-package helm-projectile :ensure t
                          :bind (("C-S-n" . helm-projectile)
                                 ("C-n" . helm-projectile-grep)
                                 ("C-e" . helm-projectile-recentf))
                          :init
                          (setq projectile-completion-system 'helm)
                          (helm-projectile-on)
                          (add-to-list 'projectile-globally-ignored-directories ".dub")))

(use-package hideshow :ensure t
             :init
             (defvar hs-special-modes-alist
               (mapcar 'purecopy
                       '((c-mode "{" "}" "/[*/]" nil nil)
                         (c++-mode "{" "}" "/[*/]" nil nil)
                         (d-mode "{" "}" "/[*/]" nil nil)
                         (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
                         (java-mode "{" "}" "/[*/]" nil nil)
                         (js-mode "{" "}" "/[*/]" nil)))))

;; TODO: setup
(use-package bookmark :ensure t
             :init
             (setq bookmark-save-flag t))

(use-package flycheck :ensure t)

(use-package column-marker :ensure t)

(use-package compile :ensure t)

(use-package smartparens :ensure t
             :init
             (smartparens-global-mode t))

(use-package company :ensure t
             :bind (("C-SPC" . company-complete)
                    ("S-C-SPC" . set-mark-command)
                    ("C-S-d" . mark-sexp))
             :init
             (global-company-mode))

(provide 'layer-project)

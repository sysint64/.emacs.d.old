(use-package bs :ensure t
             :bind ("C-2" . bs-show)
             :init
             (setq bs-configurations
                   '(("files" "^\\*scratch\\*"
                      nil nil bs-visits-non-file bs-sort-buffer-interns-are-last))))

(use-package helm :ensure t
             :init
             (setq helm-split-window-default-side 'below)
             (setq helm-split-window-inside-p t)
             :bind (("C-8" . helm-semantic-or-imenu)
                    ("C-9" . helm-occur)))

(use-package ggtags :ensure t)
(use-package helm-gtags :ensure t)

(use-package yasnippet :ensure t
             :init
             (yas-global-mode 1)
             (yas/load-directory "~/.emacs.d/snippets"))

(defun save-all-and-compile ()
  (interactive)
  (save-some-buffers 1)
  (projectile-compile-project ()))

(use-package projectile :ensure t
             :bind (("C-7" . save-all-and-compile)
                    ("C-S-r" . projectile-replace))
             :init
             (projectile-mode)
             :config
             (defun my-helm-init ()
                    (setq projectile-completion-system 'helm)
                    (require 'helm-projectile)
                    (helm-projectile-on)
                    (add-to-list 'projectile-globally-ignored-directories ".dub"))
             (setq projectile-project-compilation-cmd "")

             ;; Graphical mode
             (use-package helm-projectile :ensure t
                          :if window-system
                          :bind (("C-S-n" . helm-projectile)
                                 ("C-n" . helm-projectile-grep)
                                 ("C-e" . helm-projectile-recentf))
                          :init
                          (my-helm-init))

             ;; Terminal mode
             (use-package helm-projectile :ensure t
                          :unless window-system
                          :bind (("C-f" . helm-projectile)
                                 ("C-o" . helm-projectile-grep)
                                 ("C-e" . helm-projectile-recentf))
                          :init
                          (my-helm-init)))

(use-package hideshow :ensure t
             :bind (("<f9>" . hs-toggle-hiding)
                    ("C-<f9>" . hs-hide-level)
                    ("C-S-<f9>" . hs-show-all))
             :init
             (defvar hs-special-modes-alist
               (mapcar 'purecopy
                       '((c-mode "{" "}" "/[*/]" nil nil)
                         (c++-mode "{" "}" "/[*/]" nil nil)
                         (d-mode "{" "}" "/[*/]" nil nil)
                         (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
                         (java-mode "{" "}" "/[*/]" nil nil)
                         (js-mode "{" "}" "/[*/]" nil))))
             (defun hs-hide-all-comments ()
               "Hide all top level blocks, if they are comments, displaying only first line.
Move point to the beginning of the line, and run the normal hook
`hs-hide-hook'.  See documentation for `run-hooks'."
               (interactive)
               (hs-life-goes-on
                (save-excursion
                  (unless hs-allow-nesting
                    (hs-discard-overlays (point-min) (point-max)))
                  (goto-char (point-min))
                  (let ((spew (make-progress-reporter "Hiding all comment blocks..."
                                                      (point-min) (point-max)))
                        (re (concat "\\(" hs-c-start-regexp "\\)")))
                    (while (re-search-forward re (point-max) t)
                      (if (match-beginning 1)
                          ;; found a comment, probably
                          (let ((c-reg (hs-inside-comment-p)))
                            (when (and c-reg (car c-reg))
                              (if (> (count-lines (car c-reg) (nth 1 c-reg)) 1)
                                  (hs-hide-block-at-point t c-reg)
                                (goto-char (nth 1 c-reg))))))
                      (progress-reporter-update spew (point)))
                    (progress-reporter-done spew)))
                (beginning-of-line)
                (run-hooks 'hs-hide-hook)))
             )

;; (use-package hide-comnt :ensure t)

;; TODO: setup
(use-package bookmark :ensure t
             :init
             (setq bookmark-save-flag t))

(use-package flycheck :ensure t
             :init
             (add-hook 'after-init-hook #'global-flycheck-mode))

;; (use-package column-marker :ensure t)

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

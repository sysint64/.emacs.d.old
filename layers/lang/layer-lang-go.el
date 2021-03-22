(use-package go-mode
  :ensure t
  :bind (("C-M-L" . gofmt)
         ;; ("M-RET" . go-import-add)
         ;; ("C-c ." . godef-jump)
         ))

;; marker: $_i18n_$
(fset 'i18n_struct_param_go
   (kmacro-lambda-form [?\C-f ?\C-y return ?\C-f ?\" return ?\C-d ?\C-q ?\C-r ?$ ?_ ?i ?1 ?8 ?n ?_ ?$ return ?\S-\C-o ?v ?a ?r ?  ?s ?t ?r ?\C-y ?\S-\C-  C-left right right right ?\S-\C-e ?s ?t ?r ?i tab ?i ?n ?f tab ?c ?a ?m ?e tab return ?  ?= ?  ?i ?1 ?8 ?n ?. ?I ?D ?\( ?\" ?\C-y ?\C-d ?\C-q ?\C-f ?\C-y ?\C-f return ?\C-d ?\S-\C-e up return delete C-left backspace ?s ?t ?r end ?\C-y ?\M-y ?\M-y left ?\C-d ?\C-w] 0 "%d"))

(defun my-go-hook ()
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq indent-tabs-mode 1))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(add-hook 'go-mode-hook #'lsp-deferred)

(add-hook 'go-mode-hook 'highlight-numbers-mode)
(add-hook 'go-mode-hook 'my-go-hook)
(add-hook 'go-mode-hook 'linum-mode)

(provide 'layer-lang-go)

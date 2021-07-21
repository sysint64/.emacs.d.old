(use-package lsp-julia :ensure t
  :config
  (setq lsp-julia-default-environment "~/.julia/environments/v1.6"))

(require 'julia-mode)
(add-hook 'ess-julia-mode-hook #'lsp-mode)
(add-hook 'julia-mode-hook #'lsp-mode)

(provide 'layer-lang-julia)

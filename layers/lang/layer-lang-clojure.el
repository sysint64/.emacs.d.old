(use-package cider :ensure t)
(use-package clj-refactor :ensure t)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1))

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'linum-mode)

(provide 'layer-lang-clojure)

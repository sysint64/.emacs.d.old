(use-package ensime
  :ensure t)

(use-package sbt-mode)

(use-package scala-mode)

(define-key ensime-mode-map (kbd "C-c .") 'ensime-edit-definition)
(define-key ensime-mode-map (kbd "C-c ,") 'ensime-pop-find-definition-stack)
(define-key ensime-mode-map (kbd "C-c i") 'ensime-import-type-at-point)

(provide 'layer-lang-scala)

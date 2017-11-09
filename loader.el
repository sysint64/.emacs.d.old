(defun load-layers ()
  (add-to-list 'load-path (concat user-emacs-directory "layers"))

  (require 'layer-general)
  (require 'layer-buffer)
  (require 'layer-project)
  (require 'layer-git)

  ;; Languages
  (add-to-list 'load-path (concat user-emacs-directory "layers/lang"))

  ;; Appearence
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/color-themes"))
  (add-to-list 'load-path (concat user-emacs-directory "themes"))
  (add-to-list 'load-path (concat user-emacs-directory "themes/color-themes"))

  (require 'theme-dark)

  (set-default-font "Inconsolata-g-14")
  (set-default-font "Inconsolata-14"))

(provide 'loader)

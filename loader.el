(defun load-layers ()
  (add-to-list 'load-path "~/.emacs.d/layers")

  (require 'layer-general)
  (require 'layer-project)
  (require 'layer-git)

  ;; Languages
  (add-to-list 'load-path "~/.emacs.d/layers/lang")

  ;; Appearence
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/color-themes")
  (add-to-list 'load-path "~/.emacs.d/themes")
  (add-to-list 'load-path "~/.emacs.d/themes/color-themes")

  (require 'theme-dark)

  (set-default-font "Inconsolata-g-14")
  (set-default-font "Inconsolata-14"))

(provide 'loader)

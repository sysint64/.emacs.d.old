(defun load-layers ()
  (add-to-list 'load-path (concat user-emacs-directory "layers"))

  (require 'layer-general)
  (require 'layer-buffer)
  (require 'layer-project)
  (require 'layer-git)

  ;; Languages
  (add-to-list 'load-path (concat user-emacs-directory "layers/lang"))

  (require 'layer-lang-lisp)
  (require 'layer-lang-cpp)
  (require 'layer-lang-d)
  (require 'layer-lang-rpdl)
  (require 'layer-lang-json)

  ;; Appearence
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/color-themes"))
  (add-to-list 'load-path (concat user-emacs-directory "themes"))
  (add-to-list 'load-path (concat user-emacs-directory "themes/color-themes"))

  (require 'theme-light)

  (set-face-font 'default "Hack-12")
  )

(provide 'loader)

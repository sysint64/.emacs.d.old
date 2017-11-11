(load-theme 'wilson t)

(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
(set-face-attribute 'font-lock-constant-face nil :weight 'bold)
(set-face-foreground 'font-lock-constant-face "#9ba657")

(custom-set-faces
 '(window-divider ((t (:foreground "gray11"))))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil))))

(setq window-divider-default-right-width 2)
(window-divider-mode)

(custom-set-faces
 '(helm-header ((t (:background "#45413b" :foreground "#c7b386" :bold t))))
 '(helm-selection ((t (:background "#fade3e" :foreground "#1a1a18" :bold t))))
 '(helm-source-header ((t (:foreground "#242321" :foreground "#f4cf86" :weight bold :bold t))))
 '(helm-candidate-number ((t (:foreground "#c7b386"  :background "#45413b"  :bold t))))
 '(helm-selection-line ((t (:background "#242321" :foreground "#b88853" :bold t)))))

(custom-set-faces
 '(diff-hl-change ((t (:background "#5B6268"))))
 '(diff-hl-delete ((t (:background "#ff6c6b"))))
 '(diff-hl-insert ((t (:background "#98be65")))))

(setq diff-hl-draw-borders nil)

(use-package smart-mode-line :ensure t
             :init
             (setq sml/no-confirm-load-theme t)
             (setq sml/theme 'dark)
             (sml/setup))

(use-package rainbow-identifiers :ensure t
             :init
             (setq rainbow-identifiers-choose-face-function
                   'rainbow-identifiers-cie-l*a*b*-choose-face
                   rainbow-identifiers-cie-l*a*b*-lightness 50
                   rainbow-identifiers-cie-l*a*b*-saturation 20
                   rainbow-identifiers-cie-l*a*b*-color-count 65536))

(provide 'theme-dark)

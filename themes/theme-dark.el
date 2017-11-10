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

;; (use-package airline-themes :ensure t
;;              :config
;;              (load-theme 'airline-ubaryd))

(use-package rainbow-identifiers :ensure t
             :init
             (setq rainbow-identifiers-choose-face-function
                   'rainbow-identifiers-cie-l*a*b*-choose-face
                   rainbow-identifiers-cie-l*a*b*-lightness 50
                   rainbow-identifiers-cie-l*a*b*-saturation 20
                   rainbow-identifiers-cie-l*a*b*-color-count 65536))

(provide 'theme-dark)

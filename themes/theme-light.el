(load-theme 'brin t)
(load-theme 'mccarthy t)

(set-face-background 'show-paren-match "light blue")
(set-face-foreground 'show-paren-match "blue")
(set-face-attribute 'show-paren-match nil :weight 'normal)

(set-face-foreground 'font-lock-string-face "SpringGreen4")
(set-face-foreground 'font-lock-comment-face "dark gray")
(set-face-foreground 'font-lock-comment-delimiter-face "dark gray")

(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
(set-face-attribute 'font-lock-constant-face nil :weight 'bold)
(set-face-foreground 'font-lock-constant-face "#9ba657")

(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)

(set-face-foreground 'font-lock-constant-face "#DA3C01")
(set-face-attribute 'font-lock-constant-face nil :weight 'bold)
(set-face-foreground 'font-lock-function-name-face "#DA3C01")
(set-face-foreground 'font-lock-constant-face "#3b5998")

(custom-set-faces
 '(window-divider ((t (:foreground "gray11"))))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil))))

(setq window-divider-default-right-width 2)
(window-divider-mode)

(custom-set-faces
 '(helm-header ((t (:foreground "#B5BABF" :background "#262c34" :bold t))))
 '(helm-selection ((t (:background "#abb9bf" :bold t))))
 '(helm-source-header ((t (:foreground "#B5BABF" :foreground "#1f1f1f" :weight bold :bold t)))))

(custom-set-faces
 '(diff-hl-change ((t (:background "wheat"))))
 '(diff-hl-delete ((t (:background "RosyBrown1"))))
 '(diff-hl-insert ((t (:background "DarkSeaGreen2")))))

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
                   rainbow-identifiers-cie-l*a*b*-saturation 50
                   rainbow-identifiers-cie-l*a*b*-color-count 65536))

(provide 'theme-light)

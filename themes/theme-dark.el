(load-theme 'monokai t)

(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
(set-face-attribute 'font-lock-constant-face nil :weight 'bold)
;; (set-face-foreground 'font-lock-constant-face "#9ba657")
(set-face-attribute 'region nil :foreground "#fff" :background "#5974ab")

(custom-set-faces
 '(window-divider ((t (:foreground "gray11"))))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil))))

(setq window-divider-default-right-width 2)
(window-divider-mode)

(set-face-attribute 'highlight-numbers-number nil :weight 'normal)
(set-face-attribute 'font-lock-rpdl-number-face nil :weight 'normal)

(set-face-foreground 'font-lock-attribute-face "#ffc524")
(set-face-attribute 'font-lock-attribute-face nil :weight 'normal)

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

(set-face-italic 'font-lock-comment-face t)

;;

(global-linum-mode 1)

(set-face-background 'fringe "#000")
(set-face-background 'linum "#000")
(set-face-foreground 'linum "#fff")
(set-fringe-mode '(8 . 0))

(setq linum-format " %4i")

(global-linum-mode 0)

;; RPDL

(set-face-foreground 'font-lock-rpdl-ref-face "#66d9ef")
(set-face-background 'font-lock-rpdl-ref-face "#234")
(set-face-attribute 'font-lock-rpdl-ref-face nil :weight 'normal)
(set-face-attribute 'font-lock-rpdl-ref-face nil :underline t)
(set-face-foreground 'font-lock-rpdl-enum "#66d9ef")
(set-face-attribute 'font-lock-rpdl-enum nil :weight 'bold)

;; D

(set-face-foreground 'font-lock-dlang-ddoc-macro-face "#888")
(set-face-background 'font-lock-dlang-ddoc-macro-face "#234")
(set-face-attribute 'font-lock-dlang-ddoc-macro-face nil :weight 'normal :slant 'italic)

(set-face-foreground 'font-lock-dlang-ddoc-identifier-face "#888")
(set-face-attribute 'font-lock-dlang-ddoc-identifier-face nil :weight 'normal)

(set-face-foreground 'font-lock-dlang-ddoc-comment-keyword-face "#888")
(set-face-attribute 'font-lock-dlang-ddoc-comment-keyword-face nil :weight 'bold :underline t)

(set-face-foreground 'font-lock-dlang-url-face "#00c")
(set-face-background 'font-lock-dlang-url-face "#233d23")
(set-face-attribute 'font-lock-dlang-url-face nil :weight 'normal :underline t)

(set-face-foreground 'font-lock-dlang-string-interpolation-face "#00c")
(set-face-background 'font-lock-dlang-string-interpolation-face "#233d23")
(set-face-attribute 'font-lock-dlang-string-interpolation-face nil :weight 'bold)

(set-face-foreground 'font-lock-dlang-template-type-face "#20999D")
(set-face-attribute 'font-lock-dlang-template-type-face nil :weight 'normal)

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

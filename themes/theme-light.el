(load-theme 'brin t)
(load-theme 'mccarthy t)

(set-face-foreground 'default "#444")

(set-face-background 'show-paren-match "#99ccff")
(set-face-foreground 'show-paren-match "#1e0039")
(set-face-attribute 'show-paren-match nil :weight 'normal)

(set-face-attribute 'region nil :foreground "#fff" :background "#5974ab")

(set-face-foreground 'font-lock-string-face "#008002")
(set-face-attribute 'font-lock-string-face nil :weight 'bold)

(set-face-foreground 'font-lock-comment-face "#999999")
(set-face-foreground 'font-lock-comment-delimiter-face "#999999")
(set-face-italic 'font-lock-comment-face t)

(global-linum-mode 1)

(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
(set-face-attribute 'font-lock-constant-face nil :weight 'bold)

(set-face-foreground 'font-lock-constant-face "#000081")
(set-face-background 'fringe "#f0f0f0")
(set-face-background 'linum "#f0f0f0")
(set-fringe-mode '(8 . 0))

(set-face-attribute 'font-lock-type-face nil :weight 'normal)
(set-face-foreground 'font-lock-type-face "#371F80")

;; (set-face-foreground 'js2-external-variable "#371F80")

(global-linum-mode 0)

(set-face-foreground 'font-lock-attribute-face "#83850f")
(set-face-attribute 'font-lock-attribute-face nil :weight 'normal)

;; RPDL

(set-face-foreground 'font-lock-rpdl-ref-face "#0000ff")
(set-face-background 'font-lock-rpdl-ref-face "#ecfaeb")
(set-face-attribute 'font-lock-rpdl-ref-face nil :weight 'bold)
(set-face-foreground 'font-lock-rpdl-enum "#660E7A")
(set-face-attribute 'font-lock-rpdl-enum nil :weight 'bold)

;; D

(set-face-foreground 'font-lock-dlang-ddoc-macro-face "#555")
(set-face-background 'font-lock-dlang-ddoc-macro-face "#ecfaeb")
(set-face-attribute 'font-lock-dlang-ddoc-macro-face nil :weight 'normal)

(set-face-foreground 'font-lock-dlang-ddoc-identifier-face "#555")
(set-face-attribute 'font-lock-dlang-ddoc-identifier-face nil :weight 'normal)

(set-face-foreground 'font-lock-dlang-ddoc-comment-keyword-face "#555")
(set-face-attribute 'font-lock-dlang-ddoc-comment-keyword-face nil :weight 'bold :underline t)

(set-face-foreground 'font-lock-dlang-url-face "#00c")
(set-face-background 'font-lock-dlang-url-face "#ecfaeb")
(set-face-attribute 'font-lock-dlang-url-face nil :weight 'normal :underline t)

(set-face-foreground 'font-lock-dlang-string-interpolation-face "#00c")
(set-face-background 'font-lock-dlang-string-interpolation-face "#ecfaeb")
(set-face-attribute 'font-lock-dlang-string-interpolation-face nil :weight 'bold)

(set-face-foreground 'font-lock-dlang-template-type-face "#20999D")
(set-face-attribute 'font-lock-dlang-template-type-face nil :weight 'normal)

;; Scala

;; (set-face-attribute 'scala-font-lock:sealed-face nil :weight 'bold)
;; (set-face-foreground 'scala-font-lock:sealed-face "#000081")

;; (set-face-attribute 'scala-font-lock:final-face nil :weight 'bold)
;; (set-face-foreground 'scala-font-lock:final-face "#000081")

;; (set-face-attribute 'scala-font-lock:implicit-face nil :weight 'bold)
;; (set-face-foreground 'scala-font-lock:implicit-face "#000081")

(set-background-color "#ffffff")

(set-face-attribute 'highlight-numbers-number nil :weight 'normal)
(set-face-foreground 'highlight-numbers-number "#0703f5")

(set-face-attribute 'font-lock-rpdl-number-face nil :weight 'normal)
(set-face-foreground 'font-lock-rpdl-number-face "#0703f5")

(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
(set-face-foreground 'font-lock-keyword-face "#000081")

(set-face-background 'highlight "#e4e4ff")
(set-face-background 'sp-show-pair-match-face "#ccccff")

;; #e4e4ff
(set-face-foreground 'company-tooltip "#fff")

;; (set-face-foreground 'font-lock-constant-face "#DA3C01")
;; (set-face-attribute 'font-lock-constant-face nil :weight 'bold)

(set-face-foreground 'font-lock-function-name-face "#DA3C01")
;; (set-face-foreground 'font-lock-function-name-face "#00627A") ;; IDEA color

;; (set-face-foreground 'font-lock-constant-face "#3b5998")

(set-face-attribute 'flycheck-fringe-warning nil :foreground (face-attribute 'fringe :background ))

(custom-set-faces
 '(window-divider ((t (:foreground "gray11"))))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil)))
 '(flycheck-warning ((t (:underline nil :background "#f6ebbc" :foreground "#444"))))
 '(hl-line ((t (:underline nil :background "#fffae3"))))
 '(company-scrollbar-bg ((t (:background "#d2dce7"))))
 '(company-scrollbar-fg ((t (:background "#8eb4de"))))
 '(company-tooltip ((t (:inherit default :background "#ebf4fe"))))
 '(company-tooltip-annotation ((t (:foreground "#a0a0a0"))))
 '(company-tooltip-common ((t (:foreground "#bd00c4"))))
 '(company-tooltip-common-selection ((t (:foreground "#eadcbb"))))
 '(company-tooltip-selection ((t (:background "#5974ab" :foreground "#fff")))))

(setq window-divider-default-right-width 2)
(window-divider-mode)

(custom-set-faces
 '(helm-header ((t (:foreground "#B5BABF" :background "#262c34" :bold t))))
 '(helm-selection ((t (:foreground "#fff" :background "#5974ab" :bold t))))
 '(helm-match ((t (:foreground "#bd00c4" :bold t))))
 '(helm-source-header ((t (:foreground "#B5BABF" :foreground "#1f1f1f" :weight bold :bold t)))))

(custom-set-faces
 '(diff-hl-change ((t (:background "#c3d6e8"))))
 '(diff-hl-delete ((t (:background "RosyBrown1"))))
 '(diff-hl-insert ((t (:background "#c9dec1")))))

(setq diff-hl-draw-borders nil)

(use-package smart-mode-line :ensure t
             :init
             (setq sml/no-confirm-load-theme t)
             (setq sml/theme 'dark)
             (sml/setup))

(provide 'theme-light)

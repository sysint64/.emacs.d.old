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

(provide 'theme-dark)

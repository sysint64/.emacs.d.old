(use-package sqlformat :ensure t)

(setq sqlformat-command 'pgformatter)
(setq sqlformat-args '("-s2" "-g"))

(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)
;; (define-key sql-mode-map (kbd "C-M-l") 'sqlformat)

(provide 'layer-lang-sql)

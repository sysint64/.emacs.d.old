(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

(menu-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode 1)
(scroll-bar-mode -1)

(use-package neotree :ensure t
             :bind ("M-1" . neotree-toggle)
             :init
             (setq neo-smart-open t)
             (setq neo-fit-to-contents t)
             ;; (setq neo-vc-integration t)
             (setq neo-cwd-line-style 'text)
             (setq neo-theme 'ascii)
             :config
             (custom-set-variables
              '(neo-vc-integration (quote (face)))))

(setq show-paren-style 'parenthesis)
(show-paren-mode 1)

(use-package highlight-parentheses :ensure t
             :init
             (global-highlight-parentheses-mode))

(use-package ido :ensure t
             :init
             (ido-mode 1)
             (setq ido-enable-flex-matching 1))

(use-package multiple-cursors :ensure t
             :bind (("C-S-l" . mc/edit-lines)
                    ("M-S-<down>" . mc/mark-next-like-this)
                    ("M-S-<up>" . mc/mark-previous-like-this)
                    ("M-C-S-j" . mc/mark-all-like-this)
                    ("M-j" . mc/mark-next-like-this-word)))

(use-package highlight-symbol :ensure t
             :bind (("C-<f3>" . highlight-symbol)
                    ("<f3>" . highlight-symbol-next)
                    ("S-<f3>" . highlight-symbol-prev)
                    ("M-<f3>" . highlight-symbol-query-replace)))

(use-package highlight-numbers :ensure t
             :init
             (add-hook 'c-mode-hook 'highlight-numbers-mode))

(use-package expand-region :ensure t
             :bind ("C-d" . er/expand-region))

(global-set-key (kbd "C-a") 'mark-whole-buffer)

(use-package undo-tree :ensure t
             :bind (("C-z" . undo-tree-undo)
                    ("C-S-z" . undo-tree-redo))
             :init (global-undo-tree-mode))

(add-hook 'before-save-hook     'delete-trailing-whitespace)

(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))

(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position))
      (next-line))
    (comment-or-uncomment-region beg end)))

(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-\\") 'comment-or-uncomment-region-or-line)
(setq-default indent-tabs-mode nil)

(defun comment-line ()
  "Fill line with `-` symbol"
  (interactive)
  (setq cursor-position (- (line-end-position) (line-beginning-position)))
  (insert-char (aref "-" 0) (- 100 cursor-position)))

(global-set-key (kbd "C--")  'comment-line)

(provide 'layer-general)

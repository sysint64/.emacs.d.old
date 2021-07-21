(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving
(setq compilation-scroll-output 'first-error)
(setq compilation-skip-threshold 2)
(setq compilation-auto-jump-to-first-error t)
(setq mouse-wheel-progressive-speed nil)
(setq use-dialog-box nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode 1)
(scroll-bar-mode -1)
(setq frame-resize-pixelwise t)
(setq ring-bell-function 'ignore)
(setq input-method-use-echo-area 'nil)
(setq echo-keystrokes 0)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq dired-dwim-target t)

(defalias 'doc-view-mode #'doc-view-fallback-mode)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq tags-revert-without-query 1)

(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(global-set-key (kbd "C-f") 'isearch-forward)

(use-package hydra :ensure t
  :config (setq hydra-is-helpful t
                hydra-lv t
                lv-use-separator t))

(defun save-all ()
  (interactive)[]
  (save-some-buffers 1))

(defun replace-last-sexp ()
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (kill-sexp -1)
    (insert (format "%S" value))))

(defhydra hydra-action ()
  "action"
  ("a" org-agenda "agenda" :exit t)
  ("f" make-empty-file "file" :exit t)
  ("d" make-directory "directory" :exit t)
  ("s" save-all "save all" :exit t)
  ("g" text-scale-increase "text scale increase")
  ("l" text-scale-decrease "text scale decrease")
  ("e" replace-last-sexp "eval last sexp and replace"))

(global-set-key (kbd "C-c a") 'hydra-action/body)

(use-package exec-path-from-shell :ensure t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(use-package avy :ensure t
  :bind (("C-s" . avy-goto-char)
         ("M-g g" . 'avy-goto-line)))

(use-package neotree :ensure t
  :bind (("C-1" . neotree-toggle)
         ("C-3" . neotree-find))
  :init
  (setq neo-smart-open t)
  (setq neo-fit-to-contents t)
  ;; (setq neo-vc-integration t)
  (setq neo-window-fixed-size nil)
  (setq neo-window-width 60)
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
  (setq ido-enable-flex-matching 1)
  (setq ido-auto-merge-work-directories-length -1))

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
(global-set-key (kbd "C-q") 'kill-ring-save)
(global-set-key (kbd "C-S-e") 'helm-M-x)

(global-set-key (kbd "C-x C-g") 'goto-line)

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
(global-set-key (kbd "M-<f12>") 'shell)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
    	  (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
    	(insert "\n"))

      ;; now insert as many time as requested
      (while (> n 0)
    	(insert current-line)
    	(decf n)))))

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(global-set-key (kbd "C-S-<up>") 'move-line-up)
(global-set-key (kbd "C-S-<down>") 'move-line-down)
(global-set-key (kbd "C-c C-d") 'duplicate-current-line)
(global-set-key (kbd "C-c C-g") 'revert-buffer-no-confirm)

(provide 'layer-general)

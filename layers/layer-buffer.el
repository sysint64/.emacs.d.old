(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

(use-package buffer-move :ensure t
             :bind (("C-S-c <left>" . buf-move-left)
                    ("C-S-c <right>" . buf-move-right)
                    ("C-S-c <up>" . buf-move-up)
                    ("C-S-c <down>" . buf-move-down)))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-c e") 'eval-and-replace)

(defun my-enlarge-vert ()
  (interactive)
  (enlarge-window 2))

(defun my-shrink-vert ()
  (interactive)
  (enlarge-window -2))

(defun my-enlarge-horz ()
  (interactive)
  (enlarge-window-horizontally 2))

(defun my-shrink-horz ()
  (interactive)
  (enlarge-window-horizontally -2))

(global-set-key (kbd "C-(") 'my-shrink-vert)
(global-set-key (kbd "C-)") 'my-enlarge-vert)
(global-set-key (kbd "M-C-(") 'my-shrink-horz)
(global-set-key (kbd "M-C-)") 'my-enlarge-horz)

(defun expand-current-window ()
  (interactive)
  (window-configuration-to-register '1)
  (delete-other-windows))

(defun restore-window-config ()
  (interactive)
  (jump-to-register '1))

(global-set-key (kbd "C-x 1") 'expand-current-window)
(global-set-key (kbd "C-x 4") 'restore-window-config)

(provide 'layer-buffer)

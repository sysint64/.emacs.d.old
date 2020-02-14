(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

(use-package buffer-move :ensure t
             :bind (("C-S-c <left>" . buf-move-left)
                    ("C-S-c <right>" . buf-move-right)
                    ("C-S-c <up>" . buf-move-up)
                    ("C-S-c <down>" . buf-move-down)))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key (kbd "<home>") 'smarter-move-beginning-of-line)
(global-set-key (kbd "M-<up>") 'forward-sexp)
(global-set-key (kbd "M-<down>") 'backward-sexp)

(if (eq system-type 'darwin)
  (global-set-key (kbd "C-<left>") 'smarter-move-beginning-of-line)
)

(if (eq system-type 'darwin)
  (global-set-key (kbd "C-<right>") 'move-end-of-line)
)

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

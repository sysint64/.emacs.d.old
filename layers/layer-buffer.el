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

(defun bookmark-jump-and-save (name)
  (bookmark-set "0")
  (bookmark-jump name))

(defun bookmark-set-1 () (interactive) (bookmark-set "1") (message "Bookmark was set"))
(defun bookmark-set-2 () (interactive) (bookmark-set "2") (message "Bookmark was set"))
(defun bookmark-set-3 () (interactive) (bookmark-set "3") (message "Bookmark was set"))
(defun bookmark-set-4 () (interactive) (bookmark-set "4") (message "Bookmark was set"))
(defun bookmark-set-5 () (interactive) (bookmark-set "5") (message "Bookmark was set"))
(defun bookmark-set-6 () (interactive) (bookmark-set "6") (message "Bookmark was set"))
(defun bookmark-set-7 () (interactive) (bookmark-set "7") (message "Bookmark was set"))
(defun bookmark-set-8 () (interactive) (bookmark-set "8") (message "Bookmark was set"))
(defun bookmark-set-9 () (interactive) (bookmark-set "9") (message "Bookmark was set"))
(defun bookmark-set-0 () (interactive) (bookmark-set "0") (message "Bookmark was set"))

(global-unset-key (kbd "C-b"))
(global-unset-key (kbd "C-j"))

(global-set-key (kbd "C-c a") 'bookmark-set-1)
(global-set-key (kbd "C-c s") 'bookmark-set-2)
(global-set-key (kbd "C-c d") 'bookmark-set-3)
(global-set-key (kbd "C-c f") 'bookmark-set-4)
(global-set-key (kbd "C-c j") 'bookmark-set-5)
(global-set-key (kbd "C-c k") 'bookmark-set-6)
(global-set-key (kbd "C-c l") 'bookmark-set-7)
(global-set-key (kbd "C-c ;") 'bookmark-set-8)
(global-set-key (kbd "C-c 9") 'bookmark-set-9)
(global-set-key (kbd "C-c 0") 'bookmark-set-0)

(defun bookmark-jump-1 () (interactive) (bookmark-jump-and-save "1"))
(defun bookmark-jump-2 () (interactive) (bookmark-jump-and-save "2"))
(defun bookmark-jump-3 () (interactive) (bookmark-jump-and-save "3"))
(defun bookmark-jump-4 () (interactive) (bookmark-jump-and-save "4"))
(defun bookmark-jump-5 () (interactive) (bookmark-jump-and-save "5"))
(defun bookmark-jump-6 () (interactive) (bookmark-jump-and-save "6"))
(defun bookmark-jump-7 () (interactive) (bookmark-jump-and-save "7"))
(defun bookmark-jump-8 () (interactive) (bookmark-jump-and-save "8"))
(defun bookmark-jump-9 () (interactive) (bookmark-jump-and-save "9"))
(defun bookmark-jump-0 () (interactive) (bookmark-jump "0"))

(global-set-key (kbd "C-c C-x a") 'bookmark-jump-1)
(global-set-key (kbd "C-c C-x s") 'bookmark-jump-2)
(global-set-key (kbd "C-c C-x d") 'bookmark-jump-3)
(global-set-key (kbd "C-c C-x f") 'bookmark-jump-4)
(global-set-key (kbd "C-c C-x j") 'bookmark-jump-5)
(global-set-key (kbd "C-c C-x k") 'bookmark-jump-6)
(global-set-key (kbd "C-c C-x l") 'bookmark-jump-7)
(global-set-key (kbd "C-c C-x ;") 'bookmark-jump-8)
(global-set-key (kbd "C-c C-x 9") 'bookmark-jump-9)
(global-set-key (kbd "C-c C-x 0") 'bookmark-jump-0)

(provide 'layer-buffer)

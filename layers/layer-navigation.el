(global-set-key (kbd "<escape>") 'my-navigation-mode)

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

(defun open-next-line ()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (my-navigation-mode 0))

(defun open-prev-line ()
  (interactive)
  (previous-line)
  (end-of-line)
  (newline-and-indent)
  (my-navigation-mode 0))

(global-set-key (kbd "C-o") 'open-next-line)
(global-set-key (kbd "C-S-o") 'open-prev-line)

(define-minor-mode my-navigation-mode
  "navigation layer"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "j") 'previous-line)
            (define-key map (kbd "k") 'next-line)
            (define-key map (kbd "f") 'right-char)
            (define-key map (kbd "d") 'left-char)
            (define-key map (kbd "v") 'right-word)
            (define-key map (kbd "c") 'left-word)
            (define-key map (kbd "n") 'backward-paragraph)
            (define-key map (kbd "m") 'forward-paragraph)
            (define-key map (kbd "t") 'move-end-of-line)
            (define-key map (kbd "r") 'smarter-move-beginning-of-line)
            (define-key map (kbd "u") 'beginning-of-buffer)
            (define-key map (kbd "i") 'end-of-buffer)
            (define-key map (kbd "M-j") 'forward-sexp)
            (define-key map (kbd "M-k") 'backward-sexp)
            map)
  ;; (if my-navigation-mode (read-only-mode 1) (read-only-mode 0))
  )

(provide 'layer-navigation)

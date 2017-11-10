(setq rpdl-font-lock-keywords
      `((,"#.*" . font-lock-comment-face)
        (,"\\btrue\\b\\|\\bfalse\\b" . font-lock-constant-face)
        (,"\\b[a-zA-Z]\\([a-zA-Z0-9_]+\\)?\\b\\(\s+\\)?:" . font-lock-variable-name-face)
        (,"\\b[A-Z]\\([a-zA-Z0-9_]+\\)?\\b\\|include" . font-lock-keyword-face)
        (,"\\b[0-9.]+\\b" . font-lock-constant-face)
        ))

(defun rpdl-extra-font-lock-is-in-double-quoted-string ()
  "Non-nil if point in inside a double-quoted string."
  (let ((state (syntax-ppss)))
    (eq (nth 3 state))))

(defun rpdl-extra-font-lock-match-ref-in-double-quoted-string (limit)
  "Search for reference in double-quoted strings."
  (let (res)
    (while
        (and (setq res
                   (re-search-forward
                    "@[a-zA-Z0-9.]+"
                    limit t))
             (not (rpdl-extra-font-lock-is-in-double-quoted-string))))
    res))

(defvar rpdl-extra-font-lock-keywords
  '((rpdl-extra-font-lock-match-ref-in-double-quoted-string
     (0 'font-lock-constant-face prepend))))

(defun rpdl-extra-font-lock-activate ()
  (interactive)
  (font-lock-add-keywords nil rpdl-extra-font-lock-keywords)
  (if (fboundp 'font-lock-flush)
      (font-lock-flush)
    (when font-lock-mode
      (with-no-warnings
        (font-lock-fontify-buffer)))))

(define-derived-mode rpdl-mode fundamental-mode "rpdl mode"
  "Major mode for editing RPDL (RedPaws Declarative Language)"
  (set (make-local-variable 'comment-start) "# ")
  (setq font-lock-defaults '((rpdl-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\rdl\\'" . rpdl-mode))
(add-to-list 'auto-mode-alist '("\\.rpdl\\'" . rpdl-mode))

(add-hook 'rpdl-mode-hook 'rpdl-extra-font-lock-activate)

(provide 'layer-lang-rpdl)

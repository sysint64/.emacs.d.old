(font-lock-add-keywords 'd-mode
                        '(("pragma" . font-lock-keyword-face)
                          ("function" . font-lock-keyword-face)
                          ("delegate" . font-lock-keyword-face)
                          ("package:" . font-lock-keyword-face)))

(font-lock-add-keywords 'd-mode
                        '(("\\<\\(TODO\\):" 1 font-lock-warning-face prepend)
                          ("\\<\\(FIXME\\):" 1 font-lock-doc-face prepend)))

(defface font-lock-attribute-face
  '((t :inherit font-lock-constant-face))
  "Face for highlighting attributes")

(defvar font-lock-attribute-face 'font-lock-attribute-face)

(defface font-lock-dlang-ddoc-macro-face
  '((t :inherit font-lock-constant-face))
  "Face for highlighting ddoc macro")

(defvar font-lock-dlang-ddoc-macro-face 'font-lock-dlang-ddoc-macro-face)

(defface font-lock-dlang-url-face
  '((t :inherit font-lock-constant-face))
  "Face for highlighting ddoc macro")

(defvar font-lock-dlang-url-face 'font-lock-dlang-url-face)

(defface font-lock-dlang-string-interpolation-face
  '((t :inherit font-lock-constant-face))
  "Face for highlighting ddoc macro")

(defvar font-lock-dlang-string-interpolation-face 'font-lock-dlang-string-interpolation-face)

(defface font-lock-dlang-ddoc-identifier-face
  '((t :inherit font-lock-constant-face))
  "Face for highlighting ddoc macro")

(defvar font-lock-dlang-ddoc-identifier-face 'font-lock-dlang-ddoc-identifier-face)

(defface font-lock-dlang-ddoc-comment-keyword-face
  '((t :inherit font-lock-constant-face))
  "Face for highlighting ddoc macro")

(defvar font-lock-dlang-ddoc-comment-keyword-face 'font-lock-dlang-ddoc-comment-keyword-face)

(defface font-lock-dlang-template-type-face
  '((t :inherit font-lock-constant-face))
  "Face for highlighting template type")

(defvar font-lock-dlang-template-type-face 'font-lock-dlang-template-type-face)

(font-lock-add-keywords 'd-mode
                        '(("\\_<\\(@[a-zA-Z0-9_]*\\)" (1 font-lock-attribute-face))))

(font-lock-add-keywords 'd-mode
                        '(("\\<\\($\(.*?\)\\)" 0 font-lock-dlang-ddoc-macro-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\\<\\(https://[a-zA-Z0-9\-_/\?\&\.\-\=]+\\)" 0 font-lock-dlang-url-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\\<\\(http://[a-zA-Z0-9\-_/\?&\.\-\=]+\\)" 0 font-lock-dlang-url-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\\<\\($[a-zA-Z0-9_]+\\)\\>" 0 font-lock-dlang-string-interpolation-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\\<\\(${.*?}\\)" 0 font-lock-dlang-string-interpolation-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\* \\(Example\\):" 1 font-lock-dlang-ddoc-comment-keyword-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\* \\(Params\\):" 1 font-lock-dlang-ddoc-comment-keyword-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\* \\(Returns\\):" 1 font-lock-dlang-ddoc-comment-keyword-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\* \\(See_also\\):" 1 font-lock-dlang-ddoc-comment-keyword-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\\(\`[a-zA-Z0-9_\.]+\`\\)" 1 font-lock-dlang-ddoc-identifier-face prepend)))

(font-lock-add-keywords 'd-mode
                        '(("\\_<\\([A-Z][A-Z]?\\)\\_>" 0 font-lock-dlang-template-type-face append)))

(defun my-d-hook ()
  (setq-default indent-tabs-mode nil)
  (when (featurep 'yasnippet) (yas-minor-mode-on))

  (setq truncate-lines t)
  ;; (rainbow-identifiers-mode)

  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)

  (add-to-list
   'compilation-error-regexp-alist
   '("^\\([^ \n]+\\)@\\([^ \n]+\\):\\([0-9]+\\):\\([^\n]+\\)"
     2 3 nil (4 . 5)))

  (add-to-list
   'compilation-error-regexp-alist
   '("^\\([^ \n]+\\)(\\([0-9]+\\)): \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
     1 2 nil (3 . 4)))

  (add-to-list
   'compilation-error-regexp-alist
   '("^\\([^ \n]+\\):\\([0-9]+\\) \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
     1 2 nil (3 . 4)))

  (set-face-background 'linum "#f0f0f0")

  (define-key d-mode-map (kbd "C-d") 'er/expand-region)
  (define-key d-mode-map (kbd "C-<return>") 'c-indent-new-comment-line)

  (setq flycheck-checkers (remove 'd-dmd flycheck-checkers))
  (require 'flycheck-d-dscanner)
  (setup-flycheck-d-dscanner))

(use-package d-mode :ensure t
             :config
             (add-hook 'd-mode-hook 'my-d-hook)
             (use-package company-dcd :ensure t
                          :config
                          (add-hook 'd-mode-hook 'company-dcd-mode)))

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'd-mode-hook 'highlight-numbers-mode))

(add-hook 'd-mode-hook 'linum-mode)

(provide 'layer-lang-d)

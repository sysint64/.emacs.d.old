(defun my-python-hook ()
  (setq truncate-lines t)
  (define-key python-mode-map (kbd "C-d") 'er/expand-region))

(use-package highlight-numbers :ensure t
  :config
  (add-hook 'python-mode-hook 'highlight-numbers-mode))

(defun project-directory (buffer-name)
  "Return the root directory of the project that contain the
given BUFFER-NAME. Any directory with a .git or .jedi file/directory
is considered to be a project root."
  (interactive)
  (let ((root-dir (file-name-directory buffer-name)))
    (while (and root-dir
                (not (file-exists-p (concat root-dir ".git")))
                (not (file-exists-p (concat root-dir ".jedi"))))
      (setq root-dir
            (if (equal root-dir "/")
                nil
              (file-name-directory (directory-file-name root-dir)))))
    root-dir))

(defun project-name (buffer-name)
  "Return the name of the project that contain the given BUFFER-NAME."
  (let ((root-dir (project-directory buffer-name)))
    (if root-dir
        (file-name-nondirectory
         (directory-file-name root-dir))
      nil)))

(defun jedi-setup-venv ()
  "Activates the virtualenv of the current buffer."
  (let ((project-name (project-name buffer-file-name)))
    (when project-name (venv-workon project-name))))

(use-package jedi :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi-setup-venv)
  (add-hook 'python-mode-hook 'jedi:setup))

(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'my-python-hook)

(provide 'layer-lang-python)

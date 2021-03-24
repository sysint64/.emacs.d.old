(require 'package)
(setq package-enable-at-startup nil)
(setq mac-command-modifier 'control)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load-file (concat user-emacs-directory "loader.el"))
(load-layers)
(set-face-font 'default "Hack-12")
(require 'theme-dark)
(setq inhibit-startup-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-find-template "find . <X> -type f <F> -exec grep <C> -nHI -e <R> {} +")
 '(helm-projectile-grep-command "grep -a -r %e -n%cHI -e %p %f ."))

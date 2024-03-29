(defun load-layers ()
  ;; (setq package-native-compile t)
  ;; (setq comp-deferred-compilation t)
  (setq gc-cons-threshold 100000000)
  ;; (add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))

  (add-to-list 'load-path (concat user-emacs-directory "layers"))
  (add-to-list 'load-path (concat user-emacs-directory "vendor"))

  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

  ;; (package-refresh-contents)

  (require 'layer-general)
  (require 'layer-navigation)
  (require 'layer-buffer)
  (require 'layer-bookmarks)
  (require 'layer-project)
  (require 'layer-git)
  (require 'layer-lsp)

  ;; Languages
  (add-to-list 'load-path (concat user-emacs-directory "layers/lang"))

  (require 'layer-lang-lisp)
  (require 'layer-lang-cpp)
  (require 'layer-lang-d)
  (require 'layer-lang-rpdl)
  (require 'layer-lang-json)
  ;; (require 'layer-lang-js)
  (require 'layer-lang-solidity)
  (require 'layer-lang-go)
  (require 'layer-lang-markdown)
  ;; (require 'layer-lang-scala)
  (require 'layer-lang-glsl)
  (require 'layer-lang-python)
  (require 'layer-lang-rust)
  (require 'layer-proof-general)
  (require 'layer-lang-clojure)
  (require 'layer-lang-sql)
  (require 'layer-lang-dart)
  (require 'layer-lang-julia)

  (if (eq system-type 'darwin) (require 'layer-lang-swift))

  (require 'flatbuffers-mode)
  (require 'capnp-mode)
  (require 'llvm-mode)

  ;; Appearence
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/color-themes"))
  (add-to-list 'load-path (concat user-emacs-directory "themes"))
  (add-to-list 'load-path (concat user-emacs-directory "themes/color-themes")))

(provide 'loader)

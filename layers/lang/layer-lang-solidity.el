;; (add-to-list 'load-path (concat user-emacs-directory "vendor/solidity"))

;; (require 'solidity-mode)

(defun my-solidity-hook ()
  (set (make-local-variable 'company-backends)
       (append '((company-solidity company-capf company-dabbrev-code))
               company-backends))

  (define-key solidity-mode-map (kbd "C-c C-g") 'solidity-estimate-gas-at-point)
  (define-key solidity-mode-map (kbd "C-d") 'er/expand-region)
  (setq solidity-solc-path "/usr/bin/solium")
  (setq solidity-solium-path "/usr/bin/solcjs")
  (setq solidity-flycheck-solc-checker-active t)
  (setq solidity-flycheck-solium-checker-active t)
  (setq solidity-comment-style 'slash)
  (setq flycheck-solidity-solium-soliumrcfile "/home/andrey/projects/work/recycler-os-blockchain/.soliumrc.json")
  (add-to-list 'flycheck-checkers 'solidity-checker)
  (add-to-list 'flycheck-checkers 'solium-checker)
  (setq truncate-lines t))

(use-package solidity-mode :ensure t
  :init
  (add-hook 'solidity-mode-hook 'my-solidity-hook))

(use-package company-solidity :ensure t
    :after (company))

(add-hook 'solidity-mode-hook 'linum-mode)

(provide 'layer-lang-solidity)

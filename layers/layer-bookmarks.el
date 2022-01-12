(defun bookmark-jump-and-save (name)
  (bookmark-set "0")
  (bookmark-jump name))

(defun bookmark-set-1 ()
  (interactive)
  (bookmark-set "1")
  (message "Bookmark was set"))

(defun bookmark-set-2 ()
  (interactive)
  (bookmark-set "2")
  (message "Bookmark was set"))

(defun bookmark-set-3 ()
  (interactive)
  (bookmark-set "3")
  (message "Bookmark was set"))

(defun bookmark-set-4 ()
  (interactive)
  (bookmark-set "4")
  (message "Bookmark was set"))

(defun bookmark-set-5 ()
  (interactive)
  (bookmark-set "5")
  (message "Bookmark was set"))

(defun bookmark-set-6 ()
  (interactive)
  (bookmark-set "6") (message "Bookmark was set"))

(defun bookmark-set-7 ()
  (interactive)
  (bookmark-set "7")
  (message "Bookmark was set"))

(defun bookmark-set-8 ()
  (interactive)
  (bookmark-set "8")
  (message "Bookmark was set"))

(defun bookmark-set-9 ()
    (interactive) (
                   bookmark-set "9") (message "Bookmark was set"))

(defun bookmark-set-0 ()
  (interactive)
  (bookmark-set "0")
  (message "Bookmark was set"))

(global-unset-key (kbd "C-b"))
;; (global-unset-key (kbd "C-j"))

;; (global-set-key (kbd "C-b C-a") 'bookmark-set-1)
;; (global-set-key (kbd "C-b C-s") 'bookmark-set-2)
;; (global-set-key (kbd "C-b C-d") 'bookmark-set-3)
;; (global-set-key (kbd "C-b C-f") 'bookmark-set-4)
;; (global-set-key (kbd "C-b C-j") 'bookmark-set-5)
;; (global-set-key (kbd "C-b C-k") 'bookmark-set-6)
;; (global-set-key (kbd "C-b C-l") 'bookmark-set-7)
;; (global-set-key (kbd "C-b C-;") 'bookmark-set-8)
;; (global-set-key (kbd "C-b C-9") 'bookmark-set-9)
;; (global-set-key (kbd "C-b C-0") 'bookmark-set-0)

(defun bookmark-jump-1 ()
  (interactive)
  (bookmark-jump-and-save "1"))

(defun bookmark-jump-2 ()
  (interactive)
  (bookmark-jump-and-save "2"))

(defun bookmark-jump-3 ()
  (interactive)
  (bookmark-jump-and-save "3"))

(defun bookmark-jump-4 ()
  (interactive)
  (bookmark-jump-and-save "4"))

(defun bookmark-jump-5 ()
  (interactive)
  (bookmark-jump-and-save "5"))

(defun bookmark-jump-6 ()
  (interactive)
  (bookmark-jump-and-save "6"))

(defun bookmark-jump-7 ()
  (interactive)
  (bookmark-jump-and-save "7"))

(defun bookmark-jump-8 ()
  (interactive)
  (bookmark-jump-and-save "8"))

(defun bookmark-jump-9 ()
  (interactive)
  (bookmark-jump-and-save "9"))

(defun bookmark-jump-0 ()
  (interactive)
  (bookmark-jump "0"))

;; (global-set-key (kbd "C-j C-a") 'bookmark-jump-1)
;; (global-set-key (kbd "C-j C-s") 'bookmark-jump-2)
;; (global-set-key (kbd "C-j C-d") 'bookmark-jump-3)
;; (global-set-key (kbd "C-j C-f") 'bookmark-jump-4)
;; (global-set-key (kbd "C-j C-j") 'bookmark-jump-5)
;; (global-set-key (kbd "C-j C-k") 'bookmark-jump-6)
;; (global-set-key (kbd "C-j C-l") 'bookmark-jump-7)
;; (global-set-key (kbd "C-j C-;") 'bookmark-jump-8)
;; (global-set-key (kbd "C-j C-9") 'bookmark-jump-9)
;; (global-set-key (kbd "C-j C-0") 'bookmark-jump-0)

(provide 'layer-bookmarks)

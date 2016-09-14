;; Window movement
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

;; Window sizing
(global-set-key (kbd "S-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-s-<up>") 'shrink-window)
(global-set-key (kbd "S-s-<down>") 'enlarge-window)

;; Window splitting
(global-set-key (kbd "s-|") 'split-window-right)
(global-set-key (kbd "s--") 'split-window-below)
(global-set-key (kbd "s-d") 'delete-window)
(global-set-key (kbd "s-b") 'ibuffer)

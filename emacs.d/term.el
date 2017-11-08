;;; term.el --- Term config

;;; Commentary:

;;; Code:

;; Multi-term
(require 'helm-mt)
(global-set-key (kbd "C-x t") 'helm-mt)

(add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))

(provide 'term)
;;; term.el ends here

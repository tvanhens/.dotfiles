;;; elisp.el --- Elisp config

;;; Commentary:

;;; Code:

;; Hooks

(add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(provide 'elisp)
;;; elisp.el ends here

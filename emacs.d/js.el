;;; js.el --- Javascript config

;;; Commentary:

;;; Code:

(require 'flycheck)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'web-mode)

(setq-default flycheck-temp-prefix ".flycheck")

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
	  '(json-jsonlist)))

(defun my/use-eslint-from-node-modules ()
  "Load eslint config from local repo."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode.  Adjust indent."
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (web-mode-set-content-type "jsx")
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  "Better web mode jsx highlighting."
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
	ad-do-it)
    ad-do-it))

(provide 'js)
;;; js.el ends here

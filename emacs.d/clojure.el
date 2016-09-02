;;------------------------------------------------------------------------------
;; Clojure

;; Imports

(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'clj-refactor)
(require 'smartparens-config)

;; Configuration

(put-clojure-indent 'match 1)
(setq clojure-align-forms-automatically t)
(setq clojure-indent-style :always-indent)

;; Use paredit bindings
(sp-use-paredit-bindings)

;; Utility functions

(defun tvh-clj-bindings ()
  (local-set-key (kbd "C-c q") 'cider-quit))

(defun tvh-clj-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  )

;; Hooks

(add-hook 'cider-repl-mode-hook 'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)

(add-hook 'cider-mode-hook 'eldoc-mode)

(add-hook 'clojure-mode-hook 'aggressive-indent-mode)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'tvh-clj-mode-hook)
(add-hook 'clojure-mode-hook 'tvh-clj-bindings)


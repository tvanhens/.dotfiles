;;------------------------------------------------------------------------------
;; Clojure

;; Imports

(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'clj-refactor)
(require 'smartparens-config)

;; Configuration

;; Formatting
(put-clojure-indent 'match 1)
(setq clojure-align-forms-automatically t)

;; Cider
(setq cider-repl-display-help-banner nil)

;; Pop cider open in same window
(setq cider-repl-display-in-current-window t)

;; Use paredit bindings
(sp-use-paredit-bindings)

;; Cider-Helm
(helm-cider-mode 1)

;; Reloaded utilities
(setq cider-refresh-before-fn "user/stop"
      cider-refresh-after-fn "user/start")

;; Clojurescript repl
(setq cider-cljs-lein-repl "(cljs-repl)")

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

(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'tvh-clj-mode-hook)
(add-hook 'clojure-mode-hook 'tvh-clj-bindings)

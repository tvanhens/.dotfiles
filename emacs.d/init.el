;;------------------------------------------------------------------------------
;; Cask and Pallet Configuration

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keep installed packages in sync with ~/.emacs.d/Cask file
(pallet-mode t)

;;------------------------------------------------------------------------------
;; Custom Configuration

(load-file "./.emacs.d/global.el")
(load-file "./.emacs.d/clojure.el")
(load-file "./.emacs.d/elisp.el")

;;------------------------------------------------------------------------------
;; Go Mode

(require 'go-mode-autoloads)
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))

(require 'company-go)

;;------------------------------------------------------------------------------
;; Markdown

(defun bind-markdown-keys ()
  (local-set-key (kbd "C-c k") 'gh-md-render-buffer))

(add-hook 'markdown-mode-hook #'bind-markdown-keys)

;;------------------------------------------------------------------------------
;; Javascript

(setq js-indent-level 2)

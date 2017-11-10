;;; global --- Global config

;;; Commentary:

;;; Code:

;;------------------------------------------------------------------------------
;; Dependencies:

(require 'smart-mode-line)
(require 'default-text-scale)
(require 'helm-config)
(require 'helm)
(require 'ace-window)
(require 'exec-path-from-shell)

;;------------------------------------------------------------------------------
;; Look and feel:

;; Theme
(load-theme 'dracula t)

;; Font
(set-default-font "Inconsolata 18")

;; Smart mode line
(setq sml/theme 'dark)
(sml/setup)

;; Disable toolbar
(tool-bar-mode -1)

;; Stop visible alert
(setq ring-bell-function 'ignore)

;; Turn off welcome message
(setq inhibit-startup-message t)

;; Column Mode
(setq column-number-mode t)

;; Git gutter
(global-git-gutter-mode +1)

;; Magit
(defvar magit-push-always-verify)
(setq magit-push-always-verify nil) ; Don't always verify

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Winner
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Font Locking
;; (defun my-font-lock-function (start end)
;;   "Set faces for font-lock between START and END.")

;; (defun my-font-lock-matcher (limit)
;;   (my-font-lock-function (point) limit)
;;   nil)

;; (setq font-lock-defaults
;;       (list
;;        `(my-font-lock-matcher (1 font-lock-keyword-face nil))))

;;------------------------------------------------------------------------------
;; Misc:

;; Backups
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; spaces > tabs
(setq-default indent-tabs-mode nil)

;; Set goal column (not sure what this does)
(put 'set-goal-column 'disabled nil)

;; Load exec path from shell
(exec-path-from-shell-initialize)

;; Projectile everywhere
(projectile-mode)

;; Helm
(helm-mode 1)                                     ; Use helm by default

;; Helm Projectile
(helm-projectile-on)

;; Undo tree everywhere
(global-undo-tree-mode)

;; Remove ws on save
(defun tvh-remove-ws ()
  "Trims whitespace."
  (interactive)
  (delete-trailing-whitespace))
(add-hook 'before-save-hook 'tvh-remove-ws)

;; Git link
(defvar git-link-open-in-browser)
(setq git-link-open-in-browser t)

;; GPG
(setenv "INSIDE_EMACS" (format "%s,comint" emacs-version))
(pinentry-start)

(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

;;------------------------------------------------------------------------------
;; Keybindings:

;; Global Config

;; Keyboard Macros:
(global-set-key [f5] 'call-last-kbd-macro)

;; Zoom in zoom out
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

;; Indent
(global-set-key (kbd "C-c n") 'indent-region)

;; Git
(global-set-key (kbd "C-x g") 'magit-status)

;; Window Changing
(global-set-key (kbd "C-x o") 'ace-window)

;; Jump to git link
(global-set-key (kbd "C-c g l") 'git-link)

;; Neotree
(global-set-key (kbd "<f8>") 'neotree-show)
(global-set-key (kbd "S-<f8>") 'neotree-hide)

;; Helm
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

(provide 'global)
;;; global.el ends here

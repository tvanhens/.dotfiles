;;------------------------------------------------------------------------------
;; Global

;; Set customizations file
(setq custom-file (concat user-emacs-directory ".custom.el"))
(ignore-errors
  (load-file custom-file))


(color-theme-sanityinc-tomorrow-night)

;; Smart mode line
(setq sml/theme 'dark)
(sml/setup)

;; Turn off welcome message
(setq inhibit-startup-message t)

;; Global Config
(global-set-key [f5] 'call-last-kbd-macro)

;; Font Locking
(defun my-font-lock-function (start end)
  "Set faces for font-lock between START and END.")

(defun my-font-lock-matcher (limit)
  (my-font-lock-function (point) limit)
  nil)

(setq font-lock-defaults
      (list
       `(my-font-lock-matcher (1 font-lock-keyword-face nil))))

;; Font
(set-default-font "Inconsolata 14")

(require 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)
(put 'set-goal-column 'disabled nil)

(exec-path-from-shell-initialize)

;; Stop visible alert
(setq ring-bell-function 'ignore)

;; Autosave to /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Indent
(global-set-key (kbd "C-c n") 'indent-region)

;; Projectile everywhere
(projectile-global-mode)

;; Helm
(require 'helm-config)
(require 'helm)

(helm-mode 1)                                     ; Use helm by default
(global-set-key (kbd "C-x C-f") 'helm-find-files) ; Use helm for files
; (helm-autoresize-mode 1)                          ; Autosize helm buffer

;; Helm Projectile
(helm-projectile-on)

;; Undo tree everywhere
(global-undo-tree-mode)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-push-always-verify nil) ; Don't always verify

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Winner
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Window Changing
(require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;; Remove ws on save
(defun tvh-remove-ws ()
  (interactive)
  (delete-trailing-whitespace))

(add-hook 'before-save-hook 'tvh-remove-ws)

;; Git gutter
(global-git-gutter-mode +1)

;; Git link
(setq git-link-open-in-browser t)
(global-set-key (kbd "C-c g l") 'git-link)

;; Neotree
(global-set-key (kbd "<f8>") 'neotree-show)
(global-set-key (kbd "S-<f8>") 'neotree-hide)

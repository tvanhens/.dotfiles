;;; init.el --- Tyler van Hensbergen's custom config

;;; Commentary:

;;; Code:

(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keep installed packages in sync with ~/.emacs.d/Cask file
(pallet-mode t)

;;------------------------------------------------------------------------------
;; Custom Configuration

;; Set customizations file
(setq custom-file (concat user-emacs-directory ".custom.el"))
(ignore-errors (load-file custom-file))

(defun load-user-config (file)
  "Load a FILE from the Emacs config dir."
  (load-file (concat user-emacs-directory file)))

(load-user-config "global.el")
(load-user-config "clojure.el")
(load-user-config "elisp.el")
(load-user-config "js.el")
(load-user-config "window.el")
(load-user-config "term.el")
(load-user-config "python.el")
(ignore-errors (load-user-config "local.el"))

(provide 'init)
;;; init.el ends here

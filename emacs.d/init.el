;;------------------------------------------------------------------------------
;; Cask and Pallet Configuration


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Keep installed packages in sync with ~/.emacs.d/Cask file
(pallet-mode t)

;;------------------------------------------------------------------------------
;; Custom Configuration

(load-file "./.emacs.d/clojure.el")
(load-file "./.emacs.d/elisp.el")
(load-file "./.emacs.d/js.el")
(load-file "./.emacs.d/global.el")
(load-file "./.emacs.d/markdown.el")
(load-file "./.emacs.d/window.el")
(load-file "./.emacs.d/term.el")
(load-file "./.emacs.d/python.el")
(load-file "./.emacs.d/local.el")

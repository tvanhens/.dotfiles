;; Elpy
(elpy-enable)

;; Auto pep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Use Ipython
(elpy-use-ipython)

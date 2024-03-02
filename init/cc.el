(use-package cmake-mode)

(add-hook 'c-mode-common-hook #'eglot-ensure)

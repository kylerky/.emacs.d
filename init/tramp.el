(use-package tramp
  :straight (:type built-in)
  :config (progn (add-to-list
	          'tramp-remote-path
	          'tramp-own-remote-path))
  :custom
  ((tramp-encoding-shell "/usr/bin/zsh")))

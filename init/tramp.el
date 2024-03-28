(use-package tramp
  :straight (:type git)
  :config (progn (add-to-list
	          'tramp-remote-path
	          'tramp-own-remote-path))
  :custom
  ((tramp-encoding-shell "/usr/bin/zsh")))

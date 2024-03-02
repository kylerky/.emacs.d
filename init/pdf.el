(use-package pdf-tools
  :demand t
  :config (progn (pdf-tools-install t))
  :bind (:map pdf-view-mode-map
              ("C-s" . isearch-forward))
  :hook ((pdf-view-mode . (lambda () (display-line-numbers-mode -1)))))

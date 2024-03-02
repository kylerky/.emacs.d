(use-package python-mode
  :hook
  ((python-mode . eglot-ensure)))

(use-package blacken
  :hook
  ((python-mode . blacken-mode)))

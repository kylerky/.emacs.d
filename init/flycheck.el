(use-package flycheck
  :demand t
  :config (global-flycheck-mode)
  :bind
  (("C-! l" . flycheck-list-errors)
   ("M-p" . flycheck-previous-error)
   ("M-n" . flycheck-next-error)))

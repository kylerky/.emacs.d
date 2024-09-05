(use-package eglot
  :init
  (setq eglot-workspace-configuration '())
  :bind (:map eglot-mode-map
              ("C-c r"     . eglot-rename)
              ("C-c f"     . eglot-format)
              ("C-c ="     . eglot-format-buffer)
              ("C-c h"     . eldoc)
              ("C-c C--"   . eglot-code-actions)
              ("C-c C-o"   . eglot-code-action-organize-imports)
              ("C-c C-f"   . eglot-code-action-quickfix)
              ("C-c C-e"   . eglot-code-action-extract)
              ("C-c C-i"   . eglot-code-action-inline)
              ("C-c C-w"   . eglot-code-action-rewrite)
              ("C-c g i"   . eglot-find-implementation)
              ("C-c g t"   . eglot-find-typeDefinition)
              ("C-c g d"   . eglot-find-declaration))
  :custom
  ((eglot-extend-to-xref t))
  :hook
  ((eglot-managed-mode . (lambda ()
                           (setq-local  completion-at-point-functions
                                        `(,(cape-capf-super #'eglot-completion-at-point
                                                            #'cape-dabbrev)
                                          t))))))

(use-package eldoc
  :hook
  ((org-agenda-mode . (lambda () (eldoc-mode -1)))))

(use-package flymake
  :bind (("M-N"   . flymake-goto-next-error)
         ("M-P"   . flymake-goto-prev-error)))

(use-package flycheck-eglot
  :demand t
  :after (flycheck eglot)
  :custom (flycheck-eglot-exclusive nil)
  :config
  (global-flycheck-eglot-mode 1))

(use-package imenu
  :bind (("C-c m" . imenu)))

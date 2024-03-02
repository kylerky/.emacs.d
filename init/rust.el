(use-package rust-mode
  :after flycheck
  :hook
  ((rust-mode . eglot-ensure))
  :config
  (progn
    (customize-set-variable 'flycheck-disabled-checkers
                            (append flycheck-disabled-checkers
                                    '(rust-cargo rust rust-clippy)))
    (setq-default eglot-workspace-configuration
                  '( :rust-analyzer
                     ( :rustc (:source "discover")
                       :check (:command "clippy"))))))

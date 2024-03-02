(use-package scala-mode
  :interpreter ("scala" . scala-mode))

(use-package sbt-mode
  :commands (sbt-start sbt-command)
  :config
  ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
  (setq sbt:program-options '("-Dsbt.supershell=false"))
  :hook
  ((scala-mode . eglot-ensure)))

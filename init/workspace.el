(winner-mode 1)

(use-package windresize
  :commands windresize
  :bind (("C-c 4" . windresize)))

(use-package bs
  :demand t
  :straight (:type built-in))

(use-package magit)

(use-package envrc
  :demand t
  :config (envrc-global-mode)
  :bind-keymap ("C-c e" . envrc-command-map))

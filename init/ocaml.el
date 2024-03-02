(use-package tuareg)
(use-package dune)
(use-package utop)
(use-package merlin
  :config (setq merlin-command 'opam)
  :hook ((tuareg-mode . merlin-mode)
         (caml-mode . merlin-mode)))
(use-package ocamlformat
  :hook ((before-save . ocamlformat-before-save)))

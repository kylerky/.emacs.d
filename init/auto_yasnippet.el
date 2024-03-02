(use-package yasnippet
  :bind (("C-c C-s C-n" . yas-new-snippet)
         ("C-c C-s C-s" . yas-insert-snippet)
         ("C-c C-s C-v" . yas-visit-snippet-file)))

(use-package yasnippet-snippets)

(use-package auto-yasnippet
  :after yasnippet
  :demand t
  :config (yas-global-mode 1)
  :bind (("C-c C-y w"   . aya-create)
         ("C-c C-y TAB" . aya-expand)
         ("C-c C-y SPC" . aya-expand-from-history)
         ("C-c C-y d"   . aya-delete-from-history)
         ("C-c C-y c"   . aya-clear-history)
         ("C-c C-y n"   . aya-next-in-history)
         ("C-c C-y p"   . aya-previous-in-history)
         ("C-c C-y s"   . aya-persist-snippet)
         ("C-c C-y o"   . aya-open-line)))

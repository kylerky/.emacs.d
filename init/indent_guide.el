(use-package highlight-indent-guides
  :custom
  ((highlight-indent-guides-method 'column)
   (highlight-indent-guides-responsive 'stack))
  :hook
  ((prog-mode . highlight-indent-guides-mode)))

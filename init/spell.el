(use-package flyspell
  :config (progn
            (unbind-key "C-;" flyspell-mode-map)
            (unbind-key "C-." flyspell-mode-map))
  :custom ((ispell-extra-args '("--lang=en_GB" "--camel-case")))
  :hook ((prog-mode . flyspell-prog-mode)
         (text-mode . flyspell-mode)))

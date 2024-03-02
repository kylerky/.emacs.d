(use-package ledger-mode
  :config (progn
            (add-to-list
             'auto-mode-alist
             '("\\.\\(h?ledger\\|journal\\|j\\)$" . ledger-mode)))
  :custom ((ledger-binary-path "hledger")
           (ledger-init-file-name "")
           (ledger-mode-should-check-version nil)
           (ledger-post-amount-alignment-column 64)))

(use-package ob-hledger
  :straight org-contrib
  :config (add-to-list 'org-src-lang-modes '("hledger" . ledger)))

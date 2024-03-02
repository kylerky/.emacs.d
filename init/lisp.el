(use-package lispy
  :bind (:map lispy-mode-map
              ("M-o" . ace-window))
  :hook ((emacs-lisp-mode . (lambda () (lispy-mode 1)))
         (lisp-data-mode . lispy-mode)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq-local completion-at-point-functions
                        `(,(cape-capf-super #'elisp-completion-at-point
                                            #'cape-dabbrev)
                          t))))

(use-package racket-mode
  :bind ( :map racket-mode-map
          ("C-c x" . racket-xp-mode)
          ("C-c r" . racket-xp-rename)
          ("C-0" . racket-smart-open-bracket)
          :repeat-map plk/racket-mode-map
          ("n" . racket-xp-next-use)
          ("p" . racket-xp-previous-use)
          ("^" . racket-xp-tail-up)
          ("v" . racket-xp-tail-down)
          (">" . racket-xp-tail-next-sibling)
          ("<" . racket-xp-tail-previous-sibling))
  :hook ((racket-mode . lispy-mode)
         (racket-mode . racket-xp-mode)
         (racket-mode . (lambda ()
                          (setq-local completion-at-point-functions
                                      `(,(cape-capf-super #'racket-complete-at-point
                                                          #'cape-dabbrev)
                                        t))))
         (racket-xp-mode . (lambda ()
                             (setq-local completion-at-point-functions
                                         `(,(cape-capf-super #'racket-xp-complete-at-point
                                                             #'cape-dabbrev)
                                           t))))))

(use-package geiser
  :custom
  ((geiser-repl-per-project-p t))
  :hook
  ((geiser-mode . lispy-mode)
   (geiser-mode . (lambda ()
                    (setq-local completion-at-point-functions
                                `(,(cape-capf-super #'geiser-capf--for-symbol
                                                    #'geiser-capf--for-module
                                                    #'geiser-capf--for-filename
                                                    #'cape-dabbrev)
                                  t))))))
(use-package geiser-guile)

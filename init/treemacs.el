(use-package treemacs
  :commands (treemacs)
  :defer t
  :config
  (progn
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)

    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (("M-t"       . treemacs-select-window)
   ("C-c t 1"   . treemacs-delete-other-windows)
   ("C-c t t"   . treemacs)
   ("C-c t B"   . treemacs-bookmark)
   ("C-c t C-f" . treemacs-find-file)
   ("C-c t C-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :demand t)

(use-package treemacs-magit
  :after (treemacs magit)
  :demand t)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package treemacs-all-the-icons)

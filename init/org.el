(use-package org-contrib)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (emacs-lisp . t)
   (python . t)
   (hledger . t)
   (coq . t)
   (ocaml . t)
   (haskell . t)))

(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

(use-package cdlatex)

(use-package org
  :config
  (progn (require 'org-indent))
  :bind
  (("C-c u" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :custom
  ((org-src-preserve-indentation t)
   (org-agenda-files "~/Notes/agenda_files")
   (org-directory "~/Notes")
   (org-agenda-include-diary nil)
   (org-agenda-include-deadlines t)
   (org-startup-indented t)
   (holiday-general-holidays '((holiday-fixed 1 1 "New Year's Day")
                               (holiday-fixed 2 14 "Valentine's Day")
                               (holiday-fixed 4 1 "April Fools' Day")
                               (holiday-fixed 5 1 "International Workers' Day")
                               (holiday-float 5 0 2 "Mother's Day")
                               (holiday-float 6 0 3 "Father's Day")))
   (holiday-hebrew-holidays nil)
   (holiday-bahai-holidays nil)
   (holiday-islamic-holidays nil)
   (holiday-christian-holidays nil)
   (org-format-latex-options
    '( :foreground default :background default :scale 3.0 :html-foreground "Black" :html-background "Transparent" :html-scale 3.0
       :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
   (org-preview-latex-image-directory "/tmp/ltximg")
   (org-agenda-skip-scheduled-if-done t)
   (org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)")
                        (sequence "PENDING(p)" "IN-PROGRESS(i)" "|" "COMPLETE(s)")
                        (sequence "|" "CANCELED(c)")))
   (org-modules '(ol-bbdb
                  ol-bibtex
                  org-crypt
                  ol-docview
                  ol-doi
                  ol-eww
                  ol-gnus
                  org-habit
                  org-id
                  ol-info
                  org-inlinetask
                  ol-irc
                  ol-mhe
                  org-protocol
                  ol-rmail
                  org-tempo
                  ol-w3m))
   (org-export-backends '(ascii
                          html
                          icalendar
                          latex
                          odt
                          org
                          md
                          beamer))
   (org-show-notification-handler 'notifications-notify)
   (org-show-notification-timeout 0))
  :hook
  ((org-mode . (lambda ()
                 (turn-on-org-cdlatex)
                 (setq-local  completion-at-point-functions
                              `(,(cape-capf-super #'citar-capf
                                                  #'pcomplete-completions-at-point
                                                  #'cape-dabbrev)
                                t))))))

(use-package org-noter
  :custom
  ((org-noter-notes-search-path '("~/Sync/notes"))))

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freepointer-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

(use-package citar-embark
  :demand t
  :after citar embark
  :no-require
  :config (citar-embark-mode))

(use-package citar-org-roam
  :demand t
  :after (citar org-roam)
  :config (citar-org-roam-mode))

(use-package org-roam
  :demand t
  :custom
  ((org-roam-directory (expand-file-name "~/Notes/roam"))
   (org-roam-capture-templates
    '(("m" "main" plain "%?"
       :if-new
       (file+head
        "main/${slug}.org" "#+title: ${title}\n")
       :immediate-finish t
       :unnarrowed t)
      ("r" "reference" plain "%?"
       :if-new
       (file+head
        "reference/${slug}.org" "#+title: ${title}\n#+filetags: :reference:\n")
       :immediate-finish t
       :unnarrowed t)
      ("p" "project" plain "%?"
       :if-new
       (file+head
        "project/${slug}.org" "#+title: ${title}\n#+filetags: :project:\n")
       :immediate-finish t
       :unnarrowed t))))
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n g" . org-roam-graph)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n c" . org-roam-capture)
   ;; Dailies
   ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (progn (require 'org-roam-protocol)
         (require 'org-roam-export)
         (org-roam-db-autosync-mode)))

(use-package org-transclusion
  :after org
  :custom
  ((org-transclusion-extensions '(org-transclusion-src-lines
                                  org-transclusion-font-lock
                                  org-transclusion-indent-mode)))
  :config
  (progn (set-face-attribute 'org-transclusion-fringe
                             nil
                             :foreground (doom-color 'orange)
                             :background (doom-color 'orange))
         (set-face-attribute 'org-transclusion-source-fringe
                             nil
                             :foreground (doom-color 'green)
                             :background (doom-color 'green)))
  :bind
  ( :map org-mode-map
    ("C-c n r" . org-transclusion-remove)
    ("C-c n t" . org-transclusion-add)
    ("C-c n s" . org-transclusion-open-source)
    ("C-c n m" . org-transclusion-make-from-link)))

(use-package org-modern
  :after org
  :demand t
  :custom
  (;; org-styling
   (org-pretty-entities t)
   (org-ellipsis "…"))
  :config
  (global-org-modern-mode))

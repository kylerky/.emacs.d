(use-package tex
  :straight auctex
  :custom ((TeX-auto-save t)
	   (TeX-parse-self t)
	   (TeX-master nil))
  :config (setcar
	   (cdr (assoc 'output-pdf TeX-view-program-selection))
	   "PDF Tools")
  :hook
  ((LaTeX-mode . (lambda ()
                   (lambda ()
                     (setq-local  completion-at-point-functions
                                  `(,(cape-capf-super #'citar-capf
                                                      #'LaTeX--arguments-completion-at-point
                                                      #'TeX--completion-at-point
                                                      #'cape-tex
                                                      #'cape-dabbrev)
                                    t)))))))

(use-package citar
  :demand t
  :custom
  ((org-cite-global-bibliography '("~/Notes/references.bib"))
   (citar-bibliography org-cite-global-bibliography)
   (org-cite-insert-processor 'citar)
   (org-cite-follow-processor 'citar)
   (org-cite-activate-processor 'citar)))

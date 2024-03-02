(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :demand t
  :config
  (setq doom-themes-enable-bold t ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-zenburn t)
  (doom-themes-set-faces 'doom-zenburn
    ;; Make vertical border less visible
    '(vertical-border :foreground "#424242")
    ;; Make shadowed characters more distinguishable
    '(shadow :foreground "#7f7f7f")
    '(org-done :foreground "#7f7f7f"))

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

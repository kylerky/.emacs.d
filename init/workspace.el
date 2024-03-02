(winner-mode 1)

(use-package windresize
  :commands windresize
  :bind (("C-c 4" . windresize)))

(use-package bs
  :demand t
  :straight (:type built-in))

(use-package perspective
  :demand t
  :bind
  (("C-x C-b" . (lambda (arg)
                  (interactive "P")
                  (if (fboundp 'persp-bs-show)
                      (persp-bs-show arg)
                    (bs-show "all"))))
   ("C-x b" . persp-switch-to-buffer*)
   ("C-x k" . persp-kill-buffer*))
  :custom
  ((persp-mode-prefix-key (kbd "C-c w"))
   (persp-state-default-file "~/.emacs.d/perspective-state")
   (even-window-sizes nil))
  :hook
  ((kill-emacs . persp-state-save))
  :init
  (persp-mode)
  (unbind-key "C-x 4 b"))

(use-package persp-projectile
  :after (projectile perspective)
  :bind
  (:map projectile-mode-map
        ("C-c p p" . projectile-persp-switch-project)))

(use-package magit)

(use-package envrc
  :demand t
  :config (envrc-global-mode)
  :bind-keymap ("C-c e" . envrc-command-map))

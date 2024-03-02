(use-package swiper
  :bind ("C-s" . swiper))

(use-package ivy
  :demand t
  :config
  (progn
    (setq ivy-use-virtual-buffers t)
    (ivy-mode)))

(use-package ivy-avy)

(use-package counsel
  :demand t
  :config (counsel-mode)
  :bind (:map minibuffer-local-map
	      ("C-r" . counsel-minibuffer-history)))

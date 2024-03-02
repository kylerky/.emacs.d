(global-set-key (kbd "C-c q o") 'switch-to-minibuffer)

(use-package avy
  :demand t
  :config (avy-setup-default)
  :bind (("C-:" . avy-goto-char)
	 ("C-'" . avy-goto-char-in-line)
         ("C-\"" . avy-goto-char-2)
	 ("M-g g" . avy-goto-line)
	 ("M-g w" . avy-goto-word-1)
	 ("M-g e" . avy-goto-word-0)
	 ("C-c C-j" . avy-resume)))

(use-package ace-window
  :demand t
  :bind (("M-o" . ace-window)
	 ("C-x o" . ace-window)))

(use-package windmove
  :demand t
  :bind (("C-S-<left>" . windmove-swap-states-left)
         ("C-S-<right>" . windmove-swap-states-right)
         ("C-S-<up>" . windmove-swap-states-up)
         ("C-S-<down>" . windmove-swap-states-down)
         ("M-S-<left>" . windmove-display-left)
         ("M-S-<right>" . windmove-display-right)
         ("M-S-<up>" . windmove-display-up)
         ("M-S-<down>" . windmove-display-down)
         ("S-<left>" . windmove-left)
         ("S-<right>" . windmove-right)
         ("S-<up>" . windmove-up)
         ("S-<down>" . windmove-down)))

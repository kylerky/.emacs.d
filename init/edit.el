(global-set-key (kbd "C-c q r") 'repeat-mode)

(defvar plk/which-key-repeat-mode-timer nil)

(use-package repeat
  :config
  (advice-add 'repeat-post-hook
              :after
              (defun plk/repeat-which-key ()
                (if-let ((keymap (repeat-get-map)))
                    (setq plk/which-key-repeat-mode-timer
                          (run-with-idle-timer which-key-idle-delay
                                               nil
                                               (lambda (repeat-keymap)
                                                 (which-key-show-keymap 'repeat-keymap t))
                                               keymap))
                  (progn
                    (when plk/which-key-repeat-mode-timer
                      (cancel-timer plk/which-key-repeat-mode-timer)
                      (setq plk/which-key-repeat-mode-timer nil))
                    (which-key--hide-popup))))))

(use-package iedit
  :bind (("C-;" . iedit-mode)
         ("C-c C-;" . iedit-mode-toggle-on-function)))

(use-package elec-pair
  :demand t
  :config
  (electric-pair-mode))

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(use-package ws-butler
  :demand t
  :config (ws-butler-global-mode))

(use-package super-save
  :demand t
  :custom ((auto-save-default nil)
	   (super-save-auto-save-when-idle t)
	   (super-save-triggers
	    '(ace-window
	      treemacs-select-window
              persp-switch-to-buffer*
              persp-switch-to-buffer
	      other-window
	      windmove-up
	      windmove-down
	      windmove-left
	      windmove-right
	      next-buffer
	      previous-buffer
              find-file))
	   (super-save-hook-triggers
	    '(find-file-hook
	      mouse-leave-buffer-hook
	      focus-out-hook)))
  :config (super-save-mode 1))

(use-package multiple-cursors
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)))

(use-package vlf
  :init (require 'vlf-setup))

(use-package vundo)

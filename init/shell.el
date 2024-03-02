(use-package xterm-color
  :demand t
  :config
  (progn (setq comint-output-filter-functions
               (remove 'ansi-color-process-output comint-output-filter-functions))
         (setq compilation-environment '("TERM=xterm-256color"))

         (defun plk/advice-compilation-filter (f proc string)
           (funcall f proc (xterm-color-filter string)))

         (advice-add 'compilation-filter :around #'plk/advice-compilation-filter)
         (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil nil))
  :hook
  ((shell-mode . (lambda ()
                   ;; Disable font-locking in this buffer to improve performance
                   (font-lock-mode -1)
                   ;; Prevent font-locking from being re-enabled in this buffer
                   (make-local-variable 'font-lock-function)
                   (setq font-lock-function (lambda (_) nil))))))

(use-package eshell
  :after xterm-color
  :custom
  ((eshell-preoutput-filter-functions '(xterm-color-filter)))
  :config
  (progn (setenv "TERM" "xterm-256color"))
  :hook
  ((eshell-before-prompt . (lambda ()
                             (setq xterm-color-preserve-properties t)))))

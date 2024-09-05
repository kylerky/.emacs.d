;; -*- no-byte-compile: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-files/f" t)))
 '(backup-directory-alist '(("." . "~/.emacs.d/backup")))
 '(confirm-kill-emacs 'yes-or-no-p)
 '(delete-by-moving-to-trash t nil nil "Customized with use-package dirvish")
 '(enable-local-variables t)
 '(gnus-init-file "~/.emacs.d/gnus.el")
 '(indent-tabs-mode nil)
 '(ispell-extra-args '("--lang=en_GB" "--camel-case") nil nil "Customized with use-package flyspell")
 '(package-archive-priorities '(("gnu" . 10) ("melpa" . 0)))
 '(package-native-compile t)
 '(scroll-conservatively 101)
 '(smtpmail-default-smtp-server "localhost")
 '(truncate-lines t)
 '(enable-remote-dir-locals t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#3F3F3F" :foreground "#DCDCDC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 160 :width normal :foundry "CTDB" :family "Fira Code"))))
 '(org-modern-symbol ((t (:height 1.0 :family "Iosevka"))) t))

(setq straight-use-package-by-default t)
(setq straight-vc-git-default-clone-depth 5)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun plk/load-init-files (dir files)
  (when files
    (load (expand-file-name (car files) dir))
    (plk/load-init-files dir (cdr files))))

(let ((init_dir (expand-file-name "init" user-emacs-directory)))
  (load (expand-file-name "melpa" init_dir))
;;;
  (plk/load-init-files
   init_dir
   '("emacs.el"))
;;;
  (eval-when-compile (require 'use-package)
                     (customize-set-variable 'use-package-always-defer t))
;;;
  (load (expand-file-name "ui" init_dir))
;;;
  (plk/load-init-files
   init_dir
   '("movement"
     "spell"
     "tramp"))
  (midnight-mode)
;;;
  (load (expand-file-name "theme" init_dir))
;;;
  (plk/load-init-files
   init_dir
   '("flycheck"))
;;;
  (plk/load-init-files
   init_dir
   '("treemacs"
     "projectile"
     "workspace"
     "org"
     "wgrep"
     "deadgrep"
     "edit"
     "auto_yasnippet"
     "shell"))
;;;
  (plk/load-init-files
   init_dir
   '("completion"
     "cc"
     "markdown"
     "lisp"
     "eglot"
     "pdf"
     "python"
     "scala"
     "boogie_friends"
     "haskell"
     "rust"
     "auctex"
     "proof_general"
     "why3"
     "ocaml"
     "yaml"
     "ledger_mode"
     "indent_guide"
     "calendars"
     "hcl"
     "web"))
;;;
  (load (expand-file-name "private" init_dir) t))

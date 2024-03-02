(setq opam-share
      (if (boundp 'opam-share)
          opam-share
        "~/.opam/default/share"))
(setq opam-elisp (expand-file-name "emacs/site-lisp" opam-share))
(setq why3el
      (let ((f (expand-file-name
                "why3.el"
                opam-elisp)))
        (if (file-readable-p f) f nil)))

(when why3el
  (load-init-files opam-elisp '("why3"))
  (autoload 'why3-mode why3el "Major mode for Why3." t))

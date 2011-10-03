;; -*-emacs-lisp-*-

(add-to-list 'load-path "~/git/dot/elisp")
(normal-top-level-add-subdirs-to-load-path)

(require 'tabbar)
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)
(set-default 'truncate-lines t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.6.4/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)


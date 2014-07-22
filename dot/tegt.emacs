;; -*-Emacs-Lisp-*- Grant Tegtmeier 6/13/05

(setq load-path (cons "~/bin/emacs/" load-path))

(load "php-mode")
(load "js2")

(load "drupal-mode")

(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))

(setq initial-frame-alist '((width . 100) (height . 44)))
(column-number-mode 1)

(require 'font-lock)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t)
(global-font-lock-mode t)

(setq frame-title-format "%f - Emacs")

(tool-bar-mode -1)

;; Tegt key-bindings
(fset 'bothBraces
   " {\C-m}\C-a\C-o\C-i")

(global-set-key [?\C-c ?n] 'forward-list)

(fset 'timestamp
   "\C-m\C-@\C-u\C-[xshell comm\C-i on re\C-i\C-mdate\C-m")
(global-set-key [3 20] 'timestamp)


 (fset 'phperror
       "\C-r:\C-f\C-s in /\C-b\C-@\C-s on \C-b\C-b\C-b\C-b\C-w\C-y\C-x1\C-x2\C-x1\C-x2\C-xo\C-x\C-f\C-y\C-m\C-xo\C-e\C-r on line \C-[f\C-[f\C-[d\C-y\C-xo\C-[g\C-y\C-m")
(global-set-key [3 101] 'phperror)

(fset 'tail-log
   "\C-[xshell\C-mcd /var/log/apache2\C-mtail -f error.l\C-i\C-m\C-cw\C-a\C-k\C-[xren buff\C-i\C-merror-log\C-m\C-x2\C-[xshell\C-m")
(global-set-key [3 116] 'tail-log)

(defun selective-point()
  (interactive)
  (set-selective-display
   (current-column)))

(global-set-key [?\C-c ?s] 'selective-point)

(global-set-key [?\C-c ?p] 'backward-list)

(global-set-key "\M-g" 'goto-line)

(global-set-key [?\C-c ?\\] 'bothBraces)

(global-set-key [?\C-c ?\t] 'indent-region)

(fset 'indent-buffer
   "\C-xr -\C-[<\C-[>\C-[xihn\C-?\C-?ndent region\C-m\C-xrj-")

(global-set-key [?\C-x ?\t] 'indent-buffer)


(global-set-key [?\C-c ?\M-\t] 'indent-buffer)

(global-set-key [?\C-c ?c] 'svn-status)

(global-set-key [?\C-c ?\C-c] 'git-status)

(global-set-key [?\M-\t] 'hippie-expand)

(put 'upcase-region 'disabled nil)

(fset 'indentBuffer
   "\C-xr i\C-[<\C-@\C-[>\C-c\C-i\C-xrji")

(global-set-key [134217819 122] 'indentBuffer)

(setq transient-mark-mode nil)

(fset 'wipeshell
   "\C-[<\C-[>\C-w\C-[p")
(global-set-key [3 119] 'wipeshell)

;; php lint
(defun xp-phplint-thisfile ()
(interactive)
(compile (format "php -l %s" (buffer-file-name))))
(add-hook 'php-mode-hook
'(lambda ()
(local-set-key [?\C-c ?x] 'xp-phplint-thisfile)))
;; end of php lint

(server-start)
(fset 'php-err-open
   "\C-ron line <b>\C-a\C-s in <b\C-f\C-@\C-s</b>\C-b\C-b\C-b\C-b\C-w\C-y\C-x1\C-x2\C-xo\C-x\C-f\C-y\C-m\C-xo\C-s<b>\C-f\C-b\C-[d\C-y\C-[>\C-xo\C-[g\C-y\C-m")

(display-time)
(shell)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(change-log-default-name "/grant.txt")
 '(column-number-mode t)
 '(display-time-mode t)
 '(grep-command "sgrep -i ")
 '(grep-highlight-matches t)
 '(grep-template "grep <C> -nH -e <R> <F>")
 '(grep-use-null-device nil)
 '(menu-bar-mode nil)
 '(php-manual-path "/var/www/phpdoc")
 '(php-mode-force-pear t)
 '(scroll-bar-mode nil)
 '(transient-mark-mode nil)
 '(whitespace-modes (quote (ada-mode asm-mode autoconf-mode awk-mode c-mode c++-mode cc-mode change-log-mode cperl-mode electric-nroff-mode emacs-lisp-mode f90-mode fortran-mode html-mode html3-mode java-mode jde-mode ksh-mode latex-mode LaTeX-mode lisp-mode m4-mode makefile-mode modula-2-mode nroff-mode objc-mode pascal-mode perl-mode prolog-mode python-mode scheme-mode sgml-mode sh-mode shell-script-mode simula-mode tcl-mode tex-mode texinfo-mode vrml-mode xml-mode php-mode))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:background "blue" :foreground "orange"))))
 '(font-lock-function-name-face ((((class color) (min-colors 8)) (:background "blue" :foreground "orange" :weight bold))))
 '(minibuffer-prompt ((t (:background "blue" :foreground "orange"))))
 '(woman-bold ((((background light)) (:foreground "white" :weight bold)))))

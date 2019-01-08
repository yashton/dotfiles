(setq user-full-name "Ashton Snelgrove"
      user-mail-address "ashton@snelgrove.science")

(require 'package)
(setq  package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("melpa-stable" . "http://stable.melpa.org/packages/")))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq load-prefer-newer t)

(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "<f5>") 'linum-mode)
(global-set-key (kbd "<f6>") 'whitespace-mode)
(global-set-key (kbd "<f7>") 'compile)
(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "C-x M-f") 'projectile-find-file)
(global-set-key (kbd "C-c C-c") 'recompile)

;; silver searcher keybindings
(global-set-key (kbd "M-s k") 'ag-kill-buffers)
(global-set-key (kbd "M-s a a") 'ag)
(global-set-key (kbd "M-s a f") 'ag-files)
(global-set-key (kbd "M-s a d") 'ag-dired)
(global-set-key (kbd "M-s a r") 'ag-regexp)
(global-set-key (kbd "M-s a e") 'ag-dired-regexp)
(global-set-key (kbd "M-s p p") 'ag-project)
(global-set-key (kbd "M-s p f") 'ag-project-files)
(global-set-key (kbd "M-s p d") 'ag-project-dired)
(global-set-key (kbd "M-s p r") 'ag-project-regexp)
(global-set-key (kbd "M-s p e") 'ag-project-dired-regexp)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'org-mode-hook 'visual-line-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (nginx-mode ess helm-projectile kotlin-mode haskell-mode whole-line-or-region yarn-mode graphviz-dot-mode rjsx-mode gxref ggtags helm-gtags tidy json-mode yaml-mode helm-dash helm-ag helm-core flycheck psc-ide psci purescript-mode elmacro scad-mode scad-preview hole-line-or-region protobuf-mode markdown-mode use-package async epl pkg-info magit-popup projectile magit groovy-mode gradle-mode csharp-mode ag ensime)))
 '(safe-local-variable-values
   (quote
    ((js-indent-level . 2)
     (\,
      (js-indent-level . 2))
     (eval remove-hook
           (quote before-save-hook)
           (quote delete-trailing-whitespace))
     (eval highlight-regexp " *$")
     (eval highlight-regexp "^ *")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|tmp|log|classes|build|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-project-roots ".dir-locals.el")))))

(setq-default c-basic-offset 4)
(setq c-default-style "k&r" c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(menu-bar-mode -1)

(prefer-coding-system 'utf-8)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(whole-line-or-region-mode 1)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'minibuffer-setup-hook 'subword-mode)

(require 'savehist)
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)
    (local-set-key (kbd "M-SPC") #'company-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(global-set-key (kbd "M-x") 'helm-M-x)
(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)

(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
;;(add-hook 'java-mode-hook 'ensime-mode)

(add-hook 'html-mode-hook (lambda () (set (make-local-variable 'sgml-basic-offset) 4)))

(make-face 'python-custom-face)
(set-face-foreground 'python-custom-face "pink")
(add-hook 'python-mode-hook
           (lambda ()
            (set (make-local-variable 'font-lock-comment-face)
                 'python-custom-face)))

(c-add-style "my-c-style" '((c-continued-statement-offset 4)))
(defun my-c-mode-hook ()
    (c-set-style "my-c-style"))
    ;; (c-set-offset 'inline-open '+)
    ;; (c-set-offset 'block-open '+)
    ;; (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
;;    (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'java-mode-hook 'my-c-mode-hook)
(add-hook 'prog-mode-hook 'helm-gtags-mode)

(global-set-key (kbd "C-c h") 'helm-gtags-display-browser)
(global-set-key (kbd "C-c P") 'helm-gtags-find-files)
(global-set-key (kbd "C-c f") 'helm-gtags-parse-file)
(global-set-key (kbd "C-c g") 'helm-gtags-find-pattern)
(global-set-key (kbd "C-c s") 'helm-gtags-find-symbol)
(global-set-key (kbd "C-c r") 'helm-gtags-find-rtag)
(global-set-key (kbd "C-c t") 'helm-gtags-find-tag)
(global-set-key (kbd "C-c d") 'helm-gtags-find-tag)
(global-set-key (kbd "C-c C-]") 'helm-gtags-find-tag-from-here)
(global-set-key (kbd "C-c C-t") 'helm-gtags-pop-stack)
(global-set-key (kbd "M-*") 'helm-gtags-pop-stack)
(global-set-key (kbd "M-.") 'helm-gtags-find-tag)
(global-set-key (kbd "C-x 4 .") 'helm-gtags-find-tag-other-window)
(put 'downcase-region 'disabled nil)
(add-to-list 'auto-mode-alist '(".*\\.js$" . rjsx-mode))

(setq python-shell-interpreter "python3")

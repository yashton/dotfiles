(setq user-full-name "Ashton Snelgrove"
      user-mail-address "ashton@snelgrove.io")

(require 'package)
(setq  package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("melpa-stable" . "http://stable.melpa.org/packages/")))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; (when (not package-archive-contents)
;;   (package-refresh-contents)
;;   (package-install 'use-package))
;; (require 'use-package)

(setq load-prefer-newer t)

(set-face-attribute 'default nil :height 100)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)

 '(package-selected-packages
   (quote
    (whole-line-or-region protobuf-mode markdown-mode logview cygwin-mount use-package async with-editor epl pkg-info magit-popup git-commit projectile magit groovy-mode gradle-mode csharp-mode ag ensime)))
 '(safe-local-variable-values
   (quote
    ((eval remove-hook
           (quote before-save-hook)
           (quote delete-trailing-whitespace))
     (c-default-style . "bsd")
     (tab-width 4)
     (c-basic-offset 4)
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

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(menu-bar-mode -1)

(prefer-coding-system 'utf-8)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'minibuffer-setup-hook 'subword-mode)

(whole-line-or-region-mode 1)

(add-hook 'purescript-mode
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

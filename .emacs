(set-face-attribute 'default nil :height 100)
(autoload 'linum-mode "linum" "toggle line numbers on/off" t) 
(global-set-key (kbd "C-<f5>") 'linum-mode)
(global-set-key (kbd "C-<f6>") 'whitespace-mode)
(global-set-key (kbd "C-<f7>") 'compile)
(global-set-key (kbd "C-<f8>") 'recompile)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq c-mode-hook '(lambda () (gtags-mode)))

(setq-default c-basic-offset 4)
(setq c-default-style "k&r"
                c-basic-offset 4)

;;(require 'mercurial)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|tmp|log|classes|build|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)") (textmate-project-roots ".dir-locals.el")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;;; Package config -- see https://melpa.org/#/getting-started
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;; Use Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Basic Config
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;;; Set up the visible bell
(setq visible-bell t)

;;; Number on column
(column-number-mode)
(global-display-line-numbers-mode t)

;;; Manual load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Auto completion with compagny
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck elpy doom-themes json-mode smartparens prettier-js which-key magit helm-projectile projectile helm company use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Helm
(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

;;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

;;; Magit
(use-package magit
  :ensure t)

;;; Magit
(use-package magit
  :ensure t)

;;; which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;;; prettier-js
(use-package prettier-js
  :ensure t
  :config
  (setq prettier-js-args '(
                           "--trailing-comma" "es5"
                           "--single-quote" "true"
                           "--print-width" "120"
                           "--tab-width" "4"
                           "--use-tabs" "false"
                           "--jsx-bracket-same-line" "false"
                           "--stylelint-integration" "true"
                           )))

;;; smartparens
(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode))

;;; JSON
(use-package json-mode
  :ensure t)

;;; Theme
(use-package doom-themes
  :ensure t
  :preface (defvar region-fg nil) ; this prevents a weird bug with doom themes
  :init (load-theme 'doom-one t))

;;; ELPY
(use-package elpy
  :ensure t
  :defer t

  :init
  (advice-add 'python-mode :before 'elpy-enable))


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(require 'org)
(delete-file  (expand-file-name (concat user-emacs-directory "settings.el")))
(org-babel-load-file (expand-file-name (concat user-emacs-directory "settings.org")))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package evil
  :ensure t
  :init (setq evil-want-C-i-jump nil)
  :config (evil-mode))

;; Add line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)) 

;; Org-babel
(use-package org
  :ensure t
  :config
  (setq org-hide-emphasis-markers nil))

;; Setup Undo tree
(use-package undo-tree
  :ensure t)
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(undo-tree rainbow-delimiters evil doom-modeline which-key ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

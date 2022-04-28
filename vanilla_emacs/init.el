;; Initialize package sources
(require 'package)

;; Initialize package manager
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
;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Load settings.org
(require 'org)
(delete-file  (expand-file-name (concat user-emacs-directory "settings.el")))
(org-babel-load-file (expand-file-name (concat user-emacs-directory "settings.org"))) :meetings:

;; Auto-generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-completion-style 'helm)
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(org-tempo company lsp-ivy helm-lsp lsp-ui lsp-mode evil-collection org-bullets org-fancy-priorities helm undo-tree rainbow-delimiters evil doom-modeline which-key ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

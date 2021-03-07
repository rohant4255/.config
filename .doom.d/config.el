;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/current/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Tmux style window navigation
(global-set-key (kbd "C-j") (kbd "SPC w j"))
(global-set-key (kbd "C-k") (kbd "SPC w k"))
(global-set-key (kbd "C-h") (kbd "SPC w h"))
(global-set-key (kbd "C-l") (kbd "SPC w l"))
(define-key evil-normal-state-map (kbd "C-j") (kbd "SPC w j"))
(define-key evil-normal-state-map (kbd "C-k") (kbd "SPC w k"))
(define-key evil-normal-state-map (kbd "C-h") (kbd "SPC w h"))
(define-key evil-normal-state-map (kbd "C-l") (kbd "SPC w l"))

;; Priority Org-Mode Todos
(define-key evil-normal-state-map (kbd "M-[") 'org-priority-up)
(define-key evil-normal-state-map (kbd "M-]") 'org-priority-down)

;; Better scrolling
(define-key evil-normal-state-map "K" (kbd "<prior>"))
(define-key evil-normal-state-map "J" (kbd "<next>"))
;; Buffer Navigation
(define-key evil-normal-state-map (kbd "H") (kbd "SPC b p"))
(define-key evil-normal-state-map (kbd "L") (kbd "SPC b n"))
(define-key evil-normal-state-map "H" (kbd "SPC b p"))
(define-key evil-normal-state-map "L" (kbd "SPC b n"))
;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))

;; Define subtree moving
(define-key evil-normal-state-map (kbd "M-k") 'org-move-subtree-up)
(define-key evil-normal-state-map (kbd "M-j") 'org-move-subtree-down)
;; Ignore scheduled tasks in org agenda
(setq org-agenda-todo-ignore-with-date t)
;; Set bullets for lists
;; (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
;; Add WAITING state to org-todos
(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "DONE")))
;; Add Tags
(setq org-tag-alist '(("@meeting" . ?m) ("@home" . ?h) ("laptop" . ?l)))
;; Export beamer presentation from org mode
;; TODO: Fix hack to convert lower headings to items
;; (defun export-beamer ()
;;   (interactive)
;;   (goto-char (point-min))
;;   (while (search-forward "****" nil t)
;;     (replace-match "    -"))
;;   (goto-char (point-min))
;;   (while (search-forward "***" nil t)
;;     (replace-match "   -"))
;;   (goto-char (point-min))
;;   ;; (while (search-forward "**" nil t)
;;   ;;   (replace-match "  -"))
;;   (org-beamer-export-to-pdf)
;;   (undo-tree-undo))
(require 'ox-beamer)
(define-key org-mode-map (kbd "C->") 'export-beamer)
;; Custom Agenda View
(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.
   PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))
(setq org-agenda-custom-commands
  '(("c" "Schedule and Tasks"
    ;; ((tags "PRIORITY=\"A\""
    ;;        ((org-agenda-skip-function
    ;;          '(or (org-agenda-skip-entry-if 'todo 'done)
    ;;               (org-agenda-skip-entry-if 'nil 'scheduled)))
    ;;         (org-agenda-overriding-header "Today")
    ;;         ))
     ((agenda ""
             ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
              (org-agenda-entry-types '(:scheduled :deadline))))
     ;; (tags "PRIORITY=\"B\""
     ;;       ((org-agenda-skip-function
     ;;         '(or (org-agenda-skip-entry-if 'todo 'done)
     ;;              (org-agenda-skip-entry-if 'nil 'scheduled)))
     ;;        (org-agenda-overriding-header "This Week")))
     (alltodo ""
              ((org-agenda-skip-function
                '(or (org-agenda-skip-entry-if 'todo 'done)
                     (org-agenda-skip-if nil '(scheduled deadline))))
               (org-agenda-sorting-strategy '(priority-down todo-state-up))
               )))
    ;; ((org-agenda-compact-blocks t))
     ((org-agenda-skip-deadline-prewarning-if-scheduled t))
     )
    ("d" "Urgent Tasks"
     ((tags-todo "PRIORITY=\"A\"&SCHEDULED<=\"<today>\""
            ((org-agenda-span 'day)
             (org-agenda-skip-function
              '(or (org-agenda-skip-entry-if 'todo '("DONE" "WAITING"))
                   nil))
             ))))
    ))
;; Shortcut for custom agenda view
(define-key global-map (kbd "\C-c \C-c") (kbd "SPC o A c"))
(define-key global-map (kbd "\C-c u") (kbd "SPC o A d"))
;; Customize org priorities
(setq org-default-priority ?D)
(setq org-lowest-priority ?E)
(setq org-highest-priority ?A)
;; Colors for priorities
(setq org-priority-faces '((?A :foreground "red")
  (?B :foreground "yellow")
  (?C :foreground "blue")
  (?E :foreground "green")))
;; Set color
(setq org-agenda-with-colors t)
(use-package! org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '((?A . "❗")
                                    (?B . "⮬")
                                    (?C . "⮮")
                                    (?E . "☕"))))
;; Todo state colors
(setq org-todo-keyword-faces
      '(("WAITING" . "gray")))
;; Shortcut for urgent tasks
(defun todo-set-urgent()
  (interactive)
  (org-priority ?A)
  (org-schedule :SCHEDULED "<today>")
)
(define-key global-map (kbd "M-p") 'todo-set-urgent)
;; Org Capture Urgent Tasks
(setq org-default-notes-file (concat org-directory "~/Dropbox/org/current/inbox.org"))
(setq org-capture-templates
      '(("u" "Todo" entry (file+headline "~/Dropbox/org/current/inbox.org" "Tasks")
   "* TODO [#A] %?\n SCHEDULED: %t")
  ))
(define-key global-map (kbd "M-n") (lambda () (interactive) (org-capture  nil "u")))

;; Autosave Org Files
(add-hook 'auto-save-hook 'org-save-all-org-buffers)
;; Activate clipboard in terminal
(xclip-mode 1)
;; Support for babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)   ; this line activates dot
   (plantuml . t)
   (ipython . t)
   (python . t)
   (latex . t)))

;; Latex Preview tikz
(add-to-list 'org-latex-packages-alist
             '("" "tikz" t))
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
;; (setq org-latex-create-formula-image-program 'imagemagick)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))
;; Support for image size in org mode
(setq org-image-actual-width nil)
;; Org Mode Tikz Preview
(setq org-preview-latex-default-process 'dvisvgm)

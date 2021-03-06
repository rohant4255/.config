;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     php
     pdf-tools
     csv
     html
     python
     ;; ipython-notebook
     gtags
     octave
     yaml
     ;; (python :variables python-enable-yapf-format-on-save t)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     better-defaults
     emacs-lisp
     git
     bibtex
     markdown
     (org :variables org-enable-reveal-js-support t)
     (mu4e :variables mu4e-alert-enable-mode-line-display t
           mu4e-alert-enable-notifications t
           mu4e-enable-mode-line t)
     ;; (gtags :variables gtags-enable-by-default t)
     ;; (cmake :variables cmake-enable-cmake-ide-support t)
     (c-c++ :variables
            c-c++-enable-rtags-support t
            ;; c-c++-enable-rtags-completion nil
            c-c++-backend 'rtags)
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-term-shell "/bin/bash")
     ;; (spell-checking :variables enable-flyspell-auto-completion t)
     syntax-checking
     version-control
     (latex :variables
            latex-enable-auto-fill t
            latex-build-command "LaTeX"
            )
     auto-completion
     ;; (extra-langs :variables matlab-mode t)
     ;; (xclipboard :variables xclipboard-enable-cliphist t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      rtags
                                      company-rtags
                                      company
                                      cmake-ide
                                      org-fragtog
                                      org-fancy-priorities
                                      org-caldav
                                      evil-mu4e
                                      xclip
                                      org-noter
                                      tikz
                                      ob-ipython
                                      py-yapf
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; dotspacemacs-themes '(doom-city-lights
   ;;                      )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 0.8)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ;; Enable Pasting from GUI
   x-select-enable-clipboard t
   interprogram-paste-function 'x-cut-buffer-or-selection-value
   )
  )

(defun dotspacemacs/user-init ()
  (setq-default
   dotspacemacs-themes '(monokai))
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Todo list with org
  (with-eval-after-load 'org (setq org-agenda-files
                                   (file-expand-wildcards "~/Dropbox/org/current/*.org")))
  (with-eval-after-load 'org (setq org-agenda-window-setup
                                   'current-window))
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
  ;; Enable Nert-Tree by default
  (neotree-show)
  ;; (neotree-dir "~/catkin_build/src")
  ;; (neotree-hidden-file-toggle)
  ;; (switch-to-buffer-other-window "*scratch*")
  ;; Smarter navigation of buffers
  (define-key evil-normal-state-map "H" (kbd "SPC b p"))
  (define-key evil-normal-state-map "L" (kbd "SPC b n"))
  ;; Font size
  (define-key global-map (kbd "C-+") 'text-scale-increase)
  (define-key global-map (kbd "C--") 'text-scale-decrease)
  ;; Bind clang-format-buffer to tab on the c++-mode only:
  ;; (add-hook 'c++-mode-hook 'clang-format-bindings)

  (add-hook 'org-mode-hook 'org-fragtog-mode)
  (defun clang-format-bindings ()
    (define-key c++-mode-map [tab] 'clang-format-buffer)
    (define-key c-mode-map [tab] 'clang-format-buffer))
  (dolist (mode '(c-mode c++-mode))
  (evil-leader/set-key-for-mode mode
    "m g ." 'rtags-find-symbol-at-point
    "m g ," 'rtags-find-references-at-point
    "m g v" 'rtags-find-virtuals-at-point
    "m g V" 'rtags-print-enum-value-at-point
    "m g /" 'rtags-find-all-references-at-point
    "m g Y" 'rtags-cycle-overlays-on-screen
    "m g >" 'rtags-find-symbol
    "m g <" 'rtags-find-references
    "m g [" 'rtags-location-stack-back
    "m g ]" 'rtags-location-stack-forward
    "m g D" 'rtags-diagnostics
    "m g G" 'rtags-guess-function-at-point
    "m g p" 'rtags-set-current-project
    "m g P" 'rtags-print-dependencies
    "m g e" 'rtags-reparse-file
    "m g E" 'rtags-preprocess-file
    "m g R" 'rtags-rename-symbol
    "m g M" 'rtags-symbol-info
    "m g S" 'rtags-display-summary
    "m g O" 'rtags-goto-offset
    "m g ;" 'rtags-find-file
    "m g F" 'rtags-fixit
    "m g L" 'rtags-copy-and-print-current-location
    "m g X" 'rtags-fix-fixit-at-point
    "m g B" 'rtags-show-rtags-buffer
    "m g I" 'rtags-imenu
    "m g T" 'rtags-taglist
    "m g h" 'rtags-print-class-hierarchy
    "m g a" 'rtags-print-source-arguments))
  ;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
  ;; (setq-default message-log-max nil)
  (kill-buffer "*Messages*")
  ;; Disabled *Completions*
  (add-hook 'minibuffer-exit-hook
            '(lambda ()
               (let ((buffer "*Completions*"))
                 (and (get-buffer buffer)
                      (kill-buffer buffer)))))
  ;; Makes *scratch* empty.
  (setq initial-scratch-message "")

  ;; Removes *scratch* from buffer after the mode has been set.
  (defun remove-scratch-buffer ()
    (if (get-buffer "*scratch*")
        (kill-buffer "*scratch*")))
  ;;(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

  ;; Don't show *Buffer list* when opening multiple files at the same time.
  (setq inhibit-startup-buffer-menu t)

  ;; Show only one active window when opening multiple files at the same time.
  (add-hook 'window-setup-hook 'delete-other-windows)

  ;; Fix org mode new line auto bullet problem
  (use-package org
    :bind (:map spacemacs-org-mode-map-root-map ("M-RET" . nil)))

  (setq org-reveal-hlevel 2)

  (setq org-blank-before-new-entry (quote ((heading . nil)
                                           (plain-list-item . nil))))
  (define-key global-map (kbd "M-RET") 'org-meta-return)
  (setq powerline-default-separator 'arrow)
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
  (define-key global-map (kbd "C-SPC") (kbd "C-c a c"))
  (define-key global-map (kbd "C-S-SPC") (kbd "C-c a d"))
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
  (use-package org-fancy-priorities
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

  ;; Show clock-in status on spaceline
  (spaceline-toggle-org-clock-on)

  ;; Set up email
  (require 'evil-mu4e)
  (require 'org-mu4e)
  (setq mu4e-maildir "~/.mail/outlook"
        mu4e-get-mail-command "mbsync -a"
        ;; mu4e-update-interval 60
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        mu4e-attachment-dir "~/Downloads"
        mu4e-use-fancy-chars t
        mu4e-view-prefer-html t
        mu4e-headers-include-related t
        mu4e-headers-show-threads t
        mu4e-html2text-command "html2markdown | grep -v '&nbsp_place_holder;'")
  (setq message-send-mail-function 'smtpmail-send-it
        user-full-name "Rohan Thakker"
        user-mail-address "rohan.a.thakker@jpl.nasa.gov"
        smtpmail-smtp-server "localhost"
        smtpmail-smtp-service 1025)
  ;; Start terminal on exit frame from directory where emacs was started
  ;; (defun run-gnome-terminal-here ()
  ;;   (interactive "@")
  ;;   (shell-command (concat "gnome-terminal  --working-directory="
  ;;                          (file-name-directory (or load-file-name buffer-file-name))
  ;;                          " >/dev/null 2>&1 & disown") nil nil))
  (defun run-terminal ()
    (interactive "@")
    ;; (shell-command (concat "gnome-terminal --working-directory=" (file-name-directory buffer-file-name) " > /dev/null 2>&1 & disown") nil nil)
    (shell-command (concat "gnome-terminal --working-directory=`realpath " command-line-default-directory "` > /dev/null 2>&1 & disown") nil nil)
    (sleep-for 0.3))
  (define-key global-map (kbd "M-t") 'run-terminal)
  (defun run-terminal-on-exit-frame (frame)
    (run-terminal))
  ;; (add-to-list 'delete-frame-functions 'run-terminal-on-exit-frame)
  ;; Outlook Calendar

   ;; allow opening the exchange calendar with 'e' from calendar
   ;; (evil-define-key 'motion calendar-mode-map "e" #'exco-calendar-show-day)
   ;; (setq org-agenda-include-diary t)
   ;; (excorporate-diary-enable)
   ;; (defun ab/agenda-update-diary ()
   ;;   "call excorporate to update the diary for today"
   ;;   (exco-diary-diary-advice (calendar-current-date) (calendar-current-date) #'message "diary updated")
   ;;   )
   ;; ;; update the diary every time the org agenda is refreshed
   ;; (add-hook 'org-agenda-cleanup-fancy-diary-hook 'ab/agenda-update-diary )
   ;; (setq org-caldav-url "http://localhost:1080/users"
   ;;       org-caldav-calendar-id "rohan.a.thakker@jpl.nasa.gov/calendar"
   ;;       org-caldav-uuid-extension ".EML"
   ;;       org-caldav-inbox "~/org/remote.org")
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
  ;; Set Up PlantUML
  (setq org-plantuml-jar-path
        (expand-file-name "~/src/org/contrib/scripts/plantuml.jar"))
  (defun my/fix-inline-images ()
    (when org-inline-image-overlays
      (org-redisplay-inline-images)))
  (add-hook 'org-babel-after-execute-hook 'my/fix-inline-images)
  ;; Latex Babel
  (setq exec-path (append exec-path '("/usr/bin")))
  (load "auctex.el" nil t t)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  ;; Latex Preview tikz
  (add-to-list 'org-latex-packages-alist
               '("" "tikz" t))
  (eval-after-load "preview"
    '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
  ;; (setq org-latex-create-formula-image-program 'imagemagick)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))
  ;; Support for image size in org mode
  (setq org-image-actual-width nil)

  ;; org-ref
  ;; (require 'org-ref)
  (setq reftex-default-bibliography '("~/Dropbox/bibliography/library.bib"))
  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
        org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
        org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
  ;; ;; org-ref with helm-bibtex
  (setq bibtex-completion-bibliography "~/Dropbox/bibliography/references.bib"
        bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
        bibtex-completion-notes-path "~/Dropbox/bibliography/helm-bibtex-notes")
  ;; open pdf with system pdf viewer (works on mac)
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (start-process "open" "*open*" "open" fpath)))
  (setq org-ref-open-pdf-function
        (lambda (fpath)
          (start-process "zathura" "*helm-bibtex-zathura*" "/usr/bin/zathura" fpath)))

  ;; Org Mode Tikz Preview
  (setq org-preview-latex-default-process 'dvisvgm)

  ;; No Eval Prompt Org-babel
  ;; (setq org-confirm-babel-evaluate nil)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-beautify tern prettier-js nodejs-repl livid-mode js2-refactor yasnippet multiple-cursors js-doc import-js grizzl impatient-mode pfuture lv ivy company add-node-modules-path neotree yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill treemacs-projectile treemacs-evil toc-org symon string-inflection spaceline-all-the-icons smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-ipython nameless mwim multi-term move-text monokai-theme mmm-mode markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide importmagic hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate google-c-style golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy font-lock+ flyspell-correct-helm flycheck-rtags flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav ein editorconfig dumb-jump dotenv-mode doom-themes doom-modeline disaster diminish diff-hl define-word cython-mode counsel-projectile company-statistics company-rtags company-c-headers company-auctex company-anaconda column-enforce-mode cmake-ide clean-aindent-mode clang-format centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (quote
    ("~/projects/sael/survey/survey.org" "~/Dropbox/org/current/inbox.org" "~/Dropbox/org/current/PropEst.org" "~/Dropbox/org/current/joel.org" "~/Dropbox/org/current/meeting_notes.org" "~/Dropbox/org/current/racer.org" "~/Dropbox/org/current/talks.org" "~/Dropbox/org/current/srtd.org")))
 '(package-selected-packages
   (quote
    (company-rtags flycheck-ycmd company-ycmd ycmd request-deferred py-yapf drupal-mode phpunit phpcbf php-auto-yasnippets php-mode ob-ipython tikz pdf-tools key-chord ivy tablist bibtex-completion parsebib biblio biblio-core helm-bibtexkey helm-bibtex org-ref org-noter-pdftools org-noter xclip evil-mu4e org-caldav excorporate nadvice url-http-ntlm soap-client fsm csv-mode org-fancy-priorities flyspell-popup mu4e-maildirs-extension mu4e-alert ht org-fragtog ox-reveal web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data mmm-mode evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu evil undo-tree auctex spinner adaptive-wrap yapfify yaml-mode xterm-color ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org thrift stan-mode spaceline powerline smeargle smartparens shell-pop scad-mode rtags restart-emacs rainbow-delimiters qml-mode pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text matlab-mode markdown-toc magit-gitflow magit-popup magit macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint julia-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md ggtags fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-unimpaired evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter git-commit with-editor transient evil-escape goto-chg eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav ein skewer-mode markdown-mode polymode deferred request websocket js2-mode simple-httpd dumb-jump doom-themes disaster diminish diff-hl define-word cython-mode company-tern dash-functional tern company-statistics company-c-headers company-auctex company-anaconda company column-enforce-mode coffee-mode cmake-mode cmake-ide levenshtein clean-aindent-mode clang-format bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed auctex-latexmk arduino-mode anaconda-mode pythonic f dash s aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))

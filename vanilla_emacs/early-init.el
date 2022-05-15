;; Disable C-i to jump forward to restore TAB functionality in Org mode.
(setq evil-want-C-i-jump nil)
(setq vc-follow-symlinks t)
(add-hook 'emacs-startup-hook (lambda ()
                                (when (get-buffer "*scratch*")
                                  (kill-buffer "*scratch*"))))

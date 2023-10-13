;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
; (setq doom-font '(font-spec :family "JetBrains Mono NF" :size 24))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `visual)
(setq-default line-spacing .5)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
; (setq doom-font (font-spec :family "JetBrains Mono NF" :size 24))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; keybindings
(map! :leader
      :desc "View Schedule List"
      "z" #'org-agenda-list)

;; python language server
;; to get this to work I had to install pyright with pacaman, add this block
;; run ./doom env, and then completely restart doom emacs (not h r r)
(use-package! lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;; adding todo keywords
;; (setq org-todo-keywords
;;       '((sequence "TODO" "DOING" "|" "DONE" "REMOVED")))

;; org-auto-tangle
(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))


(use-package! org-download)

;; org superstar
(use-package! org-superstar
  :config
  (setq org-superstar-headline-bullets-list '("◉" "○" "■" "◆" "▲" "▶"))
)
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; setting heading sizes
;; (custom-set-faces
;;   '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
;;   '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
;;   '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
;;   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
;;   '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
;; )
(custom-theme-set-faces!
'doom-one
'(org-level-4 :inherit outline-4 :height 1.0)
'(org-level-3 :inherit outline-3 :height 1.1)
'(org-level-2 :inherit outline-2 :height 1.2)
'(org-level-1 :inherit outline-1 :height 1.3)
)

;; centaur tabs
;; (after! centaur-tabs)

;; (use-package! centaur-tabs
;;   :config
;;   (setq centaur-tabs-set-bar 'over)
;; )

;; (use-package! mission-control
;;   :config
;;   (mcon-c-tab-setup-binding))

;; (use-package! mission-control
;;   :config
;;   (mcon-c-tab-setup-binding))


;; (require good-scroll)
;; (after! good-scroll)
;; (use-package! good-scroll
;;   :config
;;   (setq good-scroll-mode 1))

;; scrolling
 (setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1
  )
;; (load "mwheel")
;; (mwheel-install)
;; (mouse-wheel-mode 1)
;; (setq mouse-wheel-progressive-speed nil)
;; (setq redisplay-dont-pause t)
;; (setq mouse-wheel-scroll-amount
;;       '(1 ((shift) . 1)
;;           ((control) . nil)))

;; tab to move through buffers
;; (global-set-key (kbd "C-iso-left-tab") 'previous-buffer)
;; (map!
;;   "C TAB" #'iflipb-next-buffer
;;   "C iso-left-tab" #'iflipb-previous-buffer
 ;; (if (featurep 'xemacs) (kbd "<C-iso-left-tab>") (kbd "<C-S-iso-lefttab>"))
 ;; 'iflipb-previous-buffer)
(use-package! iflipb)
;; (map!
;;         "C-a" #'iflipb-next-buffer
;;         "C-q" #'iflipb-previous-buffer
;; )
;; (global-set-key [f1] 'iflipb-next-buffer)
;; (global-set-key [f2] 'iflipb-previous-buffer)
;; (global-set-key (kbd "C-<tab>") 'iflipb-next-buffer) ;; never worked
;; (global-set-key
;;  (if (featurep 'xemacs) (kbd "<C-iso-left-tab>") (kbd "<C-S-iso-lefttab>"))  ;; worked
;;  'iflipb-previous-buffer)

;; (global-set-key
;;  (if (featurep 'xemacs) (kbd "<C-iso-left-tab>") (kbd "<C-S-iso-lefttab>"))  ;; worked
;;  '+vterm/toggle)
(global-set-key (kbd "M-[") 'iflipb-previous-buffer)
(global-set-key (kbd "M-]") 'iflipb-next-buffer)
(after! treemacs
(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))
)

(global-set-key [f2] '+treemacs/toggle)
(global-set-key (kbd "C-`") '+vterm/toggle)
(after! vterm
  ;; (set-popup-rule! "*doom:vterm-popup:main" :size 0.4 :vslot -4 :select t :quit nil :ttl 0 :side 'right)
  (set-popup-rule! "*doom:vterm-popup" :size 0.4 :vslot -4 :select t :quit nil :ttl 0 :side 'right)
)

(global-set-key (kbd "<mouse-8>") 'iflipb-next-buffer)
(global-set-key (kbd "<mouse-9>") 'iflipb-previous-buffer)

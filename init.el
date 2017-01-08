(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil)
(setq ns-command-modifier 'meta)
(setq ns-function-modifier 'control)
(setq initial-frame-alist '((fullscreen . maximized)))
(blink-cursor-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'package)

(setq package-enable-at-startup nil)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
	     :ensure t
	     :config
	     (evil-mode t))

(use-package magit
	     :ensure t
	     :commands (magit-status))

(use-package general
	     :ensure t
	     :config
	     (general-evil-setup t)

	     (general-define-key
	      :states '(normal visual)
	      "C-u" 'evil-scroll-up
	      "C-d" 'evil-scroll-down)

	     (general-define-key
	      :states '(normal visual insert emacs)
	      :prefix "SPC"
	      :non-normal-prefix "C-SPC"

	      "gs" 'magit-status))

(use-package monokai-theme :ensure t)

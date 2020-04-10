(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "4bdc0dfc53ae06323e031baf691f414babf13c9c9c35014dd07bb42c4db27c24" "64d8237b42b3b01f1487a908836574a5e531ea5efab54b9afa19fb8fda471ab3" "c7aa6fcf85e6fe4ea381733d9166d982bbc423af4a55c26f55f5d0cfb0ce1835" "1119fc59c71d953f66e1b24889886f91ead269831f3e0562cd64b1781cc125c8" default)))
 '(fci-rule-color "#dedede")
 '(line-spacing 0.2)
 '(package-selected-packages
   (quote
    (which-key calfw-org org-pdfview gruvbox-theme counsel ivy projectile elpygen helm elpy magit evil poet-theme)))
 '(pdf-view-midnight-colors (quote ("#282828" . "#f2e5bc"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight normal :width normal)))))

;; Moving auto-save and auto-backup to ~/.emacs.d
;;(setq backup-directory-alist
;;      `((".*" . ,emacs-user-profile)))
(setq backup-directory-alist
      `((".*" . "~/.emacs-backups/")))
;;(setq auto-save-file-name-transforms
;;      `((".*" ,emacs-user-profile t)))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves/" t)))

;; Adding manual packages to path
;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; global line wrapping
(global-visual-line-mode t)

;; Org Mode things

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; org-mode bullets
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; Evil Mode
(require 'evil)
(evil-mode 1)

;; enable elpy
;(elpy-enable)

;; ivy rebinds
(ivy-mode 1)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

;; Trying out which-key
(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)

;; Linux Only Config
(when (equal system-type 'gnu/linux)
;; PDF manipulation in org-mode

(eval-after-load 'org '(require 'org-pdfview))
(add-to-list 'org-file-apps 
             '("\\.pdf\\'" . (lambda (file link)
                                     (org-pdfview-open link)))) 
  )
;; Mac Only Config
(when (equal system-type 'darwin)
;; LaTeX exportation for mac ONLY
 (setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))

;; set PATH for ispell this is on mac, not sure if it is platfrom exclusive
 (setq ispell-program-name "/usr/local/bin/ispell")

;;; Install epdfinfo via 'brew install pdf-tools' and then install the
;;; pdf-tools elisp via the use-package below. To upgrade the epdfinfo
;;; server, just do 'brew upgrade pdf-tools' prior to upgrading to newest
;;; pdf-tools package using Emacs package system. If things get messed
;;; up, just do 'brew uninstall pdf-tools', wipe out the elpa
;;; pdf-tools package and reinstall both as at the start.
;;(use-package pdf-tools
;;  :ensure t
;;  :config
;;  (custom-set-variables
;;    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
;;  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
;; (pdf-tools-install)

 )

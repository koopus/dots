;;; poet-dark-monochrome-theme.el --- A dark monochrome theme for prose.

;; Copyright 2018-now Kunal Bhalla

;; Author: Kunal Bhalla <bhalla.kunal@gmail.com>
;; URL: https://github.com/kunalb/poet/
;; Version: 2.0

;;; Commentary:

;; Emacs has very good support for multiple fonts in a single
;; file.  Poet uses this support to make it much more convenient to
;; write prose within Emacs, with particular attention paid to
;; org-mode and markdown-mode.  Code blocks, tables, etc are
;; formatted in monospace text with the appropriate backgrounds.

;; Theme Customizations
;; - `poet-variable-headers`
;;    Enable / disable different text heights for different faces.

;; Recommended customizations for using this theme
;;
;; - Set up the base fonts you'd like to use in Emacs before loading Poet
;;     (set-face-attribute 'default nil :family "Iosevka" :height 130)
;;     (set-face-attribute 'fixed-pitch nil :family "Iosevka")
;;     (set-face-attribute 'variable-pitch nil :family "Baskerville")
;;   On loading this theme captures the default and treats that for fixed-pitch
;;   rendering.
;;
;; - Enable variable pitch mode for editing text
;;     (add-hook 'text-mode-hook
;;                (lambda ()
;;                 (variable-pitch-mode 1))
;;
;; - Some other modes I like to enable/disable
;;     (olivetti-mode 1)        ;; Centers text in the buffer
;;     (flyspell-mode 1)        ;; Catch Spelling mistakes
;;     (typo-mode 1)            ;; Good for symbols like em-dash
;;     (blink-cursor-mode 0)    ;; Reduce visual noise
;;     (linum-mode 0)           ;; No line numbers for prose
;;
;; - And prettier org mode bullets:
;;     (setq org-bullets-bullet-list
;;         '("◉" "○"))
;;     (org-bullets 1)

;;; Code:

(defvar poet--monospace-height
 (face-attribute 'fixed-pitch :height nil 'default)
 "The original height stored as a defvar to stay constant across reloads.")

(defgroup poet-theme nil
 "Customizations to change the behavior of poet")

(defcustom poet-variable-headers t
 "Use varying sizes for headers in org and markdown"
  :group 'poet-theme
  :type 'boolean)

(defun poet--height (multiplier)
  "Returns the height as MULTIPLIER * monospace-height."
  (if poet-variable-headers
      (truncate (* poet--monospace-height multiplier))
    poet--monospace-height))
(deftheme poet-dark-monochrome
  "A dark monochrome prose friendly theme.")

(let ((fg "#e4e4e4")
      (bg "#0f0f0f")
      (emph "#ededed")
      (sep "#434343")
      (hlt "#000000")
      (bg-hlt "#191919")
      (muted "#a9a9a9")
      (meta "#e4e4e4")
      (link "#d1d1d1")
      (link-underline "#d1d1d1")
      (vlink-underline "#fefefe")
      (header "#b5b5b5")
      (button "#a9a9a9")
      (glyph "#e7e7e7")
      (cursor "#dddddd")
      (paren-match-bg "#8a8a8a")
      (paren-match-fg "#fefefe")
      (search-fg "#fefefe")
      (search-bg "#9d9d9d")
      (search-fail-bg "#d8d8d8")
      (tooltip-fg "#101010")
      (tooltip-bg "#b9b9b9")
      (shadow "#989898")
      (secondary-bg "#000000")
      (trailing-bg "#b1b1b1")
      (fci "#dddddd")
      (lazy-hlt-fg "#000000")
      (lazy-hlt-bg "#fefefe")
      (evil-rep-fg "#fefefe")
      (evil-rep-bg "#3d3d3d")
      (mode-line-fg "#d7d7d7")
      (header-line-bg "#101010")
      (mode-line-hlt "#000000")
      (mode-line-inactive "#878787")
      (error "#979797")
      (builtin "#838383")
      (string "#dcdcdc")
      (function-name "#9d9d9d")
      (keyword "#b4b4b4")
      (constant "#a9a9a9")
      (type "#b9b9b9")
      (variable "#b9b9b9")
      (org-meta "#b8b8b8")
      (org-document-info "#b8b8b8")
      (org-table "#161616")
      (org-quote-fg "#efefef")
      (org-quote-bg "#161616")
      (org-date "#b8b8b8")
      (org-title "#929292")
      (org-title-underline "#929292")
      (org-checkbox "#989898")
      (org-scheduled "#dcdcdc")
      (org-scheduled-today "#fefefe")
      (org-done "#717171")
      (org-todo "#7f7f7f")
      (org-tag "#a9a9a9")
      (org-block-line "#060606")
      (org-block-bg "#161616")
      (org-agenda-structure-fg "#a9a9a9")
      (org-agenda-structure-bg "#101010")
      (org-agenda-today-fg "#dcdcdc")
      (org-agenda-today-bg "#000000")
      (org-special-keyword "#767676")
      (org-sched-prev "#d9d9d9")
      (org-agenda-done "#bebebe")
      (hl-line "#1e1e1e")
      (linum-hlt "#bababa")
      (linum "#545454")
      (markdown-markup "#777777")
      (markdown-metadata "#767676")
      (markdown-language "#afafaf")
      (markdown-list "#fefefe")
      (markdown-code-bg "#161616")
      (markdown-pre-bg "#161616")
      (markdown-header-delimiter "#777777")
      (imenu "#b5b5b5"))
 (custom-theme-set-faces 'poet-dark-monochrome
  `(variable-pitch ((t (:family ,(face-attribute 'variable-pitch :family) :height (lambda (_x) (poet--height 1.23))))))
  `(default ((t (:background ,bg :foreground ,fg))))
  `(italic ((t (:foreground ,emph :slant italic))))
  `(highlight ((t (:background ,hlt :overline nil))))
  `(region ((t (:background ,bg-hlt))))
  `(fringe ((t (:background ,bg))))
  `(button ((t (:inherit default :foreground ,button))))
  `(escape-glyph ((t (:foreground ,glyph))))
  `(link ((t (:underline (:color ,link-underline :style line) :foreground ,link))))
  `(link-visited ((t (:inherit link :foreground ,link :underline (:color ,vlink-underline :style line)))))
  `(cursor ((t (:background ,cursor))))
  `(show-paren-match ((t (:background ,paren-match-fg :foreground ,paren-match-bg))))
  `(isearch ((t (:foreground ,search-fg :background ,search-bg))))
  `(isearch-fail ((t (:background ,search-fail-bg))))
  `(query-replace ((t (:inherit isearch))))
  `(tooltip ((t (:inherit default :foreground ,tooltip-fg :background ,tooltip-bg))))
  `(shadow ((t (:foreground ,shadow))))
  `(secondary-selection ((t (:background ,secondary-bg))))
  `(trailing-whitespace ((t (:background ,trailing-bg))))
  `(lazy-highlight ((t (:foreground ,lazy-hlt-fg :background ,lazy-hlt-bg))))
  `(next-error ((t (:inherit region))))
  `(window-divider ((t (:background ,sep :foreground ,sep))))
  `(vertical-border ((t (:background ,sep :foreground ,sep))))
  `(evil-ex-substitute-replacement ((t (:foreground ,evil-rep-fg :background ,evil-rep-bg :underline nil))))
  `(minibuffer-prompt ((t (:inherit fixed-pitch :weight bold :foreground ,meta))))
  `(mode-line ((t (:inherit fixed-pitch :foreground ,mode-line-fg :background ,bg :overline ,sep :box (:line-width 3 :color ,bg)))))
  `(header-line ((t (:overline nil :background ,header-line-bg :box (:line-width 3 :color ,header-line-bg) :underline ,sep :inherit mode-line))))
  `(mode-line-buffer-id ((t (:weight bold))))
  `(mode-line-emphasis ((t (:weight bold))))
  `(mode-line-highlight ((t (:background ,mode-line-hlt))))
  `(mode-line-inactive ((t (:inherit mode-line :background ,bg :foreground ,mode-line-inactive :box (:color ,bg :line-width 3)))))
  `(error ((t (:foreground ,error :inherit fixed-pitch))))
  `(font-lock-comment-face ((t (:foreground ,muted :inherit fixed-pitch))))
  `(font-lock-builtin-face ((t (:foreground ,builtin :inherit fixed-pitch))))
  `(font-lock-string-face ((t (:inherit fixed-pitch :foreground ,string))))
  `(font-lock-function-name-face ((t (:inherit fixed-pitch :foreground ,function-name))))
  `(font-lock-keyword-face ((t (:inherit fixed-pitch :foreground ,keyword))))
  `(font-lock-comment-delimiter-face ((t (:inherit fixed-pitch :inherit font-lock-comment-face))))
  `(font-lock-constant-face ((t (:inherit fixed-pitch :foreground ,constant))))
  `(font-lock-doc-face ((t (:inherit fixed-pitch :inherit font-lock-string-face))))
  `(font-lock-preprocessor-face ((t (:inherit fixed-pitch :inherit font-lock-builtin-face))))
  `(font-lock-regexp-grouping-backslash ((t (:inherit fixed-pitch :inherit bold))))
  `(font-lock-regexp-grouping-construct ((t (:inherit fixed-pitch :inherit bold))))
  `(font-lock-type-face ((t (:foreground ,type :inherit fixed-pitch))))
  `(font-lock-variable-name-face ((t (:inherit fixed-pitch :foreground ,variable))))
  `(font-lock-warning-face ((t (:inherit error))))
  `(org-level-1 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.5))))))
  `(org-level-2 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.4))))))
  `(org-level-3 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.3))))))
  `(org-level-4 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.23))))))
  `(org-level-5 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.23))))))
  `(org-level-6 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.23))))))
  `(org-level-7 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.23))))))
  `(org-level-8 ((t (:inherit default :foreground ,header :height (lambda (_x) (poet--height 1.23))))))
  `(org-meta-line ((t (:inherit fixed-pitch :foreground ,org-meta))))
  `(org-document-info-keyword ((t (:inherit fixed-pitch :foreground ,org-document-info))))
  `(org-document-info ((t (:inherit default :foreground ,org-document-info))))
  `(org-verbatim ((t (:inherit fixed-pitch))))
  `(org-code ((t (:inherit fixed-pitch))))
  `(org-table ((t (:inherit fixed-pitch :background ,org-table))))
  `(org-formula ((t (:inherit org-table :height (lambda (_x) (poet--height 1))))))
  `(org-verse ((t (:inherit default :foreground ,org-quote-fg :background ,org-quote-bg))))
  `(org-quote ((t (:inherit default :foreground ,org-quote-fg :background ,org-quote-bg))))
  `(org-hide ((t (:inherit fixed-pitch :foreground ,bg))))
  `(org-indent ((t (:inherit org-hide))))
  `(org-date ((t (:inherit fixed-pitch :foreground ,org-date :underline nil))))
  `(org-document-title ((t (:inherit default :foreground ,org-title :height (lambda (_x) (poet--height 1.8)) :underline (:color ,org-title-underline)))))
  `(org-checkbox ((t (:inherit fixed-pitch :weight bold :foreground ,org-checkbox))))
  `(org-done ((t (:inherit fixed-pitch :foreground ,org-done))))
  `(org-todo ((t (:inherit fixed-pitch :foreground ,org-todo))))
  `(org-tag ((t (:inherit fixed-pitch :height (lambda (_x) (poet--height 1)) :foreground ,org-tag))))
  `(org-block-begin-line ((t (:inherit fixed-pitch :background ,org-block-line))))
  `(org-block-end-line ((t (:inherit fixed-pitch :background ,org-block-line))))
  `(org-block ((t (:background ,org-block-bg :inherit fixed-pitch))))
  `(org-priority ((t (:inherit fixed-pitch :weight normal))))
  `(org-agenda-structure ((t (:foreground ,org-agenda-structure-fg :background ,bg :box (:line-width 3 :color ,bg) :underline ,org-agenda-structure-bg))))
  `(org-scheduled ((t (:foreground ,org-scheduled))))
  `(org-scheduled-today ((t (:foreground ,org-scheduled-today))))
  `(org-agenda-date-weekend ((t (:inherit org-agenda-structure))))
  `(org-agenda-date-today ((t (:box (:line-width 3 :color ,org-agenda-today-bg) :foreground ,org-agenda-today-fg :background ,org-agenda-today-bg))))
  `(org-special-keyword ((t (:inherit fixed-pitch :foreground ,org-special-keyword))))
  `(org-scheduled-previously ((t (:foreground ,org-sched-prev))))
  `(org-agenda-done ((t (:foreground ,org-agenda-done))))
  `(org-footnote ((t (:foreground ,link))))
  `(hl-line ((t (:background ,hl-line))))
  `(linum-highlight-face ((t (:inherit fixed-pitch :foreground ,linum-hlt))))
  `(linum ((t (:inherit fixed-pitch :foreground ,linum))))
  `(line-number ((t (:inherit fixed-pitch :foreground ,linum))))
  `(line-number-current-line ((t (:inherit fixed-pitch :foreground ,linum-hlt))))
  `(markdown-header-face-1 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.5))))))
  `(markdown-header-face-2 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.4))))))
  `(markdown-header-face-3 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.3))))))
  `(markdown-header-face-4 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.23))))))
  `(markdown-header-face-5 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.23))))))
  `(markdown-header-face-6 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.23))))))
  `(markdown-header-face-7 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.23))))))
  `(markdown-header-face-8 ((t (:foreground ,header :inherit default :height (lambda (_x) (poet--height 1.23))))))
  `(markdown-markup-face ((t (:inherit fixed-pitch :foreground ,markdown-markup))))
  `(markdown-inline-code-face ((t (:inherit fixed-pitch))))
  `(markdown-metadata-key-face ((t (:inherit fixed-pitch :height (lambda (_x) (poet--height 1)) :foreground ,markdown-metadata))))
  `(markdown-metadata-value-face ((t (:inherit fixed-pitch :height (lambda (_x) (poet--height 1)) :foreground ,fg))))
  `(markdown-language-keyword-face ((t (:foreground ,markdown-language))))
  `(markdown-list-face ((t (:inherit fixed-pitch :foreground ,markdown-list))))
  `(markdown-code-face ((t (:inherit fixed-pitch :foreground ,fg :background ,markdown-code-bg))))
  `(markdown-pre-face ((t (:inherit fixed-pitch :color ,fg :background ,markdown-pre-bg))))
  `(markdown-header-delimiter-face ((t (:inherit fixed-pitch :foreground ,markdown-header-delimiter))))
  `(markdown-header-rule-face ((t (:inherit fixed-pitch :foreground ,markdown-header-delimiter))))
  `(markdown-url-face ((t (:inherit fixed-pitch :foreground ,link))))
  `(imenu-list-entry-face-0 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-1 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-2 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-3 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-4 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-5 ((t (:foreground ,imenu))))
  `(helm-source-header ((t (:height (lambda (_x) (poet--height 1)))))))
 (custom-theme-set-variables 'poet-dark-monochrome
  '(line-spacing .2)
  `(fci-rule-color ,fci)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide-theme 'poet-dark-monochrome)
;;; poet-dark-monochrome-theme ends here

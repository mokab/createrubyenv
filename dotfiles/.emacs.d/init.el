;; ---------------------------------------------------
;; バッファとフレームに関する設定
;; ---------------------------------------------------
;;; スタートアップ画面の抑制
(setq inhibit-startup-message t)
(tool-bar-mode 0)
;;; バッファ中の行番号表示
(global-linum-mode t)
(setq linum-format "%4d ")

;;; 初期フレームの設定
(setq default-frame-alist
      (append (list '(foreground-color . "#555")
		    '(background-color . "#d8ffff")
		    '(border-color . "#f00")
		    '(mouse-color . "#fff")
		    '(cursor-color . "MediumPurple2")
		    '(cursor-type . 'hbar)
		    '(width . 90)
		    '(height . 27)
		    '(alpha . 100)
		    )default-frame-alist))

;; ---------------------------------------------------
;; タブ, 全角スペース，行末の空白文字を明示的に表示する
;; ---------------------------------------------------

(defface my-face-b-1 '((t (:background "LightSteelBlue1"))) nil)
(defface my-face-b-2 '((t (:background "LightSteelBlue2"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(global-set-key "\C-h" 'delete-backward-char)

;; ruby-mode の時にマジックコメントの自動挿入を抑止する（Ruby 2.0 以降対応）
;; 良く分からないのでそのまま
(require 'ruby-mode)
(defun ruby-mode-set-encoding () nil)
(custom-set-faces
 '(default
    ((t (:family "Consolas" :foundry "outline" :slant normal :weight bold :height 128 :width normal)))))

;;; 日本語に関する設定
(set-language-environment "Japanese")
	;(prefer-coding-system 'utf-8-unix)
;(prefer-coding-system 'cp932)
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'cp932)
(set-keyboard-coding-system 'cp932)
(set-terminal-coding-system 'cp932)

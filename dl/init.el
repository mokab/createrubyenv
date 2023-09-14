;; ---------------------------------------------------
;; $B%P%C%U%!$H%U%l!<%`$K4X$9$k@_Dj(B
;; ---------------------------------------------------
;;; $B%9%?!<%H%"%C%W2hLL$NM^@)(B
(setq inhibit-startup-message t)
(tool-bar-mode 0)
;;; $B%P%C%U%!Cf$N9THV9fI=<((B
(global-linum-mode t)
(setq linum-format "%4d ")

;;; $B=i4|%U%l!<%`$N@_Dj(B
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
;; $B%?%V(B, $BA43Q%9%Z!<%9!$9TKv$N6uGrJ8;z$rL@<(E*$KI=<($9$k(B
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
     ("$B!!(B" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(global-set-key "\C-h" 'delete-backward-char)

;; ruby-mode $B$N;~$K%^%8%C%/%3%a%s%H$N<+F0A^F~$rM^;_$9$k!J(BRuby 2.0 $B0J9_BP1~!K(B
;; $BNI$/J,$+$i$J$$$N$G$=$N$^$^(B
(require 'ruby-mode)
(defun ruby-mode-set-encoding () nil)
(custom-set-faces
 '(default
    ((t (:family "Consolas" :foundry "outline" :slant normal :weight bold :height 128 :width normal)))))

;;; $BF|K\8l$K4X$9$k@_Dj(B
(set-language-environment "Japanese")
	;(prefer-coding-system 'utf-8-unix)
;(prefer-coding-system 'cp932)
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'cp932)
(set-keyboard-coding-system 'cp932)
(set-terminal-coding-system 'cp932)

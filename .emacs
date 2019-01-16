   
; column number mode
;;; Code:

(setq column-number-mode t)
(setq line-number-mode t)

(delete-selection-mode t)

; toggle blinking cursor
(blink-cursor-mode 0)

;(require 'server)
;(unless (server-running-p) (server-start))


;;; Commentary:
;; 

(require 'package)

(setq
 package-archives
 '(("gnu" . "http://elpa.gnu.org/packages/")
   ("melpa" . "http://melpa.org/packages/")
   ("melpa-stable"."http://stable.melpa.org/packages/")
   ("org" . "http://orgmode.org/elpa/")))


(package-initialize)

;; (when (not package-archive-contents)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (require 'use-package)

;; (use-package ensime
;;   :pin melpa-stable)

(setq exec-path (append exec-path '("/usr/local/bin")))



;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)




(require 'htmlize)
(setq htmlize-output-type 'inline-css)

; enable parens mode,
(show-paren-mode 1)

(setq server-use-tcp t)

(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)


(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

(setq mouse-wheel-scroll-amount '(0.01))

					;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; Pretty Print xml region by Benjamin Ferrari		      ;;
;; ; http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun haroonkhan/pretty-print-xml-region (begin end)
  "Pretty Print XML markup in region.
   Function inserts line breaks to seperate tags that have
   nothing but whitespace between them. It then indents the markup by using nxml's
   indentation rules"
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char)
      (insert "\n")
      (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))

(global-auto-revert-mode 1)


(setq auto-mode-alist
           (append  '(("\\.st\\'" . gst-mode))
                    auto-mode-alist))
     
(autoload 'gst-mode "/usr/local/Cellar/gnu-smalltalk/3.2.5_2/share/emacs/site-lisp/gnu-smalltalk/smalltalk-mode.elc" "" t)

(require 'helm-config)


(add-hook 'haskell-mode-hook 'intero-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" default)))
 '(package-selected-packages
   (quote
    (projectile psci psc-ide helm-dash wolfram-mode org-page geiser paredit color-theme quasi-monochrome-theme elpy dark-mint-theme nix-sandbox nix-mode company-nixos-options helm-idris idris-mode folding zenburn-theme magit ensime gh-md org ascii auctex-latexmk w3m pgdevenv yaml-mode web-mode uuidgen tuareg smart-shift shampoo scala-mode sbt-mode php-mode organic-green-theme minimal-theme magit-filenotify json-mode intero idea-darkula-theme htmlize helm ham-mode groovy-mode ghc fsharp-mode framemove flycheck-ghcmod doremi csharp-mode crontab-mode company-coq column-enforce-mode cmake-mode applescript-mode ansible-doc ansible ample-theme ace-window ac-ispell ac-haskell-process 2048-game)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Markdown-mode open command
(setq markdown-open-command "/usr/local/bin/open-with-marked2")

;; Backup file management
;; (setq make-backup-files nil) ; stop creating backup~ files
;; (setq auto-save-default nil) ; stop creating #autosave# files

;; ;; backup in one place. flat, no tree structure
;; (setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; make backup to a designated dir, mirroring the full path

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* ((backupRootDir "~/.emacs.d/emacs-backup/")
	 (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
	 (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~"))))
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))

(setq make-backup-file-name-function 'my-backup-file-name)

;; Set TaskJuggler Mode
(add-to-list 'load-path "/Users/hkhanhex/.emacs.d/tjmode/")


(load "taskjuggler-mode")

(require 'taskjuggler-mode)

;; add org-mode contrib
(add-to-list 'load-path "/Users/hkhanhex/.emacs.d/org-mode/contrib/lisp/")
;; enable task juggler
(load "ox-taskjuggler")
(require 'ox-taskjuggler)

(add-to-list 'custom-theme-load-path "~/.emacs.d//elpa/zenburn-theme-20170306.2250")
(add-to-list 'custom-theme-load-path "~/.emacs.d//elpa/dark-mint-theme-20160301.2242")
(add-to-list 'custom-theme-load-path "~/.emacs.d//elpa/quasi-monochrome-theme-20170124.136/")

;; (load-theme 'zenburn t)
;; (load-theme 'dark-mint t)
(when (display-graphic-p)
  (load-theme 'quasi-monochrome t))


;; Open .v files wiht Proof General's coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; (require 're-builder)
;; (setq reb-re-syntax 'string)


;; Zoom Font Size
		
;; Insert date time string
(defun insert-current-date () (interactive)
       (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))


;; Function Added 2017-10-14 14:07:43
(defun insert-current-datetime()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date \"+%Y-%m-%d %H:%M:%S\")")))

;;
;; Rename a file and buffer that's visiting the file
;;
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn 	(rename-file filename new-name 1)
		(rename-buffer new-name))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (progn
	(copy-file filename newname 1)
	(delete-file filename)
	(set-visited-file-name newname)b
	(set-buffer-modified-p nil) t)))) 



(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; display file path for buffer in frame title
(setq-default frame-title-format "%b (%f)")

(defun markdown-preview-file ()
  "use Marked 2 to preview the current file"
  (interactive)
  (shell-command 
   (format "open -a 'Marked 2.app' %s" 
       (shell-quote-argument (buffer-file-name))))
)
(global-set-key "\C-cm" 'markdown-preview-file)

;;; .emacs ends here

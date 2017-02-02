
(setq load-path (cons "/opt/sicstus/4.2.1/lib/sicstus-4.2.1/emacs/" load-path))
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(setq prolog-use-sicstus-sd t)
(setq auto-mode-alist (cons '("\\.pl$" . prolog-mode) auto-mode-alist))



(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;;set register i to direct to this ini-file (.emacs)
(set-register ?i (cons 'file "~/.emacs"))

;;different language editing modes--------------------------------
;;python
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;;c++
(add-hook 'c++-mode-hook 'irony-mode)

;;----------------------------------------------------------------



;;enable windmove for easier window navigation (allows the use of direction arrows)
(global-set-key (kbd "C-S-<left>") 'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>")    'windmove-up)
(global-set-key (kbd "C-S-<down>")  'windmove-down)

;;Move current line up/down:
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "M-<up>")  'move-line-up)
(global-set-key (kbd "M-<down>")  'move-line-down)


;;keep the buffers saved when session is closed and a new session is started
;;(desktop-save-mode)


;;hide passwords
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)


;;enable clipboard copy
(x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

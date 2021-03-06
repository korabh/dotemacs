;; init.el --- My personal Emacs configuration.
;;
;; Copyright (c) 2015, 2016
;;
;; Author: Jonathan Chu <me@jonathanchu.is>
;; URL: https://github.com/jonathanchu/dotemacs
;; Version: 1.0

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This is the whole #!

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(setq user-full-name "Jonathan Chu"
      user-mail-address "me@jonathanchu.is")

(add-to-list 'exec-path "/usr/local/bin")

(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Your Emacs is powering up... Be patient, Master %s!" current-user)

;;----------------------------------------------------------------------------
;; Packages
;;----------------------------------------------------------------------------

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))


(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package
(setq use-package-enable-imenu-support t)
(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)
(require 'diminish)
(require 'bind-key)

;;----------------------------------------------------------------------------
;; Global Config
;;----------------------------------------------------------------------------

;; load in custom-set-variables early. FIXME
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-branch-arguments nil)
 '(package-selected-packages
   (quote
    (paperless flycheck-pos-tip fringe-helper nlinum highlight-numbers xterm-color web-mode volatile-highlights use-package smex smartparens smart-comment scratch rich-minority restclient rainbow-mode rainbow-delimiters python-mode powerline popwin paradox origami org-bullets neotree markdown-mode magit less-css-mode latex-preview-pane key-chord js2-mode imenu-anywhere ido-vertical-mode ido-ubiquitous ibuffer-vc highlight-tail helm-projectile helm-ag gitignore-mode github-browse-file gitconfig-mode git-timemachine git-messenger git-gutter-fringe fullframe frame-fns flycheck flx-ido fix-word fireplace f expand-region exec-path-from-shell evil esup elpy easy-kill dired-single dired-quick-sort dired+ diff-hl deft counsel command-log-mode clj-refactor blank-mode beacon atom-one-dark-theme anzu all-the-icons aggressive-indent ag ace-window)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defvar my-init-file (expand-file-name "emacs-init.el" user-emacs-directory)
  "All configurations stored in this file.")

(load-file my-init-file)
(load-file "~/.emacs.d/doom.el")
;;; init.el ends here

;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     java
     python
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     org
     command-log
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     emoji
     ;; only load scala on Mac for now (not on windows)
     scala
     (clojure :variables
              clojure-enable-fancify-symbols t
              ;; https://github.com/syl20bnr/spacemacs/blob/develop/layers/+lang/clojure/README.org#enabling-sayid-or-clj-refactor
              clojure-enable-clj-refactor t
              ;; https://develop.spacemacs.org/layers/+lang/clojure/README.html 2.3.1
              ;; If using the develop branch, clj-kondo is available as a part of the standard clojure layer.
              ;; https://cljdoc.org/d/clj-kondo/clj-kondo/2019.10.11-alpha/doc/editor-integration
              clojure-enable-linters 'clj-kondo
              )
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      alarm-clock
                                      flycheck-clj-kondo
                                      gradle-mode
                                      groovy-mode
                                      heaven-and-hell
                                      log4j-mode
                                      logview
                                      org-clock-csv
                                      zprint-mode
                                      ztree
                                                 ;; How to install packages not in melp https://github.com/syl20bnr/spacemacs/issues/2278
                                                 (periodic-commit-minor-mode :location (recipe
                                                                        :fetcher github
                                                                        :repo "aaronbieber/periodic-commit-minor-mode"))
                                                 )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-mode-line-theme 'spacemacs
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(deeper-blue
                         tango-dark
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `n il` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 95
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 95
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for ariables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default

   ;; Allow hash # to be entered on a UK keyboard.
   ;; Note there is a second part to this fix lower down in the file.
   ;; Discussion on spacemacs forum
   ;; https://github.com/syl20bnr/spacemacs/issues/1435
   mac-right-option-modifier nil)

  ;; Problem!
  ;; https://apple.stackexchange.com/questions/399187/how-to-set-default-directory-for-emacs-27-1-app
  (setq default-directory "~/")
  (setq command-line-default-directory "~/")

  ;; Must install coreutils on a mac
  ;; https://emacs.stackexchange.com/questions/29096/how-to-sort-directories-first-in-dire  
  ;;https://gitlab.com/xuhdev/dired-quick-sort/-/issues/8
  (setq insert-directory-program "/usr/local/bin/gls")
  ;; (setq insert-directory-program nil)
  ;; https://gitlab.com/xuhdev/dired-quick-sort/-/blob/9741bae65b5ca077a81589dcc6b3ca3c12f0f76f/dired-quick-sort.el#L187
  ;; NOTE may have to load this set program manually in buffer with C-x C-e as per issue.



  ;; More reading https://www.masteringemacs.org/article/mastering-key-bindings-emacs
  ;; Problems with more than one keyboard: https://apple.stackexchange.com/questions/277510/osx-different-keyboards-with-different-input-methods-possible
  ;; In order to switch between # and £ on Mac, I've decided to simply change between keyboard sources, given two keyboard (Ctrl-SPC)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; My overridden configuration to enable transparency at startup
  ;; https://github.com/syl20bnr/spacemacs/issues/4435
  (add-hook 'after-make-frame-functions 'spacemacs/enable-transparency)
  (spacemacs/enable-transparency)

  ;; key binds - override I-search
  (global-set-key (kbd "C-s") 'helm-occur)
  ;; Vim's evil command lines
  (global-set-key (kbd "C-:") 'evil-ex)
  ;; Default binding for Avy as per website, with a tweak not to interfere with org mode
  (global-set-key (kbd "C-;") 'avy-goto-char-2)

  ;; Pretty printing for Clojure https://github.com/pesterhazy/zprint-mode.el
  (global-set-key (kbd "C-c p") 'zprint)

  ;; Give a warning when you are actively working on a particular clock
  (setq org-clock-idle-time 15)
  (setq org-log-note-clock-out t)


  ;; ISO 8601 timestamp insertion
  (defun timestamp ()
    (interactive)
    (insert (format-time-string "%Y-%m-%dT%H:%M:%S")))
  (global-set-key (kbd "C-x t") 'timestamp)

  ;; Only use helm buffers, the default gets in the way
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)

  ;; maps could be cider-mode-map or global-map
  (defhydra hydra-clojure (global-map "C-1")
    ("{" sp-wrap-curly)
    ("(" sp-wrap-round)
    ("[" sp-wrap-square)
    ("+" enlarge-window)
    ("<up>" (lambda ()
              (interactive)
              (setq this-command 'previous-line)
              (previous-line 5)))
    ("<down>" (lambda ()
                (interactive)
                (setq this-command 'next-line)
                (next-line 5)))
    ("<left>" previous-buffer)
    ("<right>" next-buffer)
    ("k" kill-buffer)
    )

  ;; Use mdfind on osx for helm locate
  ;; https://github.com/syl20bnr/spacemacs/issues/3280
  (setq helm-locate-command
        (case system-type
          ('gnu/linux "locate -i -r %s")
          ('berkeley-unix "locate -i %s")
          ('windows-nt "es %s")
          ('darwin "mdfind -name %s %s")
          (t "locate %s")))
  (if (eq system-type 'darwin) (setq helm-locate-fuzzy-match nil))

  ;; Org Agenda
  (setq org-agenda-files (list "~/work-tracked-files/todo.org"))

  ;; TODO add a switch back in
  ;;(org-agenda-files
  ;;    -   (list "~/mytrackedfiles/todolist.org" "~/mytrackedfiles/stock_research.org"))


  ;; Cider configuration
  ;;
  (setq cider-shadow-cljs-command "yarn shadow-cljs")
  ;; clojure stacktraces may be huge, so make the *Messages* buffers bigger
  ;; (setq message-log-max 100000)
  
  ;; https://github.com/borkdude/clj-kondo/blob/master/doc/editor-integration.md#spacemacs
  (use-package clojure-mode
    :ensure t
    :config
    (require 'flycheck-clj-kondo))

  ;; From https://clojurians-log.clojureverse.org/spacemacs/2017-10-19
  ;; (require 'flycheck-joker) TODO for later.
  ;; TODO fix this.
  ;;(spacemacs/add-flycheck-hook 'clojure-mode) ;; flycheck-mode won't load on .clj files without this line.
  ;;(spacemacs/add-flycheck-hook 'clojurescript-mode)

  ;; Set priority colours in org mode
  (setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
                             (?B . (:foreground "yellow"))
                             (?C . (:foreground "green"))))


  ;; More info on the format https://github.com/doublep/logview/blob/master/logview.el#L179
  (setq logview-additional-submodes
        ;;INFO  [com..endofday.jmx.EndOfDay] (pool-2-thread-6) [SYSTEM] [] Setting up parameters for EoD
    '(("NOTIME" . ((format  . "LEVEL  [NAME] (THREAD) [IGNORED] []")
                  (levels  . "SLF4J")
                  (aliases . ("NoTime"))))
      ;;INFO, com.chpconsulting.alfa.endofday.jmx.EndOfDay, "2019.03.29 04:39:10.416", pool-2-thread-4, "[SYSTEM] [] Setting up parameters for EoD"
      ("AL-TIME" . ((format  . "LEVEL, NAME, \"TIMESTAMP\",")
                         (levels  . "SLF4J")
                         (aliases . ("AL-Embedded"))
                         (time-stamp-format . "ISO 8601 datetime + millis")
                         )
      ;; We misuse thread as a field for hostname.
        ;;("UNIX"  . ((format  . "TIMESTAMP THREAD NAME:")
       )))


  (setq logview-additional-timestamp-formats
  '(("ISO 8601 datetime + millis"             "yyyy-MM-dd HH:mm:ss.SSS")
    ("ISO 8601 datetime + micros"             "yyyy-MM-dd HH:mm:ss.SSSSSS")
    ("ISO 8601 datetime"                      "yyyy-MM-dd HH:mm:ss")
    ("ISO 8601 datetime (with 'T') + millis"  "yyyy-MM-dd'T'HH:mm:ss.SSS")
    ("ISO 8601 datetime (with 'T') + micros"  "yyyy-MM-dd'T'HH:mm:ss.SSSSSS")
    ("ISO 8601 datetime (with 'T')"           "yyyy-MM-dd'T'HH:mm:ss")
    ("ISO 8601 time only + millis"            "HH:mm:ss.SSS")
    ("ISO 8601 time only + micros"            "HH:mm:ss.SSSSSS")
    ("ISO 8601 time only"                     "HH:mm:ss")
    (nil                                      "MMM d HH:mm:ss")
    (nil                                      "MMM d h:mm:ss a")
    (nil                                      "h:mm:ss a")))


  ;; As per https://github.com/syl20bnr/spacemacs/issues/7641
  ;; May need to run (spacemacs/recompile-elpa) after first installing emacs 
  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (shell . t)

       ;;NOTE removing the following in an attempt to solve https://emacs.stackexchange.com/questions/38306/file-is-missing-cannot-open-load-file-no-such-file-or-directory-ob-scala
       ;;(scala . t)
       (python . t)
       ;; https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-js.html
       ;; Helpful http://rwx.io/posts/org-with-babel-node-updated/
       (js . t) ;; Make sure to write '#+begin_src js' and not '... javascript'
       (clojure . t)
       )
     )
;;TODO   (add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))
    )

  ;; Hook to enable this minor mode if the following org property exists
  ;; Got idea https://github.com/kametoku/orgmine
  ;; #+PROPERTY: periodic_commit_minor_mode enable
  (add-hook 'org-mode-hook
            (lambda () (if (and (boundp 'org-file-properties)
                            (assoc "periodic_commit_minor_mode" org-file-properties))
                           (periodic-commit-minor-mode))))
  ;; Only periodically commit tracked files (not all)
  (setq pcmm-commit-all nil)
  ;; Save every 2 hours (interval in seconds)
  (setq pcmm-commit-frequency 7200)


  ;; Add a cheatsheet function over a file
  ;;
  ;; See https://github.com/emacs-helm/helm/blob/master/helm-source.el
  ;; Searching inspired by  https://github.com/emacs-helm/helm/blob/master/helm-occur.el#L199
  ;; TODO Ensure not a fuzzy match.
  (defvar my-cheatsheet-regex "\\s-\\{1\\}\\(.*\\)\\'"
    "Copied")
  (defun my-cheatsheet ()
    (interactive)
    (helm :sources (helm-build-in-file-source
                       "My cheatsheet" "~/myconfig/emacs/mycheatsheet.org"
                       
                       :action (lambda (candidate)
                                 (let ((linum (with-helm-buffer
                                                (get-text-property
                                                 1 'helm-linum
                                                 (helm-get-selection nil 'withprop)))))
                                   (find-file (with-helm-buffer
                                                (helm-attr 'candidates-file)))
                                   (goto-line linum)))
                       ;; :match-part
                       ;; (lambda (candidate)
                       ;;   ;; The regexp should match what is in candidate buffer,
                       ;;   ;; not what is displayed in helm-buffer e.g. "12 foo"
                       ;;   ;; and not "12:foo".
                       ;;   (when (string-match my-cheatsheet-regex 
                       ;;                       candidate)
                       ;;     (match-string 2 candidate)))
                       ;; :search (lambda (pattern)
                       ;;           (when (string-match "\\`\\^\\([^ ]*\\)" pattern)
                       ;;             (setq pattern (concat "^[0-9]* \\{1\\}" (match-string 1 pattern))))
                       ;;           (condition-case _err
                       ;;               (re-search-forward pattern nil t)
                       ;;             (invalid-regexp nil)))
                       ;; :nomark t
                       ;; :migemo t
                       )
          :buffer "*My cheatsheet*")
    )


  ;; Doesn't work...
  ;; https://www.reddit.com/r/emacs/comments/415imd/prettier_orgmode_source_code_blocks/
  ;; In org mode, add a space after headings
  (setq org-src-block-faces '(("emacs-lisp" (:background "#000000"))
                              ("elisp" (:background "#000000"))
                              ("bash" (:background "#000000"))
                              ("sh" (:background "#000000"))
                              ("shell" (:background "#000000"))
                              ("python" (:background "#000000"))
                              ("clojure" (:background "#000000"))))

  (setq org-cycle-separator-lines 1)

  ;; The default of 20 cuts off clojure repl buffer information helpful to locate it.
  (setq helm-buffer-max-length 30)

  ;; Add the improved org tags functionality to emacs.
  (with-eval-after-load 'org 
    (load "~/myconfig/emacs/air-org-set-tags-hook.el")
    )

  ;; using heaven-and-hell to switch between themes
  (use-package heaven-and-hell
    :ensure t
    :init
    (setq heaven-and-hell-theme-type 'dark) ;; Omit to use light by default
    ;;(setq heaven-and-hell-theme-type 'light) ;;
    (setq heaven-and-hell-themes
          '((light . (default adwaita)) ;; 
            (dark . (deeper-blue )))) ;; Themes can be the list: (dark . (tsdh-dark wombat)) but this will apply characteristics of all of them
    ;; wombat was okay dark, except it would white out the line being edited.
    ;; adwaita is an okay light theme
    :hook (after-init . heaven-and-hell-init-hook) ;;
    ;;  :hook (emacs-startup . heaven-and-hell-init-hook) ;; if above does not work
    :bind (("C-<f6>" . heaven-and-hell-load-default-theme)
           ("<f6>" . heaven-and-hell-toggle-theme)))

  ;; key bindings
  (when (eq system-type 'darwin) ;; mac specific settings

    ;; Make Mac key closest to spacebar behave like linux and windows
    ;; https://emacs.stackexchange.com/questions/14325/how-do-i-use-the-same-keybindings-on-windows-and-mac
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'control)

    ;; Remove the right-alt-key-binding, so you can hit # on mac
    (setq ns-right-alternate-modifier (quote none))

    )

  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-enabled-themes '(deeper-blue))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(evil-want-Y-yank-to-eol nil)
 '(gradle-mode t)
 '(helm-completion-style 'helm)
 '(helm-external-programs-associations nil)
 '(menu-bar-mode t)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(org-clock-csv groovy-mode gradle-mode company-emacs-eclim eclim command-log-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc coffee-mode flycheck-clj-kondo alarm-clock zprint-mode heaven-and-hell pyenv-mode hy-mode company-anaconda anaconda-mode yapfify pyvenv pytest py-isort pip-requirements live-py-mode dash-functional helm-pydoc cython-mode pythonic clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg lv cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a ztree noflet ensime sbt-mode scala-mode periodic-commit-minor-mode datetime extmap logview log4j-mode sass-mode company-web web-mode tagedit slim-mode scss-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode web-completion-data cheatsheet emoji-cheat-sheet-plus company-emoji jira-markup-mode emojify smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit transient git-commit with-editor company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete meghanada ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

(defvar jaseem/packages '(
                          ac-slime
                          apache-mode
                          auctex
                          auto-compile
                          auto-complete
                          auto-indent-mode
                          autopair
                          bash-completion
                          bitlbee
                          bundler
                          buster-mode
                          buster-snippets
                          centered-cursor-mode
                          cl-lib
                          clojure-mode
                          cm-mode
                          cmake-mode
                          cmake-project
                          coffee-mode
                          combinators
                          creole
                          crontab-mode
                          csv-mode
                          dash
                          desktop
                          dired+
                          doc-mode
                          dropdown-list
                          erlang
                          expand-region
                          findr
                          flymake
                          flymake-easy
                          flymake-haskell-multi
                          flymake-hlint
                          gh
                          gist
                          git-commit-mode
                          gitconfig-mode
                          gitignore-mode
                          guru-mode
                          hackernews
                          haml-mode
                          handlebars-mode
                          haskell-mode
                          httpcode
                          inf-ruby
                          inflections
                          jade-mode
                          jinja2-mode
                          jira
                          js2-mode
                          js2-refactor
                          jump
                          kv
                          less-css-mode
                          logito
                          lorem-ipsum
                          lua-mode
                          magit
                          markdown-mode
                          marmalade
                          nginx-mode
                          org
                          packed
                          paredit
                          pcache
                          php-mode
                          rainbow-mode
                          rinari
                          ruby-compilation
                          ruby-mode
                          ruby-test-mode
                          ruby-tools
                          rvm
                          smex
                          sws-mode
                          yaml-mode
                          yasnippet
                          zencoding-mode)
  "Default packages")

(defun jaseem/packages-installed-p ()
  (loop for pkg in jaseem/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (jaseem/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg jaseem/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
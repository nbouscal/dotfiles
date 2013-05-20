source ~/.antigen/antigen.zsh
antigen-lib
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-theme nathan
antigen-apply

PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

cd() {
    builtin cd "$@" && ls
}

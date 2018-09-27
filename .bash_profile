if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
# TODO move this .bashrc
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

eval "$(jenv init -)"


if [ -e /Users/hkhanhex/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/hkhanhex/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(pyenv init -)"

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

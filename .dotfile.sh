IS_LINUX=false
IS_MACOS=false

case `uname -s` in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${uname -s}"
esac

if [[ machine = "Mac" ]]; then
	alias copy="pbcopy"
elif [[ machine = "Linux" ]]; then
	alias copy="xclip -selection clipboard"
fi

alias clipboard=$copy

alias vim="nvim"
alias vi="nvim"
# alias pip="pip --user"
export EDITOR=$(which nvim)
alias dotfile="$EDITOR ~/.dotfile.sh"

# export LANG="en_IN.utf8"

alias fzf="fzf --height 40%"
alias aws="python3 -m awscli"
alias ls="gls --color"

export HOMEBREW_NO_AUTO_UPDATE=1

export PATH="/usr/local/sbin:$PATH"
export PATH="${HOME}/go/bin:$PATH"
export PATH="${HOME}/bin:$PATH"

function portainer() {
	docker volume create portainer_data
	docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
}


alias gradle="gw"
#eva "$(direnv hook zsh)"

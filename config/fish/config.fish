####### Colour Scheme #########
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-eighties.sh
end

######## Environment ########
set -gx fish_greeting ''

fish_add_path "/usr/local/bin"
fish_add_path "$HOME/.local/bin"

set -gx EDITOR vim
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

######### Aliases #########

alias g "git";

######### Functions #########

function rf; source ~/.config/fish/config.fish; end
function ef; vim ~/.config/fish/config.fish; rf; end
function ev; vim ~/.vimrc; end
function eg; vim ~/.gitconfig; end
function essh; vim ~/.ssh/config; end
function esr; vim ~/.config/starship.toml; end
function uuid; uuidgen | sed 's/-//g' | tr [:upper:] [:lower:]; end


starship init fish | source

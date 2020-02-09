####### Colour Scheme #########
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-eighties.sh
end

######## Environment ########
set -gx fish_greeting ''

set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
set -g fish_user_paths "$HOME/go/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/go/bin" $fish_user_paths

set -gx EDITOR vim
set -gx GOPATH "/home/miles/go"

######### Aliases #########

alias g "git";

######### Functions #########

function rf; source ~/.config/fish/config.fish; end
function ef; vim ~/.config/fish/config.fish; rf; end
function ev; vim ~/.vimrc; end
function eg; vim ~/.gitconfig; end
function essh; vim ~/.ssh/config; end
function uuid; uuidgen | sed 's/-//g' | tr [:upper:] [:lower:]; end

eval (python3 -m virtualfish)

starship init fish | source

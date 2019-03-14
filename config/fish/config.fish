####### Set terminal colour scheme #########
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-eighties.sh
end

######## ENVIRONMENT ########
function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

prepend_to_path "/usr/local/bin"

set -gx fish_greeting ''
set -gx EDITOR vim

######### ALIASES #########

# Brew shortcuts
function brews; brew list; end
function brup; brew update; brew upgrade; end

# Pip shortcuts
function pips; pip list; end

# Dotfiles shortcuts
function rf; source ~/.config/fish/config.fish; end
function ef; vim ~/.config/fish/config.fish; rf; end
function ev; vim ~/.vimrc; end
function eg; vim ~/.gitconfig; end
function essh; vim ~/.ssh/config; end

# Aliases
alias g "git";
alias d "docker";

# Update locate db
function updatedb; sudo /usr/libexec/locate.updatedb; end

# Get public IP
function whatip; curl "http://whatismyip.akamai.com"; echo; end;

eval (python -m virtualfish)

######## PROMPT #########

set normal (set_color normal)
set magenta (set_color brmagenta)
set yellow (set_color bryellow)
set green (set_color brgreen)
set brown (set_color brcyan)
set gray (set_color black)
set red (set_color brred)

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_showcleanstate 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstagedstate 1
set -g __fish_git_prompt_showuntrackedfiles 1

set -g __fish_git_prompt_color_branch normal
set -g __fish_git_prompt_char_stateseparator " : "

set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_char_stagedstate 'o'
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_char_dirtystate '+'
set -g __fish_git_prompt_color_untrackedfiles magenta
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_color_conflictedstate red
set -g __fish_git_prompt_char_conflictedstate '!'
set -g __fish_git_prompt_color_cleanstate green
set -g __fish_git_prompt_char_cleanstate '✓'

function fish_prompt
    # Line 1
    set_color brmagenta
    echo -n -s (whoami)
    set_color $fish_color_normal
    echo -n -s ' ⋅'

    set_color -i brblack
    echo -n -s (__kube_prompt)
    set_color $fish_color_normal
    echo -n -s ' ⋅ '

    set_color brgreen
    echo -n -s (prompt_pwd)
    set_color $fish_color_normal

    echo

    # Line 2
    if set -q VIRTUAL_ENV
        echo -n -s (set_color green) 'env:' (set_color blue) (basename $VIRTUAL_ENV) ' ' (set_color green)
    end

    echo -n -s "➤ "

    set_color normal
end

function fish_right_prompt
    printf '%s ' (__fish_git_prompt)
end

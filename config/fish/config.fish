####### Set terminal colour scheme #########
eval sh $HOME/.dotfiles/base16-shell/base16-flat.dark.sh

######## ENVIRONMENT ########
function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        #if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        #end
    end
end

prepend_to_path "/sbin"
prepend_to_path "/usr/sbin"
prepend_to_path "/bin"
prepend_to_path "/usr/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/bin"

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

# Git shortcuts
function g; git $argv; end
function gi; curl -L -s http://www.gitignore.io/api/$argv; end

# Update locate db
function updatedb; sudo /usr/libexec/locate.updatedb; end

# Get public IP
function whatip; curl "http://whatismyip.akamai.com"; echo; end;

######## PROMPT #########

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set brown (set_color brown)
set gray (set_color -o black)
set red (set_color red)

function fish_prompt
    # Line 1
    printf 'on '
    set_color yellow
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' as '

    set_color magenta
    printf '%s' (whoami)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s ' (prompt_pwd)

    echo

    # Line 2
    if set -q VIRTUAL_ENV
        set_color green
        printf 'env:%s ' (set_color blue)(basename $VIRTUAL_ENV)(set_color green)
    end

    printf '➤ '

    set_color normal
end

set THEME_GIT_PROMPT_UNTRACKED "$magenta?$normal"
set THEME_GIT_PROMPT_ADDED "$green+$normal"
set THEME_GIT_PROMPT_MODIFIED "$yellow⚡$normal"
set THEME_GIT_PROMPT_RENAMED "$yellow↬$normal"
set THEME_GIT_PROMPT_DELETED "$red×$normal"
set THEME_GIT_PROMPT_UNMERGED "$red⇏$normal"

function git_currentbranch
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

# Get the status of the working tree
function fish_right_prompt -d "Write out the right prompt"
  set INDEX (git status --porcelain 2> /dev/null)
  set GITBRANCH (git_currentbranch)
  set STATUS "$GITBRANCH$STATUS"
  if echo $INDEX | grep '^?? '> /dev/null
    set STATUS "$STATUS $THEME_GIT_PROMPT_UNTRACKED"
  end
  if echo $INDEX | grep '^A  '> /dev/null; or echo $INDEX | grep '^M  '> /dev/null
    set STATUS "$STATUS $THEME_GIT_PROMPT_ADDED"
  end
  if echo $INDEX | grep '^ M '> /dev/null; or echo $INDEX | grep '^AM '> /dev/null; or echo $INDEX | grep '^ T '> /dev/null
    set STATUS "$STATUS $THEME_GIT_PROMPT_MODIFIED"
  end
  if echo $INDEX | grep '^R  '> /dev/null
    set STATUS "$STATUS $THEME_GIT_PROMPT_RENAMED"
  end
  if echo $INDEX | grep '^ D '> /dev/null; or echo "$INDEX" | grep '^AD '> /dev/null
    set STATUS "$STATUS $THEME_GIT_PROMPT_DELETED"
  end
  if echo $INDEX | grep '^UU '> /dev/null
    set STATUS "$STATUS $THEME_GIT_PROMPT_UNMERGED"
  end
  printf $STATUS
end

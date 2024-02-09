#   -----------------------------
#     LIST
#   -----------------------------
alias l="ls -lah"     # list pretty shorthand
alias lz="ls -lSr"    # list by size, biggest last
alias lsdo="ls -d */" # list sub-dir's only
alias lt="ls -tlr"    # list by last modified, most recent last

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"
# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias ls="command ls -G"
else
  alias ls="command ls --color"
  export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.json=01;35:'
fi

#   -----------------------------
#     GIT
#   -----------------------------
alias gs="git status"
alias gl="git log -n 30 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gla="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gbwhen="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"

alias gitfind="git log --pretty=\"format:%Cgreen%H %Cblue%s\" --name-status --grep"
alias gc="git commit"
alias gca="git commit --amend -m"         #edit the previous commit message text
alias gcp="git cherry-pick"
alias gcp="git cherry-pick"

alias gcl="git clone"
alias gq="git commit -a -m"

alias ga="git add"
alias gaa="git add --all"
alias gaac="gaa; gc"
alias gaaca="gaa; gca"

alias gb="git branch"
alias gbd="git branch -d"

alias gchb="git checkout -b"
alias gch="git checkout"

alias gp="git push"
alias gpu="git pull"
alias gpo="git push origin"
alias gpom="git push origin main"
alias gpos="git push origin staging"
alias gpod="git push origin develop"
alias gpullom="git pull origin main"
alias gpuom="git pull origin main"
alias gpullod="git pull origin develop"
alias gpuod="git pull origin develop"
alias gpuos="git pull origin staging"
alias gpf="git push -f"

alias gd="git diff"
alias gdc="git diff --cached"
alias gm="git merge"
alias gr="git remote -v"
alias grr="git remote rm"
alias gra="git remote add"

alias grc="git rebase --continue"
alias gf="git fetch"

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

#   -----------------------------
#     MAKE TERMINAL BETTER
#   -----------------------------
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias cpwd='pwd | pbcopy'                   # copy working directory path
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels

alias sif='open -a Finder ./'               # sif:          Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------
alias fhere="find . -name "
fnd () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

findandreplacestring () { git grep -lz $1 | xargs -0 sed -i '' -e "s/$1/$2/g" }   # global find and replace string


#   ---------------------------
#   5.  YARN
#   ---------------------------
alias yt='yarn test'                        # run tests with yarn
alias ytw='yarn test --watch'               # watch tests with yarn

#   ---------------------------
#   6.  MISC
#   ---------------------------
# setup remote SSH shell feature
source ~/.iterm2_shell_integration.zsh

# enable tab-completion for zsh inside spin
zstyle ':completion:*' use-cache on
autoload -Uz compinit && compinit
source <(spin completion)

fish_vi_key_bindings
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'
set -gx GOROOT ~/.go
set -gx GOPATH ~/go
set -gx RUST_SRC_PATH ~/go/src/github.com/rust-lang/rust/src/
set -gx NVM_DIR ~/.nvm
set -gx BROWSER open
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.utf-8
set -gx LC_ALL en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --skip-vcs-ignores --ignore .git --ignore vendor --ignore node_modules -g ""'
set -gx LSCOLORS 'Exfxcxdxbxegedabagacad'
set -gx ZSH "~/.oh-my-zsh"
set -gx DOFILES_PATH "$GOPATH/src/github.com/hugdubois/dotfiles"

# Disable the fish greeting
set fish_greeting ""

#fish_vi_key_bindings

. ~/.profile-secrets.fish
. ~/.config/fish/prompt.fish

# Aliases
alias grep 'grep --color=auto'
alias scp "scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ssh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
#alias tmux "tmux -2"

alias vim "nvim"
alias vimdiff "nvim -d"
alias cls "clear"

set GITHUB_PATH "$GOPATH/src/github.com"

alias cd-go-src "cd $GOPATH/src"
alias cd-go-bin "cd $GOPATH/bin"
#alias cd-github "cd $GOPATH/src/github.com"
alias cd-github "cd $GITHUB_PATH"
alias cd-hugdubois "cd $GOPATH/src/github.com/hugdubois"
alias cd-dotfiles "cd $DOFILES_PATH"
alias cd-gomeet "cd $GOPATH/src/github.com/gomeet"
alias cd-gomeet-gomeet "cd $GOPATH/src/github.com/gomeet/gomeet"
alias cd-mister "cd $GOPATH/src/github.com/MiSTer-devel"

alias l "exa -Gl --git"
alias ls "exa -Gla --git"
alias ll "exa -l --git"
alias la "exa -la --git"
alias e "editor"
alias planning "task calendar ;and task list"

alias tmux-main "tmux_new main $HOME"
alias tmux-game "tmux_new game $HOME"
alias tmux-github "tmux_new github $GITHUB_PATH"

alias open "xdg-open"


function ls-all-file
  ls -R $argv | awk '
  /:$/&&f{s=$0;f=0}
  /:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
  NF&&f{ print s"/"$0 }'
end

function basename-url
  if not set -q $argv
    basename -s .git (echo $argv | sed 's/"//g' | rev | cut -d '/' -f 1 | rev)
  end
end

function github-clone-org
  if not set -q $argv
    set p $GITHUB_PATH"/"$argv
    mkdir -p $p
    cd $p
    for repo in (curl -s "https://api.github.com/orgs/"$argv"/repos?per_page=200" | jq .[].ssh_url)
      #set n (basename-url $repo)
      git clone (echo $repo | sed 's/"//g')
    end
  end
end

function tmux_new
  if set -q $argv
    set argv "main $HOME"
  end
  set n (echo $argv | cut -d" " -f1)
  set p (echo $argv | cut -d" " -f2)
  if not tmux has-session -t $n
    tmux new -d -s $n -c $p
  end
  if not set -q TMUX
    tmux attach -t $n
  else
    tmux switch-client -t $n
  end
end

# dcleanup can be used to clean up docker images.
function dcleanup
  docker rm -v (docker ps --filter status=exited -q ^ /dev/null) ^ /dev/null
  docker rmi (docker images --filter dangling=true -q ^ /dev/null) ^ /dev/null
  docker volume rm (docker volume ls -qf dangling=true)
end

bass source ~/.nvm/nvm.sh

# Environment variables
set -gx PATH \
  ~/bin \
  ~/.go/bin \
  ~/go/bin \
  ~/.fzf/bin \
  ~/.cargo/bin \
  ~/.local/bin \
  /usr/bin \
  /usr/sbin \
  /usr/local/bin \
  /opt/bin \
  $PATH


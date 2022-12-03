FUNCNEST=1000
SAVEHIST=10000000
HISTSIZE=10000000
HISTFILE=~/.bash_history

source ~/Projects/deer/deer.zsh
deerplug hlissner/zsh-autopair
deerplug zsh-users/zsh-autosuggestions
deerplug zsh-users/zsh-syntax-highlighting
deerplug zap-zsh/fzf
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

source <(/usr/bin/starship init zsh --print-full-init)

alias ls='ls --color=auto'

alias vim='nvim'

em() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  ssh -T git@github.com
}

kk() {
  for ((i = 0; i < 100; i++)) {
    killall "$1"
  }
}


touch() {
  if [ $(pwd) = "/home/art" ]
  then
    read -k 1 "yesno?You are in home dir. Relocate to tmp? YES (y) NO (n) ~> "
    if [ $yesno = "y" ]; then
      cd ~/.tmpdir/
      /usr/bin/touch "$1"
    else
      /usr/bin/touch "$1"
    fi
  else
    /usr/bin/touch "$1"
  fi
}
mkdir() {
  if [ $(pwd) = "/home/art" ]
  then
    read -k 1 "yesno?You are in home dir. Relocate to tmp? YES (y) NO (n) ~> "
    if [ $yesno = "y" ]; then
      cd ~/.tmpdir/
      /usr/bin/mkdir "$1"
    else
      /usr/bin/mkdir "$1"
    fi
  else
    /usr/bin/mkdir "$1"
  fi
}

cleandir() {
  rm *.aux
  rm *.log
  rm *.fls
  rm *.dvi
  rm *.out
  rm *.fdb_latexmk
}

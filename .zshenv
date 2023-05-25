skip_global_compinit=1
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/.local/bin/statusbar"
export PATH="$PATH:/usr/local/sbin"

export LANGUAGE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8" 
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export CLICOLOR=1
export PAGER=less
##export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file $XDG_CONFIG_HOME/ripgrep/ignore'
export FZF_DEFAULT_OPTS='--no-color'
export GOPATH="$HOME/.local/lib/go"
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
export EDITOR="/usr/bin/nvim"
export STARSHIP_CONFIG=$HOME/.config/starship.toml
export TERMINAL=/usr/bin/xst
export BROWSER=/usr/bin/brave
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export LESSHISTFILE=-
export SSB_HOME="$XDG_DATA_HOME"/zoom
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
source $XDG_DATA_HOME/cargo/env
export PATH=$PATH:$XDG_DATA_HOME/solana/install/active_release/bin
export CALCHISTFILE=-
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
PATH="$HOME/.local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
. "/home/nnnyykk/.local/share/cargo/env"
export NO_COLOR=1
export NEOVIDE_MULTIGRID=1
export PATH=$PATH:$HOME/.avm/bin
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
source "/home/nnnyykk/.rover/env"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/home/nnnyykk/.ebcli-virtual-env/executables:$PATH"
export PATH="$HOME/.amplify/bin:$PATH"
export FLYCTL_INSTALL="/home/nnnyykk/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export DENO_INSTALL="/home/nnnyykk/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

alias dot='/usr/bin/git --git-dir=$HOME/repo/dot/ --work-tree=$HOME'


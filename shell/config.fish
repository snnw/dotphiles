##### Oh My Fish configuration ####
# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme ocean

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish

#### My own stuff

set PATH $HOME/bin $HOME/.local/bin /opt/node/bin/ $PATH

set fish_function_path $fish_function_path "/usr/share/powerline/fish/"

function bd
  cd (/home/snnw/bin/bd -s $argv 2>/dev/null)
end

function mutt
  bash --login -c 'cd ~/tmp; mutt' $argv;
end


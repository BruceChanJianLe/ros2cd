#/usr/bin/env sh

#                    ___            __
#    _________  ____|__ \ _________/ /
#   / ___/ __ \/ ___/_/ // ___/ __  /
#  / /  / /_/ (__  ) __// /__/ /_/ /
# /_/   \____/____/____/\___/\__,_/


# Install dependencies
sudo apt install zsh fzf git curl

# Sanity check for bin dir and bash aliases
mkdir $HOME/.local/bin -p
touch $HOME/.bash_aliases

# Download appropriate scripts
curl -o $HOME/.local/bin https://raw.githubusercontent.com/BruceChanJianLe/ros2cd/refs/heads/master/get-ros2-pkg-path-local
curl -o $HOME/.local/bin https://raw.githubusercontent.com/BruceChanJianLe/ros2cd/refs/heads/master/list-ros2-pkg-path-local

chmod +x $HOME/.local/bin/get-ros2-pkg-path-local
chmod +x $HOME/.local/bin/list-ros2-pkg-path-local

# Add alias for ros2cd
if ! grep -Fxq "alias ros2cd='source get-ros2-pkg-path-local'" $HOME/.bash_aliases; then
    echo "alias ros2cd='source get-ros2-pkg-path-local'" >> $HOME/.bash_aliases
fi

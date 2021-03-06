#!/bin/sh
# This script symlinks my dotfiles to their required locations
# Requiremens:
# 1. wmutils
# 2. sxhkd
# 3. gohufont
# 4. lemonbar with xft
# 5. compton
# 6. rofi
# 7. Inconsolata for Powerline
# 8. Neovim
# 9. YouCompleteMe - From AUR, edit PKGBuild to point to nvim folder. Also needs Python2 support for Neovim
# 10. Oh-my-zsh
# 11. Firefox - Vimperator
# 12. Zsh syntax highlighting and substring history
# 13. Feh
# 14. Wmutils/opt

# Set dotfiles directory
dotfiledir="$HOME/dotfiles"

# Set ln flags
ln="ln -s -f -v -n -i"

# Create directories

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/colors"
mkdir -p "$HOME/.config/sxhkd"
mkdir "$HOME/bin"
mkdir -p "$HOME/.vimperator/colors/"
#Manually run these commands
# ln -sfvni $HOME/dotfiles/scripts/*/*.sh bin/
# ln -sfvni $HOME/dotfiles/scripts/*.sh bin/

# Link dotfiles
$ln "$dotfiledir/.config/sxhkd/sxhkdrc" "$HOME/.config/sxhkd/"
$ln "$dotfiledir/.dircolors" "$HOME/"
$ln "$dotfiledir/.Xresources" "$HOME/"
$ln "$dotfiledir/.zshrc" "$HOME/"
$ln "$dotfiledir/.xinitrc" "$HOME/"
$ln "$dotfiledir/init.vim" "$HOME/.config/nvim/"
$ln "$dotfiledir/colors/gotham.vim" "$HOME/.config/nvim/colors"

#Link vimperators
$ln "$dotfiledir/.vimperator/colors/twily.vimp" "$HOME/.vimperator/colors"
$ln "$dotfiledir/.vimperatorrc" "$HOME/"

# Uses PCH as sound card instead of HTML. Might not want to symlink depending on hardware.
$ln "$dotfiledir/.asoundrc" "$HOME/"

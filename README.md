# dotfiles
My dotfiles

## Current Dotfiles
 - GNU emacs
 - Doom emacs
 - Qtile
 - Neovim
 - Libinput-Gestures

## Setup using chezmoi
 - https://www.chezmoi.io/

### If I edit dotfiles outside of chezmoi
1. chezmoi merge /path/to/edited/file
2. do a git merge
3. chezmoi cd
4. git add .
5. git commit -m "message"
6. git pull && git push

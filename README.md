# dotfiles
My dotfiles

## Current Dotfiles
 - Text Editors
    - GNU emacs
    - Doom emacs
    - Neovim
 - Window Managers
    - i3
 - Other
    - Libinput-Gestures
    - Favorite Icons of Mine

## Setup using chezmoi
 - https://www.chezmoi.io/

### If I edit dotfiles outside of chezmoi
1. chezmoi merge /path/to/edited/file
2. do a git merge
3. chezmoi cd
4. git add .
5. git commit -m "message"
6. git pull && git push
7. exit &emsp; &emsp; &emsp; &emsp; <-- exits chezmoi

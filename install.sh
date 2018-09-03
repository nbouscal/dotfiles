git submodule init
git submodule update

mkdir -p ~/.vim/tmp
git clone git://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

mkdir ~/.zsh

ln -s ~/dotfiles/.antigen ~/.antigen
ln -s ~/dotfiles/.zsh/nathan.zsh-theme ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes/nathan.zsh-theme

ln -s ~/dotfiles/.psqlrc ~/.psqlrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.githelpers ~/.githelpers

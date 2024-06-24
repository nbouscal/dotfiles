git submodule init
git submodule update

mkdir -p ~/.vim/tmp
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.zsh

ln -s ~/dotfiles/.antigen ~/.antigen
ln -s ~/dotfiles/.zsh/naia.zsh-theme ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes/naia.zsh-theme

ln -s ~/dotfiles/.psqlrc ~/.psqlrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.githelpers ~/.githelpers

# ln -sf ~/dotfiles/zshrc ~/.zshrc
cat ~/dotfiles/zshrc >> ~/.zshrc

curl -L https://iterm2.com/shell_integration/zsh \
-o ~/.iterm2_shell_integration.zsh
# Next, you need to load the script at login time. Add this to the end of ~/.zshrc:
source ~/.iterm2_shell_integration.zsh

# ln -sf ~/dotfiles/zshrc ~/.zshrc
cat ~/dotfiles/zshrc >> ~/.zshrc
# enable command+click on files via remote shell    
export iterm2_hostname=$(spin info fqdn)
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh


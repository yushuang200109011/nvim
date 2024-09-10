# Neovim configured by ysa
Welcome to neovim configured by ysa!

## Install
Make sure the terminal can access github, apt server and pypi server

### Install Nvim
install git gcc cmake and add ssh keys to github
```bash
git clone git@github.com:neovim/neovim.git 
cd neovim && git checkout v0.9.4 && make CMAKE_BUILD_TYPE=Release
sudo make install
sudo apt-get update
sudo apt-get install python3-venv # install venv

# install nodejs and npm
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=18 # for ubuntu1804, use 16
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y
```

### Pull Configs
```bash
# if no .config directory, create one
cd ~/.config
git clone git@github.com:yushuang200109011/nvim.git
```

### Apply Configs
```bash
# start nvim
nvim
:PackerSync
# then quit and start nvim until stable
# if cmake-lsp cannot installed automatically on Ubuntu1804, use "MasonInstall cmake-language-server@0.1.5" to install manually
```

### Install Fonts
```bash
# for windows just use gui to install
# for Ubuntu
sudo mkdir /usr/share/fonts/UbuntuMono
sudo cp UbuntuMono/*.ttf /usr/share/fonts/UbuntuMono
sudo chmod 644 /usr/share/fonts/UbuntuMono/*.ttf
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
# then select fonts in terminal
```

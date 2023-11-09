# Neovim configured by ysa
Welcome to neovim configured by ysa!

## Install
Make sure the terminal can access https://github.com.

### Install Nvim
install git gcc cmake and add ssh keys to github
```bash
git clone git@github.com:neovim/neovim.git 
cd neovim && git checkout v0.9.4 && make CMAKE_BUILD_TYPE=Release
sudo make install
```

### Pull Configs
```bash
# if no .config directory, create one
cd ~/.config
git clone git@github.com:yushuang20010911/nvim.git
```

### Apply Configs
```bash
# start nvim
nvim
:PackerSync
# then quit and start nvim until stable
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

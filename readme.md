# Neovim configured by ysa
Welcome to neovim configured by ysa!

## Install
### Install Nvim
install git gcc cmake and add ssh keys to github
```bash
git clone git@github.com:neovim/neovim.git 
cd neovim && git checkout v0.9.1 && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
```

### pull configs
```bash
# if no .config directory, create one
cd ~/.config
git clone git@github.com:yushuang20010911/nvim.git
```
### apply configs
```bash
# start nvim
nvim
:PackerSync
# then quit and start nvim until stable
```

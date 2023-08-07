DOTFILES_EXCLUDES 	:= .github .gitmodules .git
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))
CONFIG_DIR        := nvim alacritty
deploy:
	mkdir -p ~/.config
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get install zsh tmux neovim stow curl -y
	git submodule update --init --recursive
	$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	$(foreach val, $(CONFIG_DIR), ln -sfnv $(abspath $(val)) $(HOME)/.config/$(val);)
	stow -v zsh tmux
	zsh
deploy-manjaro:
	mkdir -p ~/.config
	sudo pacman-mirrors --geoip
	pacman -Syy --noconfirm
	pacman -Syu --noconfirm
	pacman -S yay cmake gcc patch automake autoconf stow zsh tmux neovim --noconfirm
	yay -S ttf-hackgen
	fc-cache -f
	git submodule update --init --recursive
	$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	$(foreach val, $(CONFIG_DIR), ln -sfnv $(abspath $(val)) $(HOME)/.config/$(val);)

	stow -v zsh tmux
	zsh

init:
	$(foreach val, $(wildcard ./bin/*.sh), bash $(val);)

.SILENT: deploy init deploy-manjaro
.PHONY: deploy init deploy-manjaro


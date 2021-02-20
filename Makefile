DOTFILES_EXCLUDES 	:= .github .gitmodules .git
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))
NVIM_DIR          := nvim
deploy:
	@mkdir -p ~/.config
	@sudo apt update && sudo apt upgrade -y
	@sudo apt-get install zsh tmux neovim stow curl -y
	@git submodule update --init --recursive
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(NVIM_DIR), ln -sfnv $(abspath $(val)) $(HOME)/.config/$(val);)
	@stow -v zsh tmux
	@zsh
init:
	@$(foreach val, $(wildcard ./bin/*.sh), bash $(val);)

TFILES_EXCLUDES 	:= .DS_Store .git .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))
NVIM_DIR          := nvim
deploy:
	@git submodule update --init --recursive
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(NVIM_DIR), ln -sfnv $(abspath $(val)) $(HOME)/.config/$(val);)
	@stow -v zsh tmux
	@chsh -s $(shell which zsh)
	@zsh
init:
	@$(foreach val, $(wildcard ./bin/*.sh), bash $(val);)


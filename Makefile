TFILES_EXCLUDES 	:= .DS_Store .git .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))
ZSH_DIR           := zsh
TMUX_DIR          := tmux
deploy:
	@git submodule update --init --recursive
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@stow -v zsh tmux nvim
	@chsh -s $(shell which zsh)
	@zsh
init:
	@$(foreach val, $(wildcard ./bin/*.sh), bash $(val);)


DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .travis.yml 
DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	@git submodule update --init --recursive
    @$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

	@chsh -s $(which zsh)
	@source ~/dotfiles/.zshrc
	@source ~/dotfiles/.zpreztorc

init:
    @$(foreach val, $(wildcard ./bin/*.sh), bash $(val);)

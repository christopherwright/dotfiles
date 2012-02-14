HOME=$(shell echo $$HOME)

$(HOME)/.gitconfig: gitconfig
	cp $(shell pwd)/gitconfig $@

$(HOME)/.gitignore: gitignore
	cp $(shell pwd)/gitignore $@

$(HOME)/.bashrc: bashrc
	cp $(shell pwd)/bashrc $@

$(HOME)/.bash_profile: bash_profile
	cp $(shell pwd)/bash_profile $@

$(HOME)/.gemrc: gemrc
	cp $(shell pwd)/gemrc $@

$(HOME)/.virtualenvs:
	mkdir -p $@

$(HOME)/.vim: vim
	cp -R $(shell pwd)/vim $@

$(HOME)/.vim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	cp -R $(shell pwd)/vim-pathogen/autoload/pathogen.vim $@

$(HOME)/.vimrc: vimrc
	cp $(shell pwd)/vimrc $@

install: $(HOME)/.gitconfig \
	$(HOME)/.gitignore \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.gemrc \
	$(HOME)/.virtualenvs \
	$(HOME)/.vim \
	$(HOME)/.vim/autoload/pathogen.vim \
	$(HOME)/.vimrc

clean:
	rm -fr $(HOME)/.gitconfig \
	$(HOME)/.gitignore \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.gemrc \
	$(HOME)/.vim \
	$(HOME)/.vimrc

purge: clean
	rm -fr $(HOME)/.virtualenvs

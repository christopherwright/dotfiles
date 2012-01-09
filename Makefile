HOME=$(shell echo $$HOME)

$(HOME)/.gitconfig: gitconfig
	cp $(shell pwd)/gitconfig $@

$(HOME)/.bashrc: bashrc
	cp $(shell pwd)/bashrc $@

$(HOME)/.bash_profile: bash_profile
	cp $(shell pwd)/bash_profile $@

$(HOME)/.vim: vim
	cp -R $(shell pwd)/vim $@

$(HOME)/.vim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	cp -R $(shell pwd)/vim-pathogen/autoload/pathogen.vim $@

$(HOME)/.vimrc: vimrc
	cp $(shell pwd)/vimrc $@

install: $(HOME)/.gitconfig \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.vim \
	$(HOME)/.vim/autoload/pathogen.vim \
	$(HOME)/.vimrc

clean:
	rm -fr $(HOME)/.gitconfig \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.vim \
	$(HOME)/.vimrc

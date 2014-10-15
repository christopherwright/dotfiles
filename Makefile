HOME=$(shell echo $$HOME)

$(HOME)/.git-completion.bash: git-completion.bash
	cp $(shell pwd)/git-completion.bash $@

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

$(HOME)/.rspec: rspec
	cp $(shell pwd)/rspec $@

$(HOME)/.tmux.conf: tmux.conf
	cp $(shell pwd)/tmux.conf $@

$(HOME)/.virtualenvs:
	mkdir -p $@

$(HOME)/.vim: vim
	cp -R $(shell pwd)/vim $@

$(HOME)/.vim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	cp -R $(shell pwd)/vim-pathogen/autoload/pathogen.vim $@

$(HOME)/.vimrc: vimrc
	cp $(shell pwd)/vimrc $@

install: $(HOME)/.git-completion.bash \
	$(HOME)/.gitconfig \
	$(HOME)/.gitignore \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.gemrc \
	$(HOME)/.rspec \
	$(HOME)/.tmux.conf \
	$(HOME)/.virtualenvs \
	$(HOME)/.vim \
	$(HOME)/.vim/autoload/pathogen.vim \
	$(HOME)/.vimrc \
	command-t

command-t:
	cd ~/.vim/bundle/Command-T/ruby/command-t && rbenv local 1.8.7-p358 && ruby ./extconf.rb && make

clean:
	rm -fr $(HOME)/.git-completion.bash \
	$(HOME)/.gitconfig \
	$(HOME)/.gitignore \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.gemrc \
	$(HOME)/.rspec \
	$(HOME)/.tmux.conf \
	$(HOME)/.vim \
	$(HOME)/.vimrc

purge: clean
	rm -fr $(HOME)/.virtualenvs

.phony: install vim

install:
	./install

vim:
	docker run -it --rm -v "$(shell pwd)/editor/vimrc:/usr/local/share/vim/vimrc" thinca/vim /etc/hosts

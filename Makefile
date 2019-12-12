.PHONY: install vim docker run run_root list

FILE:=shell/bash/bashrc

install:
	./install

vim:
	docker run -it --rm -v "$(shell pwd)/editor/vim/vimrc:/usr/local/share/vim/vimrc" thinca/vim /etc/hosts

docker:
	docker build -t dotfiles .

run:
	docker run -it --rm --name dotfiles -v "${PWD}":/home/SuJiKiNen/dotfiles dotfiles bash

run_root:
	docker run -it --rm --name dotfiles -v "${PWD}":/root/dotfiles dotfiles bash

check:
	docker run --rm -v "${PWD}:/mnt" koalaman/shellcheck:stable /mnt/"${FILE}"

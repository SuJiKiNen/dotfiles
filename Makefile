.PHONY: install vim docker run run_root list

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

# https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

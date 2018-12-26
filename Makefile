.phony: install uninstall

install:
	./install

uninstall:
	which python | python uninstall.py

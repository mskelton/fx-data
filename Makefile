dir = ~/Library/Application\ Support/MetaTrader\ 5/Bottles/metatrader5/drive_c/Program\ Files/MetaTrader\ 5/MQL5

unlink:
	rm -f $(dir)/Experts/Download.mq5

link: unlink
	ln -s $(shell pwd)/Download.mq5 $(dir)/Experts/Download.mq5


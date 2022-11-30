dir = ~/Library/Application\ Support/MetaTrader\ 5/Bottles/metatrader5/drive_c/Program\ Files/MetaTrader\ 5

unlink:
	rm -f $(dir)/MQL5/Experts/Download.mq5

link: unlink
	ln -s $(shell pwd)/Download.mq5 $(dir)/MQL5/Experts/Download.mq5

copy:
	 mv $(dir)/Tester/Agent-127.0.0.1-3000/MQL5/Files/*.csv $(shell pwd)/data
	 dos2unix $(shell pwd)/data/*.csv


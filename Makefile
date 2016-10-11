SHELL := /bin/bash
MD = $(shell ls *.md)
DECKTAPEHOME = ~/git/decktape
HTML = main.html
HTMLPDF = $(HTML:.html=.pdf)
DECKTAPEARGS = --size 960x720 --load-pause 500 
JPGARGS = --screenshots --screenshots-format jpg --screenshots-directory screenpages
# -p 1000 --slides 1-5

.PHONY: all clean notify view install autobuild log

all: view

$(HTML): $(MD)

start:
	pgrep -f http.server ; if [[ $$? -ne 0 ]] ; then \
		python3 -m http.server & \
	fi

stop:
	pkill -9 -f http.server

clean:
	rm -rf $(HTMLPDF)

view: $(HTML) start
	open http://localhost:8000/$(HTML)

pdf: $(HTML) start
	 time $(DECKTAPEHOME)/phantomjs $(DECKTAPEHOME)/decktape.js $(DECKTAPEARGS) remark http://localhost:8000/$< $(HTMLPDF)
	 @echo open $(HTMLPDF)

jpg: $(HTML) start
	 time $(DECKTAPEHOME)/bin/phantomjs $(DECKTAPEHOME)/decktape.js $(DECKTAPEARGS) $(JPGARGS) remark http://localhost:8000/$< $(HTMLPDF)
	 ls -al screenpages


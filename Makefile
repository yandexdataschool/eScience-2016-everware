SHELL := /bin/bash
INSTALL_NAME = $(subst .src,,$(shell basename `pwd`))
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

install: $(HTMLPDF)
	cp -f $? ../${INSTALL_NAME}.pdf

update_common:
	test -d ../../_common
	cp Makefile ../../_common

from_common: ../../_common/Makefile clean
	@diff -u $< Makefile ; \
		if [[ $$? -ne 0 ]] ; then \
			[ -n "$(FORCE)" ] || \
				( echo "Press ENTER to to overwrite local (+) or ^C otherwise?" && read ) ; \
			cp ../../_common/Makefile . ; \
		else \
			echo "Makefile is the same as $<" ; \
		fi

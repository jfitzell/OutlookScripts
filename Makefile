SCRIPT_FOLDER=~/Library/Application\ Support/Microsoft/Office/Outlook\ Script\ Menu\ Items/
OSACOMPILE=osacompile -x -r scpt:128 -t osas -c ToyS

SOURCES=$(wildcard *.applescript)
SCRIPTS=$(SOURCES:.applescript=.scpt)

all: build install

install:
	mv *.scpt $(SCRIPT_FOLDER)

uninstall:
	cd $(SCRIPT_FOLDER) && \
	rm $(SCRIPTS)

build: $(SCRIPTS)

clean:
	rm *.scpt

%.scpt : %.applescript
	$(OSACOMPILE) -o $@ $<

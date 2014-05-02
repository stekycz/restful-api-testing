CC=multimarkdown
CFLAGS=-t latex
SOURCES=$(wildcard chapters/*.md)
OBJECTS=$(SOURCES:.md=.tex)

FILENAME=DP_Stekl_Martin_2014
INPUT=$(FILENAME).tex
OUTPUT=$(FILENAME).pdf

all: $(SOURCES) $(OUTPUT) clean

$(OUTPUT): $(OBJECTS)
	pdflatex -shell-escape $(INPUT)
	pdflatex -shell-escape $(INPUT)
	pdflatex -shell-escape $(INPUT)

%.tex: %.md
	$(CC) $(CFLAGS) $< | ./syntax-highlight > $@

clean:
	mv $(INPUT) $(FILENAME)_tmp.tex
	mv $(FILENAME).log $(FILENAME)_tmp.log
	mv $(FILENAME).pdf $(FILENAME)_tmp.pdf
	rm -rf $(FILENAME).* chapters/*.tex
	mv $(FILENAME)_tmp.tex $(INPUT)
	mv $(FILENAME)_tmp.log $(FILENAME).log
	mv $(FILENAME)_tmp.pdf $(FILENAME).pdf

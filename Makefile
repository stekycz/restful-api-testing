CC=multimarkdown
CFLAGS=-t latex
SOURCES=$(wildcard chapters/*.md abstra*.md)
OBJECTS=$(SOURCES:.md=.tex)

FILENAME=DP_Stekl_Martin_2014
INPUT=$(FILENAME).tex
OUTPUT=$(FILENAME).pdf

all: $(SOURCES) $(OUTPUT) clean

$(OUTPUT): $(OBJECTS)
	pdflatex -shell-escape $(INPUT)
	bibtex $(FILENAME)
	pdflatex -shell-escape $(INPUT)
	pdflatex -shell-escape $(INPUT)

%.tex: %.md
	$(CC) $(CFLAGS) $< | ./bin/syntax-highlight | ./bin/fix-fixed-space | ./bin/references-to-tex | ./bin/fix-czech-chars > $@

clean:
	mv $(INPUT) $(FILENAME)_tmp.tex
	mv $(FILENAME).pdf $(FILENAME)_tmp.pdf
	rm -rf $(FILENAME).* chapters/*.tex abstract-*.tex
	mv $(FILENAME)_tmp.tex $(INPUT)
	mv $(FILENAME)_tmp.pdf $(FILENAME).pdf

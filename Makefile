CC=multimarkdown
CFLAGS=-t latex
SOURCES=$(wildcard chapters/*.md)
OBJECTS=$(SOURCES:.md=.tex)

FILENAME=DP_Stekl_Martin_2014
INPUT=$(FILENAME).tex
OUTPUT=$(FILENAME).pdf

all: $(SOURCES) $(OUTPUT) clean

$(OUTPUT): $(OBJECTS)
	for i in 1 2 3; do pdflatex -shell-escape $(INPUT); done

%.tex: %.md
	$(CC) $(CFLAGS) $< | ./bin/syntax-highlight > $@

clean:
	mv $(INPUT) $(FILENAME)_tmp.tex
	mv $(FILENAME).pdf $(FILENAME)_tmp.pdf
	rm -rf $(FILENAME).* chapters/*.tex
	mv $(FILENAME)_tmp.tex $(INPUT)
	mv $(FILENAME)_tmp.pdf $(FILENAME).pdf

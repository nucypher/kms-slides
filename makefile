SVG = $(wildcard svg/*.svg)
PDF = $(SVG:svg/%.svg=pdf/%.pdf)

all: $(PDF) slides.pdf

slides.pdf:	slides.tex
		xelatex slides.tex && rm -f *.aux *.log *.nav *.toc *.out *.snm

$(PDF):	pdf/%.pdf: svg/%.svg
		inkscape "$<" --export-pdf="$@"
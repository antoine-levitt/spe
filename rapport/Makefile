EPSS=$(wildcard *.eps)

rapport: imagespdf rapport.tex
	pdflatex rapport.tex

imagespdf: $(EPSS:eps=pdf)

%.pdf: %.eps
	epstopdf $<

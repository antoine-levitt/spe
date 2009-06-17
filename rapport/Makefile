EPSS=$(wildcard *.eps new_plots/*.eps)
rapport: imagespdf rapport.tex
	pdflatex rapport.tex
imagespdf: $(EPSS:eps=pdf)

%.pdf: %.eps
	epstopdf $<

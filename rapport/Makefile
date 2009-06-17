EPSS=$(wildcard *.eps new_plots/*.eps)
presentation: imagespdf presentation.tex
	pdflatex presentation.tex
rapport: imagespdf rapport.tex
	pdflatex rapport.tex
imagespdf: $(EPSS:eps=pdf)


%.pdf: %.eps
	epstopdf $<

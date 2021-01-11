admin/4mbinfo.pdf:
	pdflatex ../admin/4mbinfo.tex
	mv 4mbinfo.pdf admin

README.md: README.Rmd ../admin/schedule.csv
	Rscript -e "rmarkdown::render(\"README.Rmd\")"

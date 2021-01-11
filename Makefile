# Lectures

imagelinks = ~/Dropbox/1M

Sources += Makefile .gitignore README.md LICENSE.md

##################################################################

BIBFILE = math4mb.bib
GPPHEAD = gpp/macros.gpp

## %.rmd: %.rmd0 slides.gpp
## 	gpp --include $(GPPHEAD) -H -DSLIDES=1 $*.rmd0 | sed '1,/-- end hdr --/d' > $*.rmd

## rendering equations: https://stackoverflow.com/questions/55374216/pandoc-markdown-powerpoint-support-for-equations


%.pdf: %.md
	pandoc -s --csl reflist2.csl -A bibend.tex -t latex --template gpp/my.tufte --bibliography $(BIBFILE) $(notdir $*.md) -o $(notdir $*.pdf)

%.md: %.rmd0 gpp/tufte.gpp gpp/my.tufte
	gpp --include $(GPPHEAD) -H -DTUFTE=1 $< | sed '1,/-- end hdr --/d' > $(notdir $*.rmd)
	Rscript -e "knitr::knit(\"$(notdir $*.rmd)\")"

%.toc.html:  %.md gpp/slides.gpp
	. ./mktoc.sh $(notdir $*.md) $*.toc.html

%.slides.pdf: %.rmd0 gpp/beamer.gpp $(BIBFILE) my.beamer
	gpp --include $(GPPHEAD) -H -DBEAMER=1 $*.rmd0 | sed '1,/-- end hdr --/d' > $*.rmd
	Rscript -e "library(\"knitr\"); knit(\"$*.rmd\")"  
	pandoc -s --csl reflist2.csl -A bibend.tex -t beamer --slide-level=2 --template my.beamer --bibliography $(BIBFILE) $*.md -o $*.slides.pdf 

%.slides.tex: %.rmd0 gpp/beamer.gpp $(BIBFILE)
	gpp --include $(GPPHEAD) -H -DBEAMER=1 $*.rmd0 | sed '1,/-- end hdr --/d' > $*.rmd
	Rscript -e "library(\"knitr\"); knit(\"$*.rmd\")"  
	pandoc -s --csl reflist2.csl -A bibend.tex -t beamer --slide-level=2 --template my.beamer --bibliography $(BIBFILE) $*.md -o $*.slides.tex


%.final.handout.pdf: %.rmd0 gpp/tufte.gpp my.tufte
	gpp --include $(GPPHEAD) -H -DTUFTE=1 -DFINAL=1 $*.rmd0 | sed '1,/-- end hdr --/d' > $*.rmd
	Rscript -e "library(\"knitr\"); knit(\"$*.rmd\")"  
	pandoc -s --csl reflist2.csl -A bibend.tex -t latex --template my.tufte --bibliography $(BIBFILE) $*.md -o $*.final.handout.pdf 

%.md: %.rmd
	Rscript -e "library(knitr); knit(\"$*.rmd\")"

%.html: %.rmd0 $(BIBFILE)
	gpp --include $(GPPHEAD) -H -DDOCX=1 -DFINAL=1 $*.rmd0 | sed '1,/-- end hdr --/d' > $*.rmd
	Rscript -e "rmarkdown::render(\"$*.rmd\")"
	rm $*.rmd

## pandoc -s --csl reflist2.csl -A bibend.tex --bibliography $(BIBFILE) $*.md -o $*.html
## pandoc -f markdown+fancy_lists --self-contained --mathml --bibliography $(BIBFILE) --slide-level=2  $*.md -o $*.html
## %.html: %.rmd0 $(BIBFILE)
## 	pandoc -f markdown+fancy_lists --self-contained --mathml --bibliography $(BIBFILE) --slide-level=2  $*.md -o $*.html

##  --css=slidycustom.css

## don't clean bibend.tex, we need it
clean:
	rm -Rf *.nav *.aux *.toc *.snm *.bbl *.blg *.out *.vrb *.log .~lock*

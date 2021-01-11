#! /bin/bash
echo $1
echo $2
Rscript -e "source('mktoc.R'); writeLines(render_toc(\"$1\"),con=\"toc_tmp.rmd\")"
cat tochead.rmd toc_tmp.rmd >toc_tmp2.rmd
Rscript -e "rmarkdown::render(\"toc_tmp2.rmd\")"
mv toc_tmp2.html $2
rm toc_tmp*rmd



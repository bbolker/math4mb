library(tidyverse)
library(directlabels)
theme_set(theme_bw())
dd <- (read_csv("../data/COVID-19_Tests__Cases__Hospitalizations__and_Deaths__Statewide_.csv")
    %>% select(-State)
    %>% pivot_longer(-Date,names_to="var")
    %>% mutate(across(Date, lubridate::mdy))
    %>% mutate(type = case_when(grepl("_age",var) ~ "age_struc",
                             grepl("cases",var) ~ "cases",
                             grepl("death",var) ~ "deaths",
                             TRUE ~ "other"))
)

## https://stackoverflow.com/questions/13242436/label-size-in-directlabels-geom-dl
gg1 <- (ggplot(dd,aes(Date,value,colour=var)) + facet_wrap(~type,scale="free")
    + geom_line()
    + geom_dl(aes(label=var),method=list(cex=0.8,dl.trans(x = x + .2),"last.bumpup"))
    + theme(legend.position="none")
    + expand_limits(x=as.Date("2021/12/01"))
)
print(gg1)
    
## the values of Q (t), CR(t) and D (t) generated from system (1)
## are close enough to the respective real data of active cases (DATA_Q), total recovered (DATA_CR),
## and total death (DATA_D).


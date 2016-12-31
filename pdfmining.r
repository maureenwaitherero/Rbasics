install.packages("tm",dependencies=TRUE)
or 
install.packages('tm', repos='http://cran.mirror.ac.za/') # install package from geographically closest mirror

#LOAD LIBRARIES

library(tm) # Framework for text mining.
library(NLP)


# PATH TO PDF FOLDER
cname <- file.path(".", "Documents", "R-Analytics", "pdf")
cname

# check number of files i folder
length(dir(name))
file <- dir(name)
pdfdoc <- Corpus(DirSource(name))

summary(pdfdoc)

inspect(pdfdoc[1])
writeLines(as.character(pdfdoc))


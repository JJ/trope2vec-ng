library(fpc)

data <- read.table("csv/trope-vectors-15-9.csv",  stringsAsFactors=FALSE, skipNul = TRUE)
pk <- pamk(data)

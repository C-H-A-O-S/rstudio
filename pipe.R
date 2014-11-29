library(magrittr)
library(ggplot2)

#pdf("gg.pdf")

qplot(geom_histogram(rnorm(1000)) + geom_density(rnorm(1999)))

#dev.off()

#source("http://bioconductor.org/biocLite.R")

#biocLite('Biobase')
#biocLite('GEOquery')
#biocLite('simpleaffy')


#require(Biobase)
require(GEOquery)
require(simpleaffy)

gset <- getGEO("GSE21059", GSEMatrix=TRUE, AnnotGPL=FALSE)
if (length(gset) > 1) idx <- grep("GPL6480", attr(gset, "names")) else idx <- 1
gset <- gset[[idx]]

#str(gset)
#grepl("rep4", pData(gset)[,1]) & grepl("control", pData(gset)[,11])
#for(i in c("0.5", "1.0", "2.0", " 4.0", "6.0", "24.0")) print(grepl(i, pData(gset)[,12]))

#fData(gset)[799,7]

egset <- exprs(gset)
rownames(egset) <- fData(gset)[,7]
idx <- rownames(egset) != ""
sum(idx)
egset<- egset[idx,]
n <- dim(egset)[2]
idx <- rowSums(egset != "NA", na.rm=TRUE) == n
egset <- egset[idx,]
sum(idx)
library(ggplot2)

dat <- read.csv("data/assembly_stats.tsv",sep="\t",header=TRUE,stringsAsFactors=TRUE,row.names=1)
dat$genus <- sapply(rownames(dat),function(x) strsplit(x,"_")[[1]][[1]], USE.NAMES=FALSE)
p <- ggplot(dat, aes(x=N50,y=TOTAL.LENGTH,label=genus,color=genus,shape)) + geom_point() +
  theme_minimal() + ggtitle("Intron size vs occurance in genes (mean)") + theme(legend.position="none")
print(p)

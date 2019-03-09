library(ggplot2)

dat <- read.csv("data/assembly_stats.tsv",sep="\t",header=TRUE,stringsAsFactors=TRUE,row.names=1)

pdf("plots/assembly_sum.pdf")
droplevels(dat$Average.coverage)
dat$genus <- sapply(rownames(dat),function(x) strsplit(x,"_")[[1]][[1]], USE.NAMES=FALSE)

ggplot(dat,aes(x=Average.coverage,y=N50)) + geom_point() + 
  facet_wrap( ~ genus, nrow = 5) + theme_minimal() + 
  ggtitle("Max Contig vs Fold coverage") + theme(legend.position="bottom")

ggplot(dat,aes(x=Average.coverage,y=MAX)) + geom_point() + 
  facet_wrap( ~ genus, nrow = 5) + theme_minimal() + 
  ggtitle("Max Contig vs Fold coverage") + theme(legend.position="bottom")

ggplot(dat,aes(x=Average.coverage,y=TOTAL.LENGTH)) + geom_point() + 
  facet_wrap( ~ genus, nrow = 5) + theme_minimal() + 
  ggtitle("Average.coverage vs TOTAL.LENGTH") + theme(legend.position="bottom")

ggplot(dat,aes(x=CONTIG.COUNT,y=TOTAL.LENGTH)) + geom_point() + 
  facet_wrap( ~ genus, nrow = 5) + theme_minimal() + 
  ggtitle("CONTIG.COUNT vs TOTAL.LENGTH") + theme(legend.position="bottom")

ggplot(dat,aes(x=CONTIG.COUNT,y=TOTAL.LENGTH)) + geom_point() + theme_minimal() + 
  ggtitle("CONTIG.COUNT vs TOTAL.LENGTH") + theme(legend.position="bottom")

ggplot(dat,aes(x=Average.coverage,y=CONTIG.COUNT)) + geom_point() + 
  facet_wrap( ~ genus, nrow = 5) + theme_minimal() + 
  ggtitle("Contig count vs Fold coverage") + theme(legend.position="bottom")

ggplot(dat,aes(x=Average.coverage,y=BUSCO_Complete)) + geom_point() + 
  facet_wrap( ~ genus, nrow = 5) + theme_minimal() + 
  ggtitle("Max Contig vs Fold coverage") + theme(legend.position="bottom")

ggplot(dat,aes(x=Reads,y=BUSCO_Complete)) + geom_point() + 
  facet_wrap( ~ genus, nrow = 5) + theme_minimal() + 
  ggtitle("BUSCO_Complete vs Fold coverage") + theme(legend.position="bottom")

ggplot(dat,aes(x=Average.coverage,y=BUSCO_Complete,color=genus)) + geom_point() + theme_minimal() + 
  ggtitle("BUSCO_Complete vs Fold coverage") + theme(legend.position="none")

ggplot(dat,aes(x=Reads,y=BUSCO_Complete,color=genus)) + geom_point() +  theme_minimal() + 
  ggtitle("BUSCO_Complete vs Read count") + theme(legend.position="bottom")

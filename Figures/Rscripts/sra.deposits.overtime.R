## Create the sra submissions overtime
# For Thesis
# Christian Roy 
# 2014-05-08 

# Read in the data table.
# Obtained from http://www.ncbi.nlm.nih.gov/Traces/sra/

library(sigalphTools)
sra <- read.csv("Figures/SupportingData/sra_stat.csv",sep=",",header=T)
head(sra)
sra$date <- as.POSIXct(as.character(sra$date), format = "%m/%d/%Y")
sra$hgEquivalents <- sra$open_access_bases / 3234830000
head(sra)
tail(sra)
str(sra)
pdf(file="Figures/Intro/SRA_HG_equivalents.pdf",width=7,height=3,paper="letter")
p <- 
  ggplot(sra,aes(x=date, y= hgEquivalents)) +
  xlab("Date") +
  ylab("Human genome equivalents") +
  geom_line(stat="identity") +    
  scale_y_log10(breaks=c(     
                              1,
                              10,
                              100,
                              1000,
                              10000,
                              100000,
                              1000000),
                labels=c("1,","10","100","1K","10K","100K","1 Million"),
                limits=c(1,1000000)) +  
  theme_bw (base_size = 16) 
  #p + geom_line(aes(x=Date,y=mooreCost))
  p
graphics.off()

tail(sra)

1572864 / 4
# 393,216 = same in inches = 6.20606 miles!

376 * 393216

Could fill 2 olympic sized swimming pools

9987.69 is height in meters
Freedown tower = 541

9987.69 / 541

3234830000/

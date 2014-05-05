## Create the sequencing costs over time figure
# For Thesis
# Christian Roy 
# 2013-09-03

# Read in the data table.
# Obtained from http://www.genome.gov/sequencingcosts/

# They ask to be cited as
# Wetterstrand KA. DNA Sequencing Costs: Data from the NHGRI Genome Sequencing Program (GSP) Available at: www.genome.gov/sequencingcosts. Accessed [date of access].

library(sigalphTools)
costs <- read.csv("Figures/SupportingData/sequencing_cost_20140131_withMoore.csv",sep=",",header=T)
costs$Date <- as.POSIXct(as.character(costs$Date), format = "%Y-%m-%d")
head(costs)
tail(costs)
str(costs)
pdf(file="Figures/Intro/Sequencing.costs.over.time.pdf",width=7,height=3,paper="letter")
p <- 
  ggplot(costs,aes(x=Date, y= perGenome)) +
 # ggtitle("Cost per sequenced genome over time") +
  xlab("Date") +
  ylab("Cost in US Dollars") +
  geom_line(stat="identity") +    
  scale_y_log10(breaks=c(     
                              #1,
                             # 100,
                              1000,
                              10000,
                            #  100000,
                              1000000,
                            #  10000000,
                              100000000),
                labels=c("1K","10K","1 Million","100 Million"),
                limits=c(1000,100000000)) +  
  theme_bw (base_size = 16) 
  p + geom_line(aes(x=Date,y=mooreCost))
graphics.off()



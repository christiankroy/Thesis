## Make a barchart of Drosmel Transcripts per gene.

library(sigalphTools)

df <- fread("Figures/SupportingData/Brown2014_Supplementary table 3.csv")

df <-  arrange(df,transcripts)
  
df.txNumbers  <- 
  group_by(df,transcripts) %.% 
    summarize(TotalNumber = n()) %.% #head()
    mutate(bins=cut(transcripts,breaks=c(1:10,100,1000,10000),include.lowest=TRUE)) 
  
aggregate(TotalNumber ~ bins, df.txNumbers,sum)

ggplot(aggregate(TotalNumber ~ bins, df.txNumbers,sum),
          aes(x=bins,y=TotalNumber)) +
          geom_bar(stat="identity") +
          geom_text(aes(label=TotalNumber,vjust=1.5,color="white",size=6)) +
          #scale_x_discrete(labels=comma) +
          scale_x_discrete(labels=c(1,2,3,4,5,6,7,8,9,"<100","<1,000","<10,000")) +
          scale_y_log10(labels=comma) +
          labs(x="Bin of transcript number per gene (closed on top of range)",
               y="Number of transcripts per bin") +
          theme_bw() +
          theme(legend.position="none",
                axis.text.x=element_text(angle=0,size=8))
                
  

ggsave(filename="Figures/NumberOFTranscriptsPerFlyGene.pdf",
       width=5.7,height=4,scale=1)

df %.%
  filter(transcripts>1000) %.%
  as.data.frame() %.%
  kable(format="latex")





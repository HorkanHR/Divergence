#####BLASTS

# extract lowest and highest divergence 

colnames(resaver) <- c("value", "sequence")
resaverdf <- as.data.frame(resaver)

#lowest
lowest.div <- resaverdf[order(resaverdf$value),] %>% 
  unique() %>% 
  head(10)

#highest
highest.div <- resaverdf[order(-resaverdf$value),] %>% 
  unique() %>% 
  head(10)

#which sequence theyre from 

colnames(res) <- c("locus", "sequence")
resdf <- as.data.frame(res)

#subset by the values aquired previously for highest and for lowest 

subset(resdf, sequence=='9' | sequence=='3')

#run blasts for those files 
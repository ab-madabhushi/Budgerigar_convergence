library(tidyverse)
library(ggpubr)
library(rstatix)
library(data.table)

warble_dat=read.csv("Budgie project before modified.csv", header=TRUE)
warble_dat=as.data.frame(warble_dat)

warble_dat<- warble_dat%>%
  reorder_levels(Cage, order=c(1,2))

warble_dat%>%  
  group_by(Cage) %>%
  get_summary_stats(Shannon.Entropy, type = "common")

warble_dat%>%  
  group_by(Context) %>%
  get_summary_stats(Shannon.Entropy, type = "common")

# Wilcox Rank Sum test for 2 sample comparison

res.wilocxd <- warble_dat %>% wilcox_test(Duration..s. ~ Cage)
warble_dat %>% wilcox_effsize(Duration..s.~ Cage)


res.wilcoxH <- warble_dat %>% wilcox_test(Shannon.Entropy ~ Cage)
warble_dat %>% wilcox_effsize(Shannon.Entropy~ Cage)

######### Colony 2 Comparison
warble_col2=read.csv("Budgie project after colony2.csv", header=TRUE)
warble_col2=as.data.frame(warble_col2)

warble_col2<- warble_col2%>%
  reorder_levels(Context, order=c(1,2))

warble_col2%>%  
  group_by(Context) %>%
  get_summary_stats(Shannon.Entropy, type = "common")


res.wilcoxd2 <- warble_col2 %>% wilcox_test(Duration..s. ~ Context)
warble_col2 %>% wilcox_effsize(Duration..s.~ Context)

res.wilcoxH2 <- warble_col2 %>% wilcox_test(Shannon.Entropy ~ Context)
warble_col2 %>% wilcox_effsize(Shannon.Entropy~ Context)

note_freq=as.data.frame(read.csv("D:\\Abhinav\\budgerigar project\\notefrequencies.csv",header=TRUE))
note_prop=as.data.frame(read.csv("D:\\Abhinav\\budgerigar project\\noteproportions.csv",header=TRUE))

note_prop1=as.data.frame(read.csv("D:\\Abhinav\\budgerigar project\\note proportions col1.csv",header=TRUE))
note_prop2=as.data.frame(read.csv("D:\\Abhinav\\budgerigar project\\note proportions col2.csv",header=TRUE))


warble_ind=read.csv("D:\\Abhinav\\budgerigar project\\Budgerigar Project- ind data.csv", header=TRUE)
warble_ind=as.data.frame(warble_ind)

warble_ind<- warble_ind%>%
  reorder_levels(ind, order=c(11,12,21,22,23))

warble_ind%>%  
  group_by(ind) %>%
  get_summary_stats(Shannon.Entropy, type = "common")

ind.kruskalH <- warble_ind %>% kruskal_test(Shannon.Entropy ~ ind)
warble_ind %>% kruskal_effsize(Shannon.Entropy~ ind)

res.ind<- dunn_test(data=warble_ind,formula=Shannon.Entropy ~ ind, p.adjust.method = "bonferroni")


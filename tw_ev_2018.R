rm(list=ls())
setwd("C:/Users/Kuo/Desktop")
data = read.csv("ev2018.csv",sep=",", header=T)  # read csv file
data
str(data)
library(ggplot2) 
library(dplyr)
library(plotly)
library(tidyverse)
library(RColorBrewer)

cbPalette <- c( "#999999", "#E69F00","#56B4E9","#009E73","#F0E442", "#CC79A7", "#0072B2", "#D55E00")
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7", "#0072B2", "#D55E00")
cbbbPalette <- c("#66CC99","#9999CC","#CC6666",  "#F0E442", "#999999", "#E69F00","#009E73","#56B4E9" )

                  
    ggplot(data = data, aes(x = factor(month, level = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")), 
                        y = n, fill = Genotype))+
  geom_bar(stat = "identity")+
  scale_fill_manual(values=cbbbPalette)+
 labs(x = "Taiwan 2019", y="No. of isolates")+
  theme(axis.text=element_text(size=13),
        axis.title=element_text(size=14,face="bold"))



ggplot(data=data, aes(x=month, y=Samples received)) +
  geom_line() +
  geom_point()



  
  scale_fill_brewer(palette="Spectral")
  
scale_fill_hue(c=45, l=80)
  

str(data)
library(ggplot2) 
library(dplyr)
library(plotly)
library(tidyverse)


cbPalette <- c("#E69F00", "#999999", "#D55E00", "#0072B2", "#F0E442", "#CC79A7", "#56B4E9", "#009E73")
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7", "#0072B2", "#D55E00")

-------------------------------------------------------------------------
  #Stacked bar chart with a line
  ggplot() + 
  geom_bar(data = data, aes(x=month, y=n, fill=Genotype), stat = "identity")+
  geom_line(data = data, aes(x=month2, y=data$Samples, group = 1, linetype = "Samples tested")) +
  scale_x_discrete(limits=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))+
  scale_fill_manual(values=cbPalette)+
  labs(x = "UNIT 2018", y="No. of patients")+
  theme(axis.text=element_text(size=11),
        axis.title=element_text(size=13,face="bold"), legend.title=element_blank())


------------------------------------------------------------------------=
  #2 y-axis + horizontal y-axis title  + red text
  ggplot() + 
  geom_bar(data = data, aes(x=month, y=n, fill=Genotype), stat = "identity")+
  geom_line(data = data, aes(x=month2, y=0.5*Samples, group = 1, linetype = "Total samples tested")) +
  scale_y_continuous("No. of patients", sec.axis = sec_axis(~./0.5, name = "Total samples tested")) +  
  scale_x_discrete(limits=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))+
  scale_fill_manual(values=cbPalette)+
  labs(x = "UNIT 2018")+
  theme(axis.text=element_text(size=11), axis.title.y=element_text(angle=0,vjust=1),
        axis.title.y.right=element_text(angle=0,vjust=1, color="red"),
        axis.text.y.right = element_text(color = "red"), 
        axis.title=element_text(size=13,face="bold"), legend.title=element_blank())

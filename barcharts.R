rm(list=ls())
setwd("C:/Users/Kuo/Desktop")
data = read.csv("Book1.csv",sep=",", header=T)  # read csv file
data
str(data)

require(lattice)
library(ggplot2) 

##
p1<- ggplot(data=data, aes(x=Location, y=n, fill=as.factor(group))) +
  geom_bar(stat="identity", position=position_dodge())+
  geom_text(aes(label=n), vjust=1.2, color="white",
            position = position_dodge(0.9), size=2.4)+
  labs(title="",
       x ="County", y = "count", fill = "Gender")+
  scale_fill_brewer(palette="Paired")+
  theme_classic()+
  theme(panel.background = element_rect(colour = "black"),axis.text.x=element_text(size=8, angle = 90), axis.title=element_text(size=12,face="bold"), legend.title = element_text(size = 9), legend.text = element_text(size = 9))
  
p2<- ggplot(data=data, aes(x=Location, y=n, fill=as.factor(group))) +
  geom_bar(stat="identity")+
 
  labs(title="",
       x ="County", y = "count", fill = "Gender")+
  scale_fill_brewer(palette="Paired")+
  theme_classic()+
  theme(panel.background = element_rect(colour = "black"),axis.text.x=element_text(size=9, angle = 90), axis.title=element_text(size=12,face="bold"), legend.title = element_text(size = 9), legend.text = element_text(size = 9))
grid.arrange(p1, p2, ncol = 2)

### compare mpg across all cars and color based on cyl
library(dplyr)          # for data manipulation
library(tidyr)          # for data manipulation
library(magrittr)       # for easier syntax in one or two areas
library(gridExtra)      # for generating some comparison plots
library(ggplot2)        # for generating the visualizations

p3 <- ggplot(data, aes(x = Location, y = n, fill = factor(group))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal() +
  ggtitle("Fig. A: Default fill colors")

p4 <- ggplot(data, aes(x = Location, y = n, fill = factor(group))) +
  scale_fill_manual(values = c("#e5f5e0", "#a1d99b", "#31a354")) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal() +
  ggtitle("Fig. B: Manually set fill colors")

grid.arrange(p3, p4, ncol = 2)









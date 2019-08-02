
require(lattice)
library(ggplot2) 

#1
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

#2 compare mpg across all cars and color based on cyl
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


#3 

library(ggplot2)
theme_set(theme_bw())  

# Data Prep
data # load data
data$n_z <- round((data$n - mean(data$n))/sd(data$n), 2)  # compute normalized n
data$n_type <- ifelse(data$n_z < 0, "below", "above")  # above / below avg flag
data <- data[order(data$n_z), ]  # sort
data$Location <- factor(data$Location , levels = data$Location)  # convert to factor to retain sorted order in plot.

# Diverging Barcharts
ggplot(data, aes(x=Location, y=n_z, label=n_z)) + 
  geom_bar(stat='identity', aes(fill=n_type), width=.5)  +
  scale_fill_manual(name="residents", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(subtitle="number of residents in healthcare facilties'", 
       title= "Diverging Bars") + 
  coord_flip()



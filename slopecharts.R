### Compare different timepoint
rm(list=ls())
setwd("C:/Users/Kuo/Desktop")
data = read.csv("Book3.csv",sep=",", header=T)  # read csv file
data
library(ggplot2)
library(scales)
theme_set(theme_classic())
## Another dataset

str(data) 
# prep data

colnames(data) <- c("Location", "Y2018", "Y2015")
left_label <- paste(data$Location, round(data$`Y2015`),sep=", ")
right_label <- paste(data$Location, round(data$`Y2018`),sep=", ")
data$class <- ifelse((data$Y2018 - data$Y2015) < 0, "red", "green")

# Plot
p <- ggplot(data) + geom_segment(aes(x=1, xend=2, y=`Y2015`, yend=`Y2018`, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Up", "Down"), 
                     values = c("green"="#00ba38", "red"="#f8766d")) +  # color of lines
  labs(x="", y="Mean number of residents") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(1.1*(max(data$`Y2015`, data$`Y2018`))))  # X and Y axis limits

# Add texts
p <- p + geom_text(label=left_label, y=data$`Y2015`, x=rep(1, NROW(data)), hjust=1.1, size=3.5)
p <- p + geom_text(label=right_label, y=data$`Y2018`, x=rep(2, NROW(data)), hjust=-0.1, size=3.5)
p <- p + geom_text(label="Time 1 (2015)", x=1, y=1.1*(max(data$`Y2015`, data$`Y2018`)), hjust=1.2, size=5)  # title
p <- p + geom_text(label="Time 2 (2018)", x=2, y=1.1*(max(data$`Y2015`, data$`Y2018`)), hjust=-0.1, size=5)  # title

# Minify theme
p + theme(panel.background = element_blank(), 
          panel.grid = element_blank(),
          axis.ticks = element_blank(),
          axis.text.x = element_blank(),
          panel.border = element_blank(),
          plot.margin = unit(c(1,2,1,2), "cm"))

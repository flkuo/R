#MHourlySteps_GLMM"

str(data)
require(lattice)
library(ggplot2) 


#1 horizontal boxplot with bwplot
ggplot(data = data, aes(x = Hour, y = Steps)) +
  geom_boxplot(outlier.shape=19,
               outlier.size=0.8, fill='#A4A4A4', color="gray10") +
  labs(title="",
       x ="Hour of Day", y = "Mean Steps")+
  scale_x_discrete(breaks=c("H01","H02", "H03", "H04", "H05", "H06","H07", "H08","H09", "H10", "H11", "H12", "H13","H14", "H15", "H16", "H17", "H18","H19", "H20","H21", "H22", "H23", "H24"),
                   labels=c("1am", "2am", "3am", "4am", "5am", "6am", "7am", "8am", "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm", "7pm", "8pm", "9pm", "10pm", "11pm", "12am"))+
  
  scale_fill_grey(start = 0.5, end = 0.8) +
  theme_classic()+
  theme(panel.background = element_rect(colour = "black"),axis.text=element_text(size=8), axis.title=element_text(size=12,face="bold"), legend.title = element_text(size = 10), legend.text = element_text(size = 10))

#2 Grouped horizontal boxplot with bwplot
ggplot(data = data, aes(x = Hour, y = Steps, fill = FC_bhsteps)) +
  geom_boxplot(outlier.shape=19,
               outlier.size=0.8) +
  labs(title="",
       x ="Hour of Day", y = "Mean Steps", fill = "Class")+
  scale_x_discrete(breaks=c("H01","H02", "H03", "H04", "H05", "H06","H07", "H08","H09", "H10", "H11", "H12", "H13","H14", "H15", "H16", "H17", "H18","H19", "H20","H21", "H22", "H23", "H24"),
                   labels=c("1am", "2am", "3am", "4am", "5am", "6am", "7am", "8am", "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm", "7pm", "8pm", "9pm", "10pm", "11pm", "12am"))+
  
  scale_fill_grey(start = 0.5, end = 0.8) +
  theme_classic()+
  theme(panel.background = element_rect(colour = "black"),axis.text=element_text(size=7), axis.title=element_text(size=12,face="bold"), legend.title = element_text(size = 9), legend.text = element_text(size = 9))


#3 A basic box plot
ggplot(data, aes(x=Hour, y=Steps)) + geom_boxplot()


#4 The above adds a redundant legend. With the legend removed:
ggplot(data, aes(x=Hour, y=Steps, fill=Group)) + geom_boxplot() +
  guides(fill=FALSE)

#5 With flipped axes
ggplot(data, aes(x=Hour, y=Steps, fill=Group)) + geom_boxplot() + 
  guides(fill=FALSE) + coord_flip()


# Lattice Examples 
# kernel density plots by factor level 
#6 Kernel density plot #Lattice
densityplot(~Steps|Group,data=data,
            xlab="Steps",
            main="Steps by Group")

#7 Kernel density plot
densityplot(~Steps,data=data,
            groups=Group,
            xlab="Steps",
            main="Steps by Group",
            plot.points=FALSE,
            auto.key=TRUE)


#8 Kernel density plot #Lattice2
densityplot(~Steps|Group,data=data,
            xlab="Steps",
            main="Steps by Group",
            layout=c(1,2))




#9 Grouped horizontal boxplot with bwplot with time lable adustment
ggplot(data = data, aes(x = Hour, y = Steps, fill = Group)) +
  geom_boxplot(outlier.shape=16,
               outlier.size=1) +
  labs(title="",
       x ="Hour of Day", y = "Mean Steps", fill = "Class")+
  scale_x_discrete(breaks=c("H02",  "H04", "H06", "H08", "H10", "H12","H14", "H16", "H18", "H20", "H22", "H24"),
                   labels=c("2AM", "4AM", "6AM", "8AM", "10AM", "12PM", "2PM", "4PM", "6PM", "8PM", "10PM", "12AM"))+
  
  scale_fill_grey(start = 0.5, end = 0.8) +
  theme_classic()+
  theme(panel.background = element_rect(colour = "black"),axis.text=element_text(size=10, face="bold.italic"),
        axis.title=element_text(size=14,face="bold"))

rm(list=ls())

setwd("C:/Users/Kuo/Box/Data/FR/Redecedcases/mixedmodel")
data = read.csv("MHourlySteps_GLMM.csv",sep=",", header=T)  # read csv file
data
str(data)
require(lattice)
library(ggplot2) 

###Final version
#Grouped horizontal boxplot with bwplot
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


#Grouped horizontal boxplot with bwplot
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



### USE! A basic box with the conditions colored#######################
plot1=ggplot(data, aes(x=Hour, y=Steps, fill=Group)) + geom_boxplot(colour = "gray44", x ="Hour of Day", y = "Steps / Hour", fill = NULL)

plot1 + theme( panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
      panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.line.x = element_line(color="black"),
      axis.line.y = element_line(color="black"),axis.text.x=element_text(size=10), axis.title.x=element_text(size=12),
      axis.text.y=element_text(size=8), axis.title.x=element_text(size=12),
      plot.title=element_text(size=12, face="bold"))+
scale_x_discrete(breaks=c("H02","H04", "H06", "H08", "H10", "H12","H14", "H16","H18", "H20", "H22", "H24"),
                 labels=c("2AM", "4AM", "6AM", "8AM", "10AM", "12N", "2PM", "4PM", "6PM", "8PM", "10PM", "12AM"))+
scale_fill_manual(values=c("orange1", "slategray3"),
                    name=NULL,
                      breaks=c("Low","High"),
                      labels=c("Class I", "Class II"))


####END########################END

+ scale_fill_discrete(guide = guide_legend(reverse=TRUE), name="Growth Slope",
                      breaks=c("Low","High"),
                      labels=c("Class I", "Class II"))



+   scale_fill_manual(values=c("#999999", "#E69F00"), 
                      name="Experimental\nCondition",
                      breaks=c("High", "Low"),
                      labels=c("Control", "Treatment 1"))




plot1+theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                            panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))
#######################################################################

plot1+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

# Use single color
ggplot(data, aes(x=Hour, y=Steps, fill=Group)) +
  geom_boxplot(fill='#A4A4A4', color="black")+
  theme_classic()



## plot base + points
p <- ggplot(data, aes(x = Hour, y = Steps, na.rm=T)) + geom_point()
print(p)

# A basic box plot
ggplot(data, aes(x=Hour, y=Steps)) + geom_boxplot()




# The above adds a redundant legend. With the legend removed:
ggplot(data, aes(x=Hour, y=Steps, fill=Group)) + geom_boxplot() +
  guides(fill=FALSE)

# With flipped axes
ggplot(data, aes(x=Hour, y=Steps, fill=Group)) + geom_boxplot() + 
  guides(fill=FALSE) + coord_flip()


# Lattice Examples 
# kernel density plots by factor level 
mSteps=mean(Steps)
densityplot(~Steps,data=data,
            xlab="Steps",
            main="Steps")

densityplot(~Steps|Hr,data=data,
            xlab="Steps",
            main="Steps by Hour")

densityplot(~Steps|Group,data=data,
            xlab="Steps",
            main="Steps by Group")

densityplot(~Steps,data=data,
            groups=Group,
            xlab="Steps",
            main="Steps by Group",
            plot.points=FALSE,
            auto.key=TRUE)
densityplot(~Steps|Group,data=data,
            xlab="Steps",
            main="Steps by Group",
            layout=c(1,2))



bwplot( Hour~Steps, data = data, groups = Group,
        pch = "|", box.width = 1/3,
        auto.key = list(points = FALSE, rectangles = TRUE, space = "right"),
        panel = panel.superpose,
        panel.groups = function(x, y, ..., group.number) {
          panel.bwplot(x + (group.number-1.5)/3, y, ...)
        })

bwplot(factor(Hour) ~ Steps | Hour, data)



bwplot(Hour ~ Steps, data = data,
       xlab = "Mean Steps", ylab = "Hour",
       main = "Mean Steps during a day"
)



bwplot(Steps ~ Hr, data = data,
       xlab = "Hour", ylab = "Mean Steps",
       main = "Mean Steps during a day"
)

#
bw_lattice <- bwplot(Steps ~ Hour, data = data)
bw_lattice

#Grouped horizontal boxplot with bwplot
ggplot(data = data, aes(x = Hour, y = Steps, fill = Group)) +
  geom_boxplot() +
  labs(title="",
       x ="Hour of Day", y = "Mean Steps", fill = "Class")+
  scale_x_discrete(breaks=c("H01","H02", "H03", "H04", "H05", "H06","H07", "H08","H09", "H10", "H11", "H12", "H13","H14", "H15", "H16", "H17", "H18","H19", "H20","H21", "H22", "H23", "H24"),
                   labels=c("1AM", "2AM", "3AM", "4AM", "5AM", "6AM", "7AM", "8AM", "9AM", "10AM", "11AM", "12PM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM", "11PM", "12AM"))+
 
  scale_fill_grey(start = 0.5, end = 0.8) +
    theme_classic()+
  theme(panel.background = element_rect(colour = "black"),axis.text=element_text(size=10, face="bold.italic"),
          axis.title=element_text(size=14,face="bold"))


#Grouped horizontal boxplot with bwplot with time lable adustment
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

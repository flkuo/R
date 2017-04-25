
library(pwr)
library(lsr)
library(plotly)
library(plyr)

##Paired t-test#USE Book1

t.test(data$precritique, data$postcritique, paired=TRUE) 
t.test(data$prequant, data$postquant, paired=TRUE) 
t.test(data$prequali, data$postquali, paired=TRUE) 
t.test(data$preinvolve, data$postinvolve, paired=TRUE)


##calculate SD
precritique = data$precritique
sd(precritique)
cohensD( x, y = NULL, data = NULL, method = "pooled", mu = 0 ) 

# calculate Cohen's d for two paired samples:
precritique = data$precritique
postcritique = data$postcritique
cohensD(precritique, postcritique, method = "paired") # ... explicitly indicate that it's paired, or else
cohensD(postcritique - precritique)  # ... do a "single-sample" calculation on the difference

# calculate Cohen's d for two paired samples:
prequant = data$prequant
postquant = data$postquant
cohensD(prequant, postquant, method = "paired") # ... explicitly indicate that it's paired, or else
cohensD(postquant - prequant)  # ... do a "single-sample" calculation on the difference

#Graphic each item with 5-grade level
mu <- ddply(data, "critique", summarise, grp.mean=mean('critique'))
head(mu)
a <- ggplot(data, aes(x = critique))
#pic_color_use
a + geom_density(aes(fill = critique), alpha=0.4)+
  xlab('critique')

#Graphic
##Unscaled plot
library(foreign)
attach(data)
precritique = data$precritique
prequant = data$prequant
postquant = data$postquant
par(mfrow=c(1,5))
plot(jitter(precritique,factor=0.4),jitter(postcritique,factor=0.4),main="Confudence in critique", col="coral2", xlab="preclass",ylab="postclass")
plot(jitter(prequant,factor=0.4),jitter(postquant,factor=0.4),main="Frequency of Bath",col="blue",xlab="preclass",ylab="postclass")
plot(jitter(prequali,factor=0.4),jitter(postquali,factor=0.4),main="Frequency of Room",col="blue",xlab="preclass",ylab="postclass")
plot(jitter(preinvolve,factor=0.4),jitter(postinvolve,factor=0.4),main="Frequency of Hall",col="blue",xlab="preclass",ylab="postclass")
plot(jitter(preownresearch,factor=0.4),jitter(preownresearch,factor=0.4),main="Frequency of Total",col="blue",xlab="preclass",ylab="postclass")



#variables of all means
#USE Graphic01
ggplot(data) +
  geom_bar(aes(topic, score, fill = as.factor(class2)), width=0.5,
           position = "dodge", stat = "summary", fun.y = "mean", na.rm = TRUE)+

  scale_fill_hue(c=45, l=80)+
  theme_bw() +
theme(
             plot.background = element_blank()
             ,panel.grid.major = element_blank()
             ,panel.grid.minor = element_blank()
           )



#USE Graphic01
ggplot(data) +
  geom_bar(data=subset(data,topic=="critique"), aes(score, fill = as.factor(score)), 
           position = "dodge")

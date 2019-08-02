#1 population pyramid
rm(list=ls())
setwd("C:/Users/Kuo/Desktop")
data = read.csv("Book4.csv",sep=",", header=T)  # read csv file

data <- data[order(data$population), ] # sort
data

library(ggplot2)

ggplot(data = data, 
       mapping = aes(x = Year, fill = gender, 
                     y = ifelse(test = gender == "male", 
                                yes = -population, no = population))) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs, limits = max(data$population) * c(-1.5,1.5)) +
  labs(y="population") +
  coord_flip()



#2 population pyramid
rm(list=ls())
setwd("C:/Users/Kuo/Desktop")
data = read.csv("Book5.csv",sep=",", header=T)  # read csv file
data

library(ggplot2)

ggplot(data = data, 
       mapping = aes(x = region, fill = gender, 
                     y = ifelse(test = gender == "male", 
                                yes = -geripopulation, no = geripopulation))) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs, limits = max(data$geripopulation) * c(-1,1)) +
  labs(y="older population") +
  scale_fill_brewer(palette = "Dark2") + # Color palette
  coord_flip()




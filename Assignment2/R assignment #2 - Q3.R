# title: ST661 R prog Assignment 2
# author: Paul Williamson
# student id: 18145469
# date: 07/11/2018

# QUESTION 3:

# Q3(a) Make a plot of weight-wtdesire versus age for the cdc1 data. Use pch=20 and a colour vector
# which assigns colours as follows:
#
#  weight > wtdesire and age > 30 red
#  weight > wtdesire and age <= 30 blue
#  weight <= wtdesire and age > 30 orange
#  weight <= wtdesire and age <= 30 cyan
#  Hint: use ifelse.


cdc1

plot(weight ~ wtdesire, data=cdc1, col= ifelse(weight>wtdesire & cdc1$age>30,"red",
                                        ifelse(weight>wtdesire & cdc1$age<=30,"blue",
                                        ifelse(weight<wtdesire & cdc1$age>30, "orange",
                                        ifelse(weight<wtdesire & cdc1$age<=30,"cyan","black")))),
                                        pch=20)

# Q3(b) Recall in a previous lecture we used boxplot.stats to find indices of outliers. Write a function
# using boxplot.stats called boxplot.out that given a numeric vector returns low" if there are
# low outliers, "high" if there are high outliers, "both" if there are high and low outliers, and
# "none" if there are no outliers.


boxplot.out <- function(input_vector){
  
  check_outliers_status <- "."
  boxplot_stats_vector <- boxplot.stats(input_vector)$'stats'
  
  check_low_outlier <- boxplot_stats_vector[1]
  temp_LQ <- boxplot_stats_vector[2]
  temp_median <- boxplot_stats_vector[3]
  temp_UQ <- boxplot_stats_vector[4]
  temp_IQR <- temp_UQ - temp_LQ
  check_high_outlier <- boxplot_stats_vector[5]
  
  ifelse(check_low_outlier < temp_LQ - (1.5*temp_IQR) & check_high_outlier > temp_UQ + (1.5*temp_IQR),
         check_outliers_status <- "both",
         ifelse(check_high_outlier > temp_UQ + (1.5*temp_IQR),
         check_outliers_status <- "high",
         ifelse(check_low_outlier < temp_LQ - (1.5*temp_IQR),
         check_outliers_status <- "low",
         check_outliers_status <- "none"
         )))
  
  check_outliers_status
} # end of function

# test boxplot.out function using cdc1$weight as input vector
boxplot.out(cdc1$weight)


#Q3(c) For the cdc1 data, make boxplots showing weight-wtdesire versus genhlth.

plot(weight ~ wtdesire, data=cdc1, col= ifelse(cdc1$genhlth == "excellent","red",
                                        ifelse(cdc1$genhlth == "very good","blue",
                                        ifelse(cdc1$genhlth == "good", "orange",
                                        ifelse(cdc1$genhlth == "fair","cyan","black")))),
                                        pch=20)

boxplot_collection <- boxplot(weight~wtdesire, data = cdc1, col=cdc1$genhlth)
str(boxplot_collection)

# Q3(d) Using boxplot.out and tapply, construct a vector indicating the type of outlier
# (high, low, both or none) in each boxplot.

outlier_vector <- vector("numeric",length(cdc1))
for (i in 1:length(cdc1)){
  if (is.numeric(cdc[[i]]))
    outlier_vector[i] <- boxplot.out(cdc[[i]])
  else outlier_vector[i]<- NA
}
outlier_vector


# Q3(e) Construct a color vector that is "red" for boxplots that have high and low outliers, "blue"
# for just high outliers, "green" for just low outliers, and "yellow" otherwise. Use this vector to
# colour the boxplots.

colours_vector <- c("red", "blue", "green", "yellow")




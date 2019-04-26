# title: ST661 R prog Assignment 2
# author: Paul Williamson
# student id: 18145469
# date: 07/11/2018

# QUESTION 2:

cdc1

# Q1(a) Write function called skew to calculate the skewness of a numeric vector.

# m3 function definition
m3 <- function(vect_of_samples, vect_mean = mean(vect_of_samples),no_samples = length(vect_of_samples)){
  vect_mean <- sum(vect_of_samples)/length(vect_of_samples)
  no_samples <- length(vect_of_samples)
  for(i in vect_of_samples){
  answer <- answer + (i - vect_mean)^3/no_samples
  }
  return(answer)
  }

# m2 function definition
m2 <- function(vect_of_samples, vect_mean = mean(vect_of_samples),no_samples = length(vect_of_samples)){
  vect_mean <- sum(vect_of_samples)/length(vect_of_samples)
  no_samples <- length(vect_of_samples)
  for(i in vect_of_samples){
    answer <- answer + (i - vect_mean)^2/no_samples
  }
  return(answer)
}

# Skew function definition
skew <- function(vect_of_samples){
  answer <- m3(vect_of_samples)/(m2(vect_of_samples)^(3/2))
  return(answer)
}


# Q2(b) Test your function on mtcars$wt

skew(mtcars$wt)


# Q2(c) Test it also on a set of 50 numbers generated from the standard normal distribution.

rand_50_norm_distr <- rnorm(50,mean=0,sd=1)
rand_50_norm_distr
skew(rand_50_norm_distr)


# Q2(d) Using replicate, replicate the calculation of (c) 1000 times. Draw a histogram of the results
# and calculate the mean skewness value.
replicate_normal_1000 <- replicate(1000,rnorm(50, mean=0, sd=1))
hist(replicate_normal_1000)
skew(replicate_normal_1000)


# Q2(e) Repeat (c) and (d), this time using a set 50 numbers generated from the
# exponential distribution with parameter 1.

# 50 numbers generated from the exponential distribution
replicate_expo_1000 <- replicate(1000,rexp(50, rate = 1))
hist(replicate_expo_1000)
skew(replicate_expo_1000)


# Q2(f) Compare the results of (d) and (e)


# Q2(g) Write code which calculates the skewness for every numeric variable in cdc1.
# Your code should construct a named vector of skewness values, with NA's for non numeric variables.
# Your code should not give any warnings.

class(cdc1)
str(cdc1)

skewness_vect <- vector("numeric", length=length(cdc1))
skewness_vect

for (i in 1:length(cdc1)){
  if (is.numeric(cdc[[i]]))
    skewness_vect[i] <- skew(cdc1[[i]])
  else skewness_vect[i]<- NA
}
skewness_vect




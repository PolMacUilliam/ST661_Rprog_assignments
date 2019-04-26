# title: ST661 R prog Assignment 2
# author: Paul Williamson
# student id: 18145469
# date: 07/11/2018

# QUESTION 1:
# remove(cdc1, cols_to_change, hlth_table, male_total, male_vg_ex_prop)
# remove(female_total, female_vg_ex_prop)
  
# Download the cdc1.Rdata file from moodle and load
load("C:/Users/PAUL/Documents/.Maynooth HDip/ST661 R programming/Assignment #2/cdc1.Rdata")

# check data imported
str(cdc1)
head(cdc1)

# Q1(a) Change variables exerany, smoke100 and hlthplan to be factors with suitable levels.

# Use a char vector to index cols into data
cols_to_change <- c("exerany","smoke100","hlthplan")
cdc1[cols_to_change] <- lapply(cdc1[cols_to_change], factor)

# check class types in cdc1 dataset to confirm variables have been changed to factors
sapply(cdc1, class)

# Alternatively change each col separately using...
# cdc$exerany <-as.factor(cdc$exerany)

# change to suitable levels
levels(cdc1$exerany) <- c("no", "yes")
levels(cdc1$hlthplan) <- c("nocover", "cover")
levels(cdc1$smoke100) <- c("nosmoke", "smoke")

# Confirm changes to levels
str(cdc1)
head(cdc1)

# Q1(b) Calculate the proportion of men that have health very good or better. Do the same for women.
# Who has the better health?

class(cdc1)

hlth_table <- table(cdc1$genhlth, cdc1$gender)
class(hlth_table)
hlth_table
barplot(hlth_table, beside=TRUE, col=1:5, legend.text=TRUE)

# Compare overall proportions on barplot
prop.table(hlth_table)
barplot(prop.table(hlth_table), col=1:5, legend.text=TRUE)

# get proportions per gender
male_total <-sum(hlth_table[,"m"]) # sum of all rows in column 1 (m)
male_total
male_vg_ex_prop <- sum(hlth_table[1:2,"m"])/male_total # proportion: sum/total
male_vg_ex_prop

female_total <-sum(hlth_table[,"f"]) # sum of all rows in column 2 (f)
female_total
female_vg_ex_prop <- sum(hlth_table[1:2,"f"])/female_total # proportion: sum/total
female_vg_ex_prop


# Q1(c) Use subset to extract the smokers.
# For the smokers, calculate the proportion of men that have health very good or better.
# Do the same for women.

# remove(smokers_table, healthy_male_smokers, proportion_healthy_male_smokers, healthy_female_smokers,proportion_healthy_female_smokers)

head(cdc1)
smokers_table <- subset(cdc1, smoke100 == "smoke")
head(smokers_table)

# extract male smokers
healthy_male_smokers <- subset(smokers_table, gender == "m" & (genhlth == "excellent" | genhlth == "very good"))
head(healthy_male_smokers)
healthy_male_smokers <- subset(healthy_male_smokers, select = c(genhlth,smoke100,gender))
head(healthy_male_smokers)

proportion_healthy_male_smokers <- length(healthy_male_smokers)/male_total
proportion_healthy_male_smokers

# extract female smokers
healthy_female_smokers <- subset(smokers_table, gender == "f" & (genhlth == "excellent" | genhlth == "very good"))
head(healthy_female_smokers)
healthy_female_smokers <- subset(healthy_female_smokers, select = c(genhlth,smoke100,gender))
healthy_female_smokers

proportion_healthy_female_smokers <- length(healthy_female_smokers)/female_total
proportion_healthy_female_smokers


# (d) Repeat (c) for non smokers.

non_smokers_table <- subset(cdc1, smoke100 == "nosmoke")
head(non_smokers_table)

# extract male non smokers
healthy_male_non_smokers <- subset(non_smokers_table, gender == "m" & (genhlth == "excellent" | genhlth == "very good"))
head(healthy_male_non_smokers)
healthy_male_non_smokers <- subset(healthy_male_non_smokers, select = c(genhlth,smoke100,gender))
head(healthy_male_non_smokers)

proportion_healthy_male_non_smokers <- length(healthy_male_non_smokers)/male_total
proportion_healthy_male_non_smokers

# extract female smokers
healthy_female_non_smokers <- subset(non_smokers_table, gender == "f" & (genhlth == "excellent" | genhlth == "very good"))
head(healthy_female_non_smokers)
healthy_female_non_smokers <- subset(healthy_female_non_smokers, select = c(genhlth,smoke100,gender))
healthy_female_non_smokers

proportion_healthy_female_non_smokers <- length(healthy_female_non_smokers)/female_total
proportion_healthy_female_non_smokers


# (e) Based on your calculations of (c) and (d), compare the health of men and women, and the
# health of smokers and non smokers.
proportion_healthy_male_smokers
proportion_healthy_female_smokers
proportion_healthy_male_non_smokers
proportion_healthy_female_non_smokers

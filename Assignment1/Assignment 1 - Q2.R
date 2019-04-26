# R-programming (ST661 2018)
# Lecturer: Catherin Hurley
# Student: Paul Williamson
# Student ID: 18145469
# Assignment: 1
# Date: 12/10/2018

# Question 2
# --------------

house <- read.csv("C:/Users/PAUL/Documents/.Maynooth HDip/R programming/Assignment 1/house.csv",row.names=1)
house

# (a) Use head to check the rst few rows of the data.
head(house)

# (b) Extract the row of the data for Ireland.
house["Ireland",]

# (c) Find Spain's value for TooDark.
house["Spain",1]

# (d) For how many countries is the percentage without an indoor toilet 0?

count_NoIndoorToilet <- sum(house[,4] == 0)
count_NoIndoorToilet

# (e) For how many countries is the percentage without an indoor toilet and without a bath/shower both 0?

count_NoIndoorToilet_NoBathShower <- sum((house[,4] == 0) & (house[,3] == 0))
count_NoIndoorToilet_NoBathShower

# (f) Find the names of the countries where the percentage without an indoor toilet and without a
#     bar/shower are both zero. Your code should give a vector of the country names.

no_modCons <- subset(house, (house[,4] == 0) & (house[,3] == 0))
no_modCons <- rownames(no_modCons)
no_modCons

# (g) Find the maximum value of the variable Damp.

max_damp <- max(house$Damp)
max_damp



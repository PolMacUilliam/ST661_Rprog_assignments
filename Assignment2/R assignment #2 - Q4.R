# title: ST661 R prog Assignment 2
# author: Paul Williamson
# student id: 18145469
# date: 07/11/2018

# QUESTION 4:

load("C:/Users/PAUL/Documents/.Maynooth HDip/ST661 R programming/Assignment #2/kobe.RData")
kobe

# Q4(a) Write a while loop to calculate how many throws are required to reach 3 hoops.

scores <- 0
num_games <- length(kobe$basket)
count_shots <- 0
while(scores<3){
  count_shots <- count_shots +1
  if(kobe$basket[count_shots]=="H"){scores <- scores + 1}
  }
count_shots

# Q4(b) Write another while loop to calculate how many throws are required to reach 3 more hoops

while(scores<6){
  # re-using the count_shots (=5) from previous snippet
  count_shots <- count_shots +1
  if(kobe$basket[count_shots]=="H"){scores <- scores + 1}
}
count_shots
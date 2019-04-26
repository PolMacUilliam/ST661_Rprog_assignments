# R-programming (ST661 2018)
# Lecturer: Catherin Hurley
# Student: Paul Williamson
# Student ID: 18145469
# Assignment: 1
# Date: 12/10/2018

# Question 3
# --------------

load("C:/Users/PAUL/Documents/.Maynooth HDip/R programming/Assignment 1/worldcup.Rdata")
gtimes # display data
ngoals # display data

# (a) Draw a barplot of the number of goals per match. What is the most frequent number of goals?
#     Find the mean and the median.

barplot(ngoals) # plot

mean_goals <- mean(ngoals)
mean_goals

median_goals <- median(ngoals)
median_goals


# (b) The first 52 matches were played in 1990, the next 52 matches were played in 1994, the next 64
#     matches were played in 1998, and the last 64 matches were played in 2002. Therefore elements
#     52, 104, 168 and 232 of ngoals give the numbers of matches scored in the four finals. Extract
#     these elements of ngoals into a vector.

goalsScoredInFinals <- ngoals[c(52,104,168,232)]
goalsScoredInFinals


# (c) Make a vector of length 232 containing the year each match was played. Call your vector year.
# (Hint: use rep.)
yr1990 <- 52
yr1994 <- 52
yr1998 <- 64
yr2002 <- 64
year <- c(rep(1990, yr1990),rep(1994, yr1994),rep(1998, yr1998),rep(2002, yr2002))
year


# (d) Turn the vector year into a factor. Make a data frame where the first variable is ngoals and
#     the second is year.

year <- factor(year)
year

year_goals_df <- data.frame(ngoals,year)
year_goals_df


# (e) Make a vector called matchn containing the number of the match for that world cup. The
#     vector should be 1..52, 1..52, 1..64, 1..64. Add this vector to the data frame.

matchn <- c(seq(1,52),seq(1,52),seq(1,64),seq(1,64))
matchn
year_goals_df <- cbind(year_goals_df,matchn)
year_goals_df


# (f) Extract the rows 52, 104, 168 and 232 of the data frame. Which year's final has the most goals?

max_FinalsGoals <- max(year_goals_df[c(52,104,168,232),1])
max_FinalsGoals


# (g) Make a boxplot of the number of goals played for each year. What can you say about the 8 goal match?

boxplot(year_goals_df$ngoals)
message("What can you say about the 8 goal match? It would seem to be an outlier.")


# (h) (Advanced, optional). The vector gtimes contains the cumulative time in minutes from the
#     start of the 1990 world cup in which goals were scored (counting playing time only.) Construct
#     another vector minute containing the minute of each game in which the goal is scored. In what
#     minutes of the matches are goals most likely to occur?

gtimes
minute <- vector()
currTime <- 1

for (currTime in 1:length(gtimes))
  {
    currentTime <- gtimes[currTime]
    while(currentTime>90)
    {
      currentTime <- currentTime-90
    }
    minute[currTime] <- currentTime
  }
minute

minute <- factor(minute)
table(minute)
names(which.max(table(minute)))

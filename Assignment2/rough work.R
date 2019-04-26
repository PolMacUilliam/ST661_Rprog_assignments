## Question 1 ##

census <- read.csv("census1.csv")
censusF <- subset(census, Gender=="F")

str(censusF)
head(censusF)

# Add boxplots and scatterplot
par(mfrow=c(1, 2))
boxplot(censusF$FootR,censusF$FootL,names=c("Right Foot","Left Foot"), col = c("Blue", "Green")) # 2 boxplots
plot(censusF$FootR, censusF$FootL, xlab="CensusF$FootR", ylab="CensusF$Footl",col = c("blue","green"), pch=c(0,2)) # scatterplot

# copy dataset
censusF_df_sub <- censusF;
# set any 0 values to NA
censusF_df_sub[censusF_df_sub==0]<-NA;
# remove rows with NA's
censusF_df_sub <- censusF_df_sub[complete.cases(censusF_df_sub),];
# check df
censusF_df_sub

# calculate vector of difference values
# use abs() function to make sure all difference values are positive
foot_diffs <- abs(censusF_df_sub$FootR - censusF_df_sub$FootL)
mean(foot_diffs)
# create df with all relevant values
foot_df <- data.frame(censusF_df_sub$FootR, censusF_df_sub$FootL, foot_diffs)
# check dataframe was created as expected
foot_df

# perform t-test and preserve results
foot_df_stats <- t.test(foot_df$foot_diffs)
# check results
str(foot_df_stats)
# extract p-value
foot_diffs_p_val <- foot_df_stats$p.value;
foot_diffs_p_val

par(mfrow=c(1, 3)) # setup the layout
qqnorm(censusF_df_sub$FootR,col = "blue", ylab="CensusF$FootR", xlab="Z quantiles", main = "qqnorm Right foot") # normal qq plot of right foot data
qqline(censusF_df_sub$FootR,col = "red") # add normal line
qqnorm(censusF_df_sub$FootL,col = "green", ylab="CensusF$FootL", xlab="Z quantiles", main = "qqnorm Left foot") # normal qq plot of left foot data
qqline(censusF_df_sub$FootL,col = "red") # add normal line
qqnorm(foot_diffs, ylab="Differences",xlab="Z quantiles", main = "qqnorm Differences") # normal qq plot of differences foot data
qqline(foot_diffs, col = "red") # add normal line



foot_df_stats <- t.test(censusF_df_sub$FootR,censusF_df_sub$FootL)

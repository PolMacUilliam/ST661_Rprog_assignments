censusF
str(censusF)
?plot
?barplot
table(t(censusF))
side<-c(censusF$FootR,)
boxplot(censusF$FootR,censusF$FootL,names=c("Right Foot","Left Foot"), col = c("Blue", "Green"))
?boxplot
nrow(censusF)

num_samples <- nrow(censusF)
num_samples
mean(censusF$FootR)
Right_sd <- sd(censusF$FootR)
?nrow

sd_right <- sd(censusF$FootR); # std dev
se_right <- sd_right/sqrt(num_samples); # std error
right_vector <- c(mean_right,sd_right,se_right); right_vector
boxplot.stats(censusF$FootR)
tright <- t.test(censusF$FootR)
str(tright)

sd_left <- sd(censusF$FootL)
se_left <- sd_left/sqrt(num_samples)
left_vector <- c(mean_left,sd_left,se_left); left_vector
boxplot.stats(censusF$FootL)


# Add boxplots to the scatterplot
par(fig=c(0,0.8,0,0.8))
plot(censusF$FootR, censusF$FootL, xlab="CensusF$FootR", ylab="CensusF$Footl",col = c("blue","green"))
par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(censusF$FootR, horizontal=TRUE, axes=FALSE, col = "blue")
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(censusF$FootL, axes=FALSE, col = "green")
mtext("Scatterplot", side=3, outer=TRUE, line=-3)


#############################################

#install.packages("ggplot2")
library(ggplot2)
library(reshape2)
#install.packages("ggthemes")
library(ggthemes) # Load


x2016 <- c(10,40,38,23,18,13,44)
x2017 <- c(4,33,28,22,22,16,33)
agegroup <- c("0-15","16-25","26-35","36-45","46-55","56-65","66+")
rs_data <- data.frame(x2016, x2017,agegroup)
# str(rs_data)# check data

formatted_rs_data <- melt(rs_data) # re-format the data to prepare for plotting
#str(formatted_rs_data) # check format of new dataframe
levels(formatted_rs_data$variable) <- c("2016", "2017") # rename levels in formatted data

plotty <- ggplot(formatted_rs_data, aes(x=agegroup, y=value, fill=variable, width=0.5)) # call ggplot function
plotty <- plotty + geom_bar(stat='identity', position='dodge') # 'dodge' position bars side by side
plotty <- plotty + geom_text(aes(label=value),vjust = -1.3, position=position_dodge(0.5)) # adjust position of value labels
plotty <- plotty + scale_fill_manual(values=c("grey50", "olivedrab3"))# colour fill the bars
#plotty # ok up to here

# adjust y-axis elements
plotty <- plotty + scale_y_continuous(limits = c(0,50), breaks = seq(0,50,by=5), minor_breaks = seq(5,50,by=5))
#plotty # ok up to here

# adjust theme elements
plotty <- plotty + theme(panel.background = element_rect(fill = "white",colour = "white"))
plotty <- plotty + theme(panel.grid.major.y = element_line(colour = "grey", size = 0.5))
plotty <- plotty + theme(panel.grid.minor.y = element_line(colour = "grey", size = 0.5))
plotty <- plotty + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())
plotty <- plotty + theme(axis.ticks.x = element_blank(), axis.ticks.y = element_blank())
plotty <- plotty + theme(axis.title.y=element_blank(), axis.title.x = element_blank())
#plotty # ok up to here

# adjust more theme elements
plotty <- plotty + theme(legend.position="bottom")
plotty <- plotty + theme(legend.title=element_blank())
plotty <- plotty + labs(title="Figure 8. Deaths by age group, January to December 31st 2017 vs 2016")
plotty <- plotty + theme(plot.title = element_text(color="#000000", face="bold", size=13))
plotty <- plotty + guides(colour = guide_legend(override.aes = list(size=0.5)))

plotty <- plotty + theme(legend.position = c(.95, .95), legend.justification = c("center", "bottom"), legend.box.just = "right",legend.margin = margin(6, 6, 6, 6))
plotty

# works for zooming
plotty <- plotty + coord_cartesian(ylim = c(0, 50))
plotty







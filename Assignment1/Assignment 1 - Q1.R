# R-programming (ST661 2018)
# Lecturer: Catherin Hurley
# Student: Paul Williamson
# Student ID: 18145469
# Assignment: 1
# Date: 12/10/2018

# Question 1
# --------------

# (a) Construct a vector with values 10,11,12,13,14.
# Do this using :, c and seq. Assign your result to x.

x1 <- (10:14)
x1

x2 <- c(10,11,12,13,14)
x2

x3 <- seq(10, 14) 
x3

# (b) Construct a vector with values 14,10,11,13,12. Call it y.

y <- c(14,10,11,13,12)
y

# (c) Extract the third value of x.
x1[3]

# (d) Extract the second and fourth values of y.
y[2]; y[4]

# (e) Write a sentence explaining what the next line of code does.
result <- sum(x1>y)
result
message("This function makes an element-wise comparison of the elements in vector x\nwith the elements in vector y and count those elements in vector x which are larger than\ntheir positional counterpart in vector y; In this case the result is 3.")

# (f) Write a sentence explaining what the next line of code does. (Look up the help page for abs.)
result <- sum(abs(x2-y) == 1)
result
message("The (x-y) returns a 'difference' vector with values equal to the element-wise difference between vector x values and vector y values;
the abs() returns a vector with the absolute (positive) magnitude of the values in that 'difference' vector;
the '== 1' returns a 'logical' vector with values true for those values equal to 1 and false for any other value not equal to 1;
the sum function results in a summation of all the elements in the resulting 'logical' vector, it treats a false value as 0 and a true value as 1;
the overall effect or result is a count of the number of elements in vector x which are of magnitude 1 away from their positional counterpart in vector y.")

# (g) Write code which implements the following formula. summation[i=1:5](Xi^2/Yi)
x <- 1:5
y <- x
result <- sum((x*x)/y)
result

# (h) Form a 5 x 2 matrix using the values in x and y.

new_matrix <- cbind(x3,y)
new_matrix

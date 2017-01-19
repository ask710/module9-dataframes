# Load R's "USPersonalExpenditure" dataset using the "data()" function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")

# The variable USPersonalExpenditure is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable as an argument
# to the `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
expenditure <- data.frame(USPersonalExpenditure)
View(expenditure)
# What are the column names of your dataframe?
print(colnames(expenditure))

# Why are they so strange? Think about whether you could use a number like 1940
# with dollar notation!

# What are the row names of your dataframe?
rownames(expenditure)

# Create a column "category" that is equal to your rownames
expenditure$category <- rownames(expenditure)

# How much money was spent on personal care in 1940?
personal.care.1940 <- expenditure["Personal Care", 1]
print(personal.care.1940)
# How much money was spent on Food and Tobacco in 1960?
food.and.tobacco.1960 <- expenditure["Food and Tobacco", 5]
print(food.and.tobacco.1960)
# What was the highest expenditure category in 1960?
# Hint: use the `max()` function to find the largest, then compare that to the column
highest.expenditure.1960 <- expenditure$category[expenditure$X1960 == max(expenditure$X1960)]
print(highest.expenditure.1960)

# Define a function `DetectHighest` that takes in a year as a parameter, and
# returns the highest spending category of that year
DetectHighest <- function(year){
  column <- paste0('X', year)
  highest.expenditure <- expenditure$category[expenditure[[column]] == max(expenditure[[column]])]
  return(highest.expenditure)
}

# Using your function, determine the highest spending category of each year
DetectHighest(1940)
DetectHighest(1945)
DetectHighest(1950)
DetectHighest(1955)
DetectHighest(1960)


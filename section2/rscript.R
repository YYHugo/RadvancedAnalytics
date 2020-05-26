getwd()
setwd("/home/hugo/workspace/RadvancedAnalytics/section2")

fin <- read.csv("P3-Future-500-The-Dataset.csv")
head(fin)
tail(fin)

str(fin)
# summary() gives the important information out of the data
# Of course, only when data has the correct type of variable, eg 'age' type should be an integer and 'inception' should be a char
summary(fin)

# Changing from non-factors to factor to correct the type attributed to each info 
# The different values for 'ID'
levels(fin$ID)
# check the type of 'ID'
class(fin$ID)
# Now change "ID" to be a factor
fin$ID <- factor(fin$ID)
# check the type of 'ID'
class(fin$ID)
# It is supposed to be a factor
summary(fin)
str(fin)

# Were doing the same to 'Inception'
class(fin$Inception)
fin$Inception <- factor(fin$Inception)
class(fin$Inception)

# Factor Variable Trap (author calls it as FVT from now on)
#   Problem created by changing a factor to, e.g., an int
# Converting into Numerics for characters
a <- c("12", "13", "14", "12", "12")
typeof(a) #it is supposed to be an [array of] char
b <- as.numeric(a)
b
typeof(b) # then 'b' is a double

# Converting into Numerics for factors
# Create a 'z' variable as type factor by the array of chars 'a'
z <- factor(a)
z
typeof(z)
# Although the output os typeof() is an integer, its class is
class(z) #... still a factor
# So what happens if we use z as a numeric?
y <- as.numeric(z)
y 
# as a factor is an alias from a human-readable value expressed as an integer representation, 'z' has the type:
#   '1' as "12"
#   '2' as "13" and
#   '3' as "14"
# which means that numeric is getting the category integer representation
# --- So whats the correct way to do this convertion? ---
# Change into character
x <- as.numeric(as.character(z))

# Cleans the screen for next video tutorial
cat(rep("\n", 50))

# Section 2, video 11
# gsub() and sub()
# 'g' stands for 'Global' and 'sub' substitution, like sub and gsub from linux command awk
# For documentation use "?sub"
fin$Expenses <- gsub(" Dollars", "", fin$Expenses) # substitute every part ' Dollars' to <nothing> to clean the numeric value
fin$Expenses <- gsub(",", "", fin$Expenses)
head(fin)
str(fin)

#There are special characters that are used as metacharacters, like '$', that must be noted with backlashes before them
fin$Expenses <- gsub("\\$", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
head(fin)
str(fin)

fin$Growth <- gsub("%", "", fin$Growth)


fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)

# Dealing with missing data
# you may fill with mean or median from other frames (search all other entries to compute their mean/median)
# calculate by other informations existing in frame (eg: profit = revenues - expenses)
##### BUT IF IT IS NOT A INFORMATION TO BE PROXY:
# leave as it is (blank)
# remove that registry (by removing the line)
# keep it by searching its true value by other information that you can search (like year of inception)

# WHAT IS 'AN'?
# Not Available (or missing value)
# play with some NA comparison (NA==TRUE, NA==FALSE)...
# To show if it's an NA, which is a third type of value, is.na()

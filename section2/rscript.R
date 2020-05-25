getwd()
setwd("/home/hugo/workspace/RadvancedAnalytics/section2")

fin <- read.csv("P3-Future-500-The-Dataset.csv")
head(fin)
tail(fin)

str(fin)
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

# Dealing with different convertions

# Load the mtcars dataset (it's built-in)
data(mtcars)

# Calculate the mean and standard deviation of mpg
mean_mpg <- mean(mtcars$mpg)
sd_mpg <- sd(mtcars$mpg)

# Open a PNG device to save the plot (optional)
png("histogram_mpg.png", width = 1920, height = 1080, res = 300)

# Create the histogram with different shades of blue
hist(mtcars$mpg, 
     breaks = 10, # Number of bins
     col = colorRampPalette(c("lightblue", "blue"))(10), 
     xlab = "Miles Per Gallon (mpg)", 
     main = "Histogram of Miles Per Gallon in mtcars Dataset")

# Add mean and standard deviation as text on the plot
text(x = mean_mpg, y = 5, 
     labels = paste("Mean:", round(mean_mpg, 2)), 
     col = "red", cex = 1.2)

text(x = mean_mpg, y = 4, 
     labels = paste("SD:", round(sd_mpg, 2)), 
     col = "red", cex = 1.2)

# Add a vertical line for the mean
abline(v = mean_mpg, col = "red", lwd = 2, lty = 2)

# Close the device (if saving to a file)
dev.off()

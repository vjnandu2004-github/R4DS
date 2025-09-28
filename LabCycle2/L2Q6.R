# Load the mtcars dataset (it's built-in)
data(mtcars)

# Open a PNG device to save the plot (optional)
png("scatterplot_disp_wt_carb.png", width = 1920, height = 1080, res = 300)

# Create the scatter plot
plot(mtcars$disp, mtcars$wt, 
     col = as.factor(mtcars$carb), # Different colors for each carburetor count
     cex = mtcars$carb * 0.7,      # Size based on number of carburetors
     pch = 19,                     # Point type
     xlab = "Displacement (cu.in.)", 
     ylab = "Weight (1000 lbs)", 
     main = "Scatterplot of Displacement vs Weight (Colored by Carburetors)")

# Add a smooth trend line (LOESS regression)
lines(loess.smooth(mtcars$disp, mtcars$wt), col = "black", lwd = 2)

# Add a legend for carburetors (color-coded)
legend("topright", 
       legend = unique(mtcars$carb), 
       col = as.factor(unique(mtcars$carb)), 
       pch = 19, 
       title = "Carburetors")

# Close the device (if saving to a file)
dev.off()

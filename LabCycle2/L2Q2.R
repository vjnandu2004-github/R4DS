# Load the mtcars dataset (it's built-in)
data(mtcars)

# Open a PNG device to save the plot (optional if you want to save)
png("scatterplot_mpg_disp.png", width = 1920, height = 1080, res = 300)

# Create scatterplot with color coding for cyl
plot(mtcars$disp, mtcars$mpg, 
     col = as.factor(mtcars$cyl), 
     xlab = "Displacement (cu.in.)", 
     ylab = "Miles Per Gallon (mpg)", 
     main = "Scatterplot of MPG vs Displacement with Cylinders Colored",
     pch = 19)

# Add a smooth trend line
lines(loess.smooth(mtcars$disp, mtcars$mpg), col = "black", lwd = 2)

# Add a legend
legend("topright", legend = unique(mtcars$cyl), 
       col = as.factor(unique(mtcars$cyl)), 
       pch = 19, title = "Cylinders")

# Close the device (if saving to a file)
dev.off()# Load the mtcars dataset (it's built-in)
data(mtcars)

# Open a PNG device to save the plot (optional if you want to save)
png("scatterplot_mpg_disp.png", width = 1920, height = 1080, res = 300)

# Create scatterplot with color coding for cyl
plot(mtcars$disp, mtcars$mpg, 
     col = as.factor(mtcars$cyl), 
     xlab = "Displacement (cu.in.)", 
     ylab = "Miles Per Gallon (mpg)", 
     main = "Scatterplot of MPG vs Displacement with Cylinders Colored",
     pch = 19)

# Add a smooth trend line
lines(loess.smooth(mtcars$disp, mtcars$mpg), col = "black", lwd = 2)

# Add a legend
legend("topright", legend = unique(mtcars$cyl), 
       col = as.factor(unique(mtcars$cyl)), 
       pch = 19, title = "Cylinders")

# Close the device (if saving to a file)
dev.off()
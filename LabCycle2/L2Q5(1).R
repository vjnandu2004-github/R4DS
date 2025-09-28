# Load the mtcars dataset (it's built-in)
data(mtcars)

# Open a PNG device to save the plot (optional)
png("boxplot_hp_gears.png", width = 1920, height = 1080, res = 300)

# Create the box plot of horsepower (hp) by gears (gear)
boxplot(mtcars$hp ~ mtcars$gear, 
        xlab = "Number of Gears", 
        ylab = "Horsepower (hp)", 
        main = "Box Plot of Horsepower by Number of Gears",
        col = c("lightgreen", "lightblue", "lightpink"), 
        pch = 19)  # pch specifies the symbol type for outliers

# Add a legend to differentiate between gears
legend("topright", 
       legend = unique(mtcars$gear), 
       title = "Gears", 
       fill = c("lightgreen", "lightblue", "lightpink"))

# Identify and label outliers
outliers <- boxplot(mtcars$hp ~ mtcars$gear, plot = FALSE)$out
if (length(outliers) > 0) {
  outlier_indexes <- which(mtcars$hp %in% outliers)
  
  # Label the outliers on the plot
  text(x = as.numeric(mtcars$gear[outlier_indexes]), 
       y = mtcars$hp[outlier_indexes], 
       labels = rownames(mtcars)[outlier_indexes], 
       pos = 4, col = "red")
} else {
  message("No outliers found.")
}

# Close the device (if saving to a file)
dev.off()

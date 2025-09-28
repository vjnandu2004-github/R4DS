# Open a PNG device to save the plot
png("scatterplot_sepal_petal_length.png", width = 1920, height = 1080, res = 300)

# Create the scatterplot
plot(iris$Sepal.Length, iris$Petal.Length, 
     xlab = "Sepal Length (cm)", 
     ylab = "Petal Length (cm)", 
     main = "Scatterplot of Sepal Length vs Petal Length in Iris Dataset",
     col = "blue", 
     pch = 19)  # pch changes the point type

# Close the device
dev.off()

# Load the mtcars dataset (it's built-in)
data(mtcars)

# Open a PNG device to save the plot (optional)
png("barplot_cyl_am.png", width = 1920, height = 1080, res = 300)

# Create a table of counts for cylinders and transmission
cyl_am_table <- table(mtcars$cyl, mtcars$am)

# Create the bar plot
barplot(cyl_am_table, beside = TRUE, 
        col = c("skyblue", "orange", "green"), 
        legend = rownames(cyl_am_table), 
        xlab = "Transmission Type (0 = Automatic, 1 = Manual)", 
        ylab = "Number of Cars", 
        main = "Bar Plot of Cylinder Counts by Transmission Type")

# Add a legend for transmission type
legend("topright", 
       legend = c("Automatic", "Manual"), 
       fill = c("skyblue", "orange"))

# Close the device (if saving to a file)
dev.off()

# Load necessary libraries
library(ggplot2)
library(readr)

# Load the train dataset (assume it's saved as 'train.csv')
train_data <- read_csv("train.csv")

# View the first few rows to understand the structure
head(train_data)



# Fit a linear regression model with SalePrice as dependent variable and GrLivArea as the independent variable
model <- lm(SalePrice ~ GrLivArea, data = train_data)

# View the summary of the model to check the coefficients and other statistics
summary(model)


# Extract the intercept and slope (regression coefficients)
intercept <- coef(model)[1]
slope <- coef(model)[2]

# Print the slope and intercept
cat("Intercept:", intercept, "\n")
cat("Slope:", slope, "\n")



# Create scatter plot of GrLivArea vs SalePrice
ggplot(train_data, aes(x = GrLivArea, y = SalePrice)) +
  geom_point(color = "blue", alpha = 0.6) +  # Scatter plot of data points
  geom_abline(intercept = intercept, slope = slope, color = "red", size = 1.2) +  # Regression line
  labs(title = "Linear Regression: SalePrice vs GrLivArea", 
       x = "Above Ground Living Area (sq ft)", 
       y = "Sale Price (USD)") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title = element_text(size = 14)
  )

# Save the plot (optional)
ggsave("regression_SalePrice_GrLivArea.png", width = 12, height = 8, dpi = 300)


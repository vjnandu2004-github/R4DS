install.packages("MASS")
install.packages("ggplot2")
install.packages("corrplot")

library(MASS)
library(ggplot2)
library(corrplot)

# load dataset
data("Boston")
head(Boston)

# data exploration
str(Boston)
summary(Boston)

# missing values
sum(is.na(Boston))

# data visualization - hist for freq dist of all
for (variable in names(Boston)) {
  hist(Boston[[variable]], main = paste("Distribution of", variable), 
       col = "lightblue", xlab = variable)
}

# - scatter plot for realtionship: each vs medv
for (variable in names(Boston)[-14]) { # take out medv (14th column)
  plot(Boston[[variable]], Boston$medv, 
       xlab = variable, ylab = "Median Value (medv)", 
       main = paste(variable, "vs medv"))
}

# - correlation matrix
correlation_matrix <- cor(Boston)
corrplot(correlation_matrix, method = "color", tl.cex = 0.8)

# regression analysis
linear_model <- lm(medv ~ ., data = Boston)
summary(linear_model)

# Prediction
predicted_values <- predict(linear_model, newdata = Boston)

# actual vs predicted
results <- data.frame(Actual = Boston$medv, Predicted = predicted_values)
head(results)

# model eval
mse <- mean((results$Actual - results$Predicted)^2)
cat("Mean Squared Error (MSE):", mse, "\n")
r_squared <- summary(linear_model)$r.squared
cat("R-squared:", r_squared, "\n")

# plot predictions
ggplot(results, aes(x = Actual, y = Predicted)) +
  geom_point(color = "olivedrab") +
  geom_abline(intercept = 0, slope = 1, color = "peru", linetype = "dashed") +
  labs(title = "Actual vs Predicted Median Home Values",
       x = "Actual Median Value",
       y = "Predicted Median Value") +
  theme_minimal()
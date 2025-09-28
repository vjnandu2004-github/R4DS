library(ggplot2)
library(dplyr)

data(iris)

head(iris)

# box plot to see the distribution of sepal length for each species
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Sepal Length by Species", x = "Species", y = "Sepal Length") +
  theme_minimal()

# ANOVA to see if there are significant differences in Sepal.Length across the species
anova_result <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_result)

# if p-value from the ANOVA summary is less than 0.05, it suggests significant differences
# between species in terms of Sepal.Length.

# if ANOVA is significant, we use a Tukey test to see which species differ in Sepal Length
if(summary(anova_result)[[1]][["Pr(>F)"]][1] < 0.05) {
  post_hoc <- TukeyHSD(anova_result)
  print(post_hoc)
}

# scatter plots between each pair of variables, colored by species
pairs(iris[1:4], col = iris$Species, main = "Pair Plot of Iris Dataset")
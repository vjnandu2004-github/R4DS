library(ggplot2)
library(dplyr)
library(summarytools)

# titanic dataset
titanic <- read.csv("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv")

head(titanic)

# histogram of the number of parents and children aboard (parch)
ggplot(titanic, aes(x = Parch)) +
  geom_histogram(binwidth = 1, fill = "olivedrab", color = "black") +
  labs(title = "Number of Parents and Children Aboard (Parch)", x = "Parch", y = "Frequency") +
  theme_minimal()

# summary of the dataset
summary(titanic)
dfSummary(titanic)

# missing values
colSums(is.na(titanic))

# survival rate by gender
titanic %>%
  group_by(Sex) %>%
  summarise(Survived_Rate = mean(Survived, na.rm = TRUE) * 100) %>%
  ggplot(aes(x = Sex, y = Survived_Rate, fill = Sex)) +
  geom_bar(stat = "identity", color = "black") +
  labs(title = "Survival Rate by Gender", x = "Gender", y = "Survival Rate (%)") +
  theme_minimal()

# survival rate by passenger class
titanic %>%
  group_by(Pclass) %>%
  summarise(Survived_Rate = mean(Survived, na.rm = TRUE) * 100) %>%
  ggplot(aes(x = as.factor(Pclass), y = Survived_Rate, fill = as.factor(Pclass))) +
  geom_bar(stat = "identity", color = "black") +
  labs(title = "Survival Rate by Passenger Class", x = "Passenger Class", y = "Survival Rate (%)") +
  theme_minimal()

# age distribution by survival status
ggplot(titanic, aes(x = Age, fill = as.factor(Survived))) +
  geom_histogram(binwidth = 5, alpha = 0.7, position = "identity") +
  scale_fill_manual(values = c("lightcoral", "lightgreen"), labels = c("Did Not Survive", "Survived")) +
  labs(title = "Age Distribution by Survival Status", x = "Age", y = "Count") +
  theme_minimal()

# box plot of age by survival status
ggplot(titanic, aes(x = as.factor(Survived), y = Age, fill = as.factor(Survived))) +
  geom_boxplot(outlier.color = "peru", outlier.shape = 16, outlier.size = 2, notch = TRUE) +
  scale_fill_manual(values = c("lightcoral", "lightgreen"), labels = c("Did Not Survive", "Survived")) +
  labs(title = "Age Distribution of Survivors and Non-Survivors", x = "Survival Status", y = "Age") +
  theme_minimal() +
  theme(legend.position = "none")
# Load required libraries
library(ggplot2)
library(readr)

# Read the COVID-19 time series dataset (assuming the dataset is a CSV file)
covid_data <- read_csv("time-series-19-covid-combined.csv")

# Display the first few rows to understand the structure of the dataset
head(covid_data)

# Convert the 'Date' column to Date format
covid_data$Date <- as.Date(covid_data$Date)

# Summarize the data by date (e.g., sum up confirmed cases globally per date)
daily_summary <- aggregate(Confirmed ~ Date, data = covid_data, sum)

# Create a time series plot using ggplot2
ggplot(daily_summary, aes(x = Date, y = Confirmed)) +
  geom_line(color = "dodgerblue", size = 1.5) +   # Line plot for time series with a thicker line
  labs(title = "Global COVID-19 Confirmed Cases Over Time", 
       x = "Date", 
       y = "Number of Confirmed Cases") +
  theme_minimal(base_size = 15) +  # Increase the font size for better visibility
  theme(
    plot.title = element_text(hjust = 0.5, color = "darkblue", size = 20, face = "bold"),  # Center the title
    axis.title.x = element_text(color = "darkblue", size = 14),
    axis.title.y = element_text(color = "darkblue", size = 14),
    axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate the x-axis labels for better readability
  )

# If you want to save the plot as an image file
ggsave("covid_timeseries_plot.png", width = 10, height = 6, dpi = 300)

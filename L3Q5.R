library(forecast)
library(ggplot2)
library(dplyr)

covid_data <- read.csv("https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv")

# data range
india_covid <- covid_data %>%
  filter(Country.Region == "India" & Date >= "2020-01-22" & Date <= "2020-12-15")

india_covid$Date <- as.Date(india_covid$Date)

# weekly data summary
weekly_data <- india_covid %>%
  group_by(Week = format(Date, "%Y-%U")) %>%
  summarise(Confirmed = max(Confirmed), Deaths = max(Deaths)) %>%
  ungroup()

# time series
total_cases_ts <- ts(weekly_data$Confirmed, start = c(2020, 4), frequency = 52)

# plot total covid cases
ggplot(weekly_data, aes(x = as.Date(paste0(Week, "-1"), "%Y-%U-%u"), y = Confirmed)) +
  geom_line(color = "slategrey", size = 1) +
  labs(title = "Total COVID-19 Cases in India (Weekly, 2020)", x = "Date", y = "Total Cases") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# multivariate
total_deaths_ts <- ts(weekly_data$Deaths, start = c(2020, 4), frequency = 52)
multivariate_ts <- ts(cbind(total_cases_ts, total_deaths_ts))

multivariate_df <- data.frame(
  Date = as.Date(paste0(weekly_data$Week, "-1"), "%Y-%U-%u"),
  Cases = weekly_data$Confirmed,
  Deaths = weekly_data$Deaths
)

ggplot(multivariate_df, aes(x = Date)) +
  geom_line(aes(y = Cases, color = "Total Cases"), size = 1) +
  geom_line(aes(y = Deaths, color = "Total Deaths"), size = 1) +
  labs(title = "COVID-19 Cases and Deaths in India (Weekly, 2020)", x = "Date", y = "Count") +
  scale_color_manual(values = c("Total Cases" = "slategrey", "Total Deaths" = "olivedrab")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), legend.title = element_blank())

# forecast - ARIMA
arima_model <- auto.arima(total_cases_ts)

# values for next 5 weeks
forecasted_values <- forecast(arima_model, h = 5)

forecast_df <- data.frame(
  Date = seq(as.Date("2020-12-15"), by = "week", length.out = 5),
  Forecast = forecasted_values$mean,
  Lower = forecasted_values$lower[,2],
  Upper = forecasted_values$upper[,2]
)

ggplot() +
  geom_line(data = multivariate_df, aes(x = Date, y = Cases), color = "slategrey", size = 1) +
  geom_line(data = forecast_df, aes(x = Date, y = Forecast), color = "olivedrab", size = 1, linetype = "dashed") +
  labs(title = "Forecast of COVID-19 Cases in India (Weekly)", x = "Date", y = "Total Cases") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_ribbon(data = forecast_df, aes(x = Date, ymin = Lower, ymax = Upper), 
              fill = "lightblue", alpha = 0.4)  # Add confidence interval

print(forecasted_values$mean)
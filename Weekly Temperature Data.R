library(ggplot2)
library(reshape2)
data <- data.frame(
  Week = as.Date(c('2023-01-01', '2023-01-01', '2023-01-01',
                   '2023-01-08', '2023-01-08', '2023-01-08',
                   '2023-01-15', '2023-01-15', '2023-01-15')),
  City = c('New York', 'Los Angeles', 'Chicago',
           'New York', 'Los Angeles', 'Chicago',
           'New York', 'Los Angeles', 'Chicago'),
  Temperature = c(-2, 15, -5, 0, 17, -3, 2, 18, -2)
)
data_melted <- melt(data, id.vars = c('Week', 'City'), variable.name = 'Variable', value.name = 'Temperature')
ggplot(data_melted, aes(x = Week, y = Temperature, color = City, group = City)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(title = 'Weekly Average Temperatures of New York, Los Angeles, and Chicago',
       x = 'Week',
       y = 'Average Temperature (°C)') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

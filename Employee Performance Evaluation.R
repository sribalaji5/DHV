library(ggplot2)
data <- data.frame(
  Month = c('Jan', 'Jan', 'Jan', 'Feb', 'Feb', 'Feb', 'Mar', 'Mar', 'Mar'),
  Employee = c('A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C'),
  Score = c(85, 90, 78, 88, 92, 80, 90, 94, 82)
)
ggplot(data, aes(x = Score, fill = Employee)) +
  geom_histogram(binwidth = 2, alpha = 0.7, position = 'dodge') +
  labs(title = 'Monthly Performance Scores of Employees A, B, and C',
       x = 'Performance Score',
       y = 'Frequency') +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3")

library(ggplot2)
library(reshape2)
data <- data.frame(
  Category = c('Product Quality', 'Customer Service', 'Value for Money'),
  Very_Dissatisfied = c(5, 10, 8),
  Dissatisfied = c(15, 20, 12),
  Neutral = c(25, 30, 28),
  Satisfied = c(35, 25, 32),
  Very_Satisfied = c(20, 15, 20)
)
data_melted <- melt(data, id.vars = 'Category', variable.name = 'Rating', value.name = 'Count')
ggplot(data_melted, aes(x = Category, y = Count, fill = Rating)) +
  geom_bar(stat = 'identity') +
  labs(title = 'Customer Satisfaction Survey Results',
       x = 'Category',
       y = 'Count') +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

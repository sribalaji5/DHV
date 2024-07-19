library(ggplot2)
library(hexbin)
data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', 
                   '2023-01-04', '2023-01-05', '2023-01-06', '2023-01-07')),
  Likes = c(150, 200, 250, 300, 350, 400, 450),
  Comments = c(20, 25, 30, 35, 40, 45, 50),
  Shares = c(30, 35, 40, 45, 50, 55, 60)
)
ggplot(data, aes(x = Likes, y = Shares)) +
  geom_hex(bins = 10) +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(title = "Hexbin Plot of Social Media Engagement",
       x = "Likes",
       y = "Shares") +
  theme_minimal()

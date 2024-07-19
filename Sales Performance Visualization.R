library(ggplot2)
library(reshape2)
data <- data.frame(
  Month = c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov'),
  Product_A_Sales = c(500, 600, 700, 800, 750, 850, 900, 950, 1000, 1050, 1100),
  Product_B_Sales = c(300, 320, 350, 400, 420, 450, 480, 500, 550, 580, 600),
  Product_C_Sales = c(200, 250, 300, 350, 400, 420, 450, 470, 500, 530, 550)
)
data_melted <- melt(data, id.vars = 'Month', variable.name = 'Product', value.name = 'Sales')
ggplot(data_melted, aes(x = Product, y = Sales, fill = Product)) +
  geom_violin(trim = FALSE) +
  labs(title = 'Sales Performance of Products A, B, and C Over a Year',
       x = 'Product',
       y = 'Sales') +
  theme_minimal() +
  scale_fill_brewer(palette = "Pastel1")

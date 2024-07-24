library(scatterplot3d)
library(plotly)
data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

cor_matrix <- cor(data[, c("StockPrice", "VolumeTraded", "MarketCap")])
print(cor_matrix)

scatterplot3d(data$VolumeTraded, data$MarketCap, data$StockPrice, pch = 16, color = "blue",
              xlab = "Volume Traded (millions)", ylab = "Market Cap ($)", zlab = "Stock Price ($)",
              main = "3D Scatter Plot: Volume Traded vs. Market Cap vs. Stock Price")

plot_ly(data, x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Volume Traded (millions)"),
    yaxis = list(title = "Market Cap ($)"),
    zaxis = list(title = "Stock Price ($)")
  ),
  title = "3D Surface Plot: Stock Price vs. Volume Traded and Market Cap")

plot_ly(data, x = ~VolumeTraded, y = ~StockPrice, z = ~MarketCap, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Volume Traded (millions)"),
    yaxis = list(title = "Stock Price ($)"),
    zaxis = list(title = "Market Cap ($)")
  ),
  title = "3D Surface Plot: Market Cap vs. Volume Traded and Stock Price")

plot_ly(data, x = ~MarketCap, y = ~StockPrice, z = ~VolumeTraded, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Market Cap ($)"),
    yaxis = list(title = "Stock Price ($)"),
    zaxis = list(title = "Volume Traded (millions)")
  ),
  title = "3D Surface Plot: Volume Traded vs. Market Cap and Stock Price")


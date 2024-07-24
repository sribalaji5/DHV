library(scatterplot3d)
library(plotly)
library(dplyr)

data <- data.frame(
  Product = c("A", "B", "C", "D", "E"),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  AgeGroup = c("25-35", "35-45", "18-25", "45-55", "25-35")
)

data <- data %>%
  mutate(AgeGroupNumeric = case_when(
    AgeGroup == "18-25" ~ 1,
    AgeGroup == "25-35" ~ 2,
    AgeGroup == "35-45" ~ 3,
    AgeGroup == "45-55" ~ 4
  ))

cor_matrix <- cor(data[, c("Price", "Rating", "AgeGroupNumeric")])
print(cor_matrix)

scatterplot3d(data$Price, data$AgeGroupNumeric, data$Rating, pch = 16, color = "blue",
              xlab = "Price ($)", ylab = "Age Group (Encoded)", zlab = "Rating",
              main = "3D Scatter Plot: Price vs. Age Group vs. Rating")

plot_ly(data, x = ~Price, y = ~AgeGroupNumeric, z = ~Rating, type = "scatter3d", mode = "markers",
        marker = list(size = 5, color = ~Rating, colorscale = "Viridis", showscale = TRUE)) %>%
  layout(scene = list(
    xaxis = list(title = "Price ($)"),
    yaxis = list(title = "Age Group (Encoded)"),
    zaxis = list(title = "Rating")
  ),
  title = "3D Scatter Plot: Price vs. Age Group vs. Rating")

plot_ly(data, x = ~Price, y = ~AgeGroupNumeric, z = ~Rating, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Price ($)"),
    yaxis = list(title = "Age Group (Encoded)"),
    zaxis = list(title = "Rating")
  ),
  title = "3D Surface Plot: Rating vs. Price and Age Group")

plot_ly(data, x = ~Price, y = ~Rating, z = ~AgeGroupNumeric, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Price ($)"),
    yaxis = list(title = "Rating"),
    zaxis = list(title = "Age Group (Encoded)")
  ),
  title = "3D Surface Plot: Age Group vs. Price and Rating")

plot_ly(data, x = ~AgeGroupNumeric, y = ~Rating, z = ~Price, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Age Group (Encoded)"),
    yaxis = list(title = "Rating"),
    zaxis = list(title = "Price ($)")
  ),
  title = "3D Surface Plot: Price vs. Age Group and Rating")


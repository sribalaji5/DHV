library(scatterplot3d)
library(plotly)

data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)

cor_matrix <- cor(data[, c("Temperature", "Humidity", "WindSpeed")])
print(cor_matrix)

scatterplot3d(data$WindSpeed, data$Humidity, data$Temperature, pch = 16, color = "blue",
              xlab = "Wind Speed (km/h)", ylab = "Humidity (%)", zlab = "Temperature (°C)",
              main = "3D Scatter Plot: Wind Speed vs. Humidity vs. Temperature")

plot_ly(data, x = ~Humidity, y = ~WindSpeed, z = ~Temperature, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Humidity (%)"),
    yaxis = list(title = "Wind Speed (km/h)"),
    zaxis = list(title = "Temperature (°C)")
  ),
  title = "3D Surface Plot: Temperature vs. Humidity and Wind Speed")

plot_ly(data, x = ~Humidity, y = ~Temperature, z = ~WindSpeed, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Humidity (%)"),
    yaxis = list(title = "Temperature (°C)"),
    zaxis = list(title = "Wind Speed (km/h)")
  ),
  title = "3D Surface Plot: Wind Speed vs. Humidity and Temperature")
plot_ly(data, x = ~WindSpeed, y = ~Temperature, z = ~Humidity, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Wind Speed (km/h)"),
    yaxis = list(title = "Temperature (°C)"),
    zaxis = list(title = "Humidity (%)")
  ),
  title = "3D Surface Plot: Humidity vs. Wind Speed and Temperature")


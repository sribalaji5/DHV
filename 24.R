library(scatterplot3d)
library(plotly)

data <- data.frame(
  Location = c("A", "B", "C", "D", "E"),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2Levels = c(400, 450, 420, 380, 430)
)
cor_matrix <- cor(data[, c("Temperature", "Humidity", "CO2Levels")])
print(cor_matrix)
scatterplot3d(data$Temperature, data$Humidity, data$CO2Levels, pch = 16, color = "blue",
              xlab = "Temperature (°C)", ylab = "Humidity (%)", zlab = "CO2 Levels (ppm)",
              main = "3D Scatter Plot: Temperature vs. Humidity vs. CO2 Levels")
plot_ly(data, x = ~Temperature, y = ~Humidity, z = ~CO2Levels, type = "scatter3d", mode = "markers",
        marker = list(size = 5, color = ~CO2Levels, colorscale = "Viridis", showscale = TRUE)) %>%
  layout(scene = list(
    xaxis = list(title = "Temperature (°C)"),
    yaxis = list(title = "Humidity (%)"),
    zaxis = list(title = "CO2 Levels (ppm)")
  ),
  title = "3D Scatter Plot: Temperature vs. Humidity vs. CO2 Levels")

plot_ly(data, x = ~Temperature, y = ~Humidity, z = ~CO2Levels, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Temperature (°C)"),
    yaxis = list(title = "Humidity (%)"),
    zaxis = list(title = "CO2 Levels (ppm)")
  ),
  title = "3D Surface Plot: CO2 Levels vs. Temperature and Humidity")

plot_ly(data, x = ~Temperature, y = ~CO2Levels, z = ~Humidity, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Temperature (°C)"),
    yaxis = list(title = "CO2 Levels (ppm)"),
    zaxis = list(title = "Humidity (%)")
  ),
  title = "3D Surface Plot: Humidity vs. Temperature and CO2 Levels")

plot_ly(data, x = ~Humidity, y = ~CO2Levels, z = ~Temperature, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Humidity (%)"),
    yaxis = list(title = "CO2 Levels (ppm)"),
    zaxis = list(title = "Temperature (°C)")
  ),
  title = "3D Surface Plot: Temperature vs. Humidity and CO2 Levels")

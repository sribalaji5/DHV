library(scatterplot3d)
library(plotly)
data <- data.frame(
  Student = c("A", "B", "C", "D", "E"),
  MathScore = c(85, 72, 90, 78, 88),
  ScienceScore = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)
cor_matrix <- cor(data[, c("MathScore", "ScienceScore", "Attendance")])
print(cor_matrix)
scatterplot3d(data$MathScore, data$ScienceScore, data$Attendance, pch = 16, color = "blue",
              xlab = "Math Score", ylab = "Science Score", zlab = "Attendance (%)",
              main = "3D Scatter Plot: Math Score vs. Science Score vs. Attendance")
plot_ly(data, x = ~MathScore, y = ~ScienceScore, z = ~Attendance, type = "scatter3d", mode = "markers",
        marker = list(size = 5, color = ~ScienceScore, colorscale = "Viridis", showscale = TRUE)) %>%
  layout(scene = list(
    xaxis = list(title = "Math Score"),
    yaxis = list(title = "Science Score"),
    zaxis = list(title = "Attendance (%)")
  ),
  title = "3D Scatter Plot: Math Score vs. Science Score vs. Attendance")

plot_ly(data, x = ~MathScore, y = ~Attendance, z = ~ScienceScore, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Math Score"),
    yaxis = list(title = "Attendance (%)"),
    zaxis = list(title = "Science Score")
  ),
  title = "3D Surface Plot: Science Score vs. Math Score and Attendance")

plot_ly(data, x = ~MathScore, y = ~ScienceScore, z = ~Attendance, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Math Score"),
    yaxis = list(title = "Science Score"),
    zaxis = list(title = "Attendance (%)")
  ),
  title = "3D Surface Plot: Attendance vs. Math Score and Science Score")

plot_ly(data, x = ~Attendance, y = ~ScienceScore, z = ~MathScore, type = "mesh3d") %>%
  layout(scene = list(
    xaxis = list(title = "Attendance (%)"),
    yaxis = list(title = "Science Score"),
    zaxis = list(title = "Math Score")
  ),
  title = "3D Surface Plot: Math Score vs. Attendance and Science Score")

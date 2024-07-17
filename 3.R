library(ggplot2)

ypdata <- data.frame(
  Year = 2010:2014,
  Population = c(1000, 1020, 1040, 1060, 1080)
)

ggplot(ypdata, aes(x = Year, y = Population)) +
  geom_line(color = "orange", size = 1) +
  geom_point(color = "yellow", size = 3) +
  labs(
    title = "Year vs. Population",
    x = "Year",
    y = "Population (millions)"
  ) +
  theme_minimal()


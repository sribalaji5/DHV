library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)

data <- data.frame(
  Customer_ID = 1:30,
  Age = c(35, 28, 42, 25, 38, 45, 23, 34, 40, 30, 29, 50, 32, 47, 36, 27, 41, 33, 39, 26, 48, 31, 44, 37, 43, 24, 46, 49, 21, 22),
  Gender = c('Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female'),
  Purchase_Amount = c(100, 80, 120, 90, 110, 150, 60, 130, 95, 85, 70, 160, 75, 140, 115, 65, 125, 135, 105, 95, 145, 90, 120, 125, 130, 85, 155, 140, 50, 60),
  Membership_Level = c('Gold', 'Silver', 'Bronze', 'Bronze', 'Silver', 'Gold', 'Silver', 'Gold', 'Bronze', 'Silver', 'Bronze', 'Gold', 'Silver', 'Bronze', 'Gold', 'Silver', 'Bronze', 'Gold', 'Silver', 'Bronze', 'Gold', 'Silver', 'Bronze', 'Gold', 'Silver', 'Bronze', 'Gold', 'Silver', 'Bronze', 'Silver')
)

sum(is.na(data))

data$Gender <- as.factor(data$Gender)
data$Membership_Level <- as.factor(data$Membership_Level)

summary(data)

ggplot(data, aes(x=Age)) + 
  geom_histogram(binwidth=5, fill="blue", color="black", alpha=0.7) + 
  labs(title="Age Distribution", x="Age", y="Count")

ggplot(data, aes(x=Gender)) + 
  geom_bar(fill="green", color="black", alpha=0.7) + 
  labs(title="Gender Distribution", x="Gender", y="Count")

ggplot(data, aes(x=Age, y=Purchase_Amount)) + 
  geom_point(aes(color=Gender), size=3) + 
  labs(title="Purchase Amount by Age", x="Age", y="Purchase Amount")

ggplot(data, aes(x=Membership_Level, y=Purchase_Amount, fill=Membership_Level)) + 
  geom_boxplot() + 
  labs(title="Purchase Amount by Membership Level", x="Membership Level", y="Purchase Amount")

plot_ly(data, x = ~Age, y = ~Purchase_Amount, z = ~as.numeric(Membership_Level), color = ~Membership_Level, type = "scatter3d", mode = "markers") %>%
  layout(scene = list(xaxis = list(title = 'Age'),
                      yaxis = list(title = 'Purchase Amount'),
                      zaxis = list(title = 'Membership Level')))

ggplot(data, aes(x=Gender, y=Purchase_Amount, fill=Gender)) + 
  geom_boxplot() + 
  labs(title="Purchase Amount by Gender", x="Gender", y="Purchase Amount")

ggplot(data, aes(x=Age, y=Purchase_Amount, color=Membership_Level)) + 
  geom_line() + 
  labs(title="Purchase Amount by Age and Membership Level", x="Age", y="Purchase Amount")


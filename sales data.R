library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)

data <- data.frame(
  Store_ID = 1:48,
  Region = c(rep('North', 12), rep('South', 12), rep('East', 12), rep('West', 12)),
  Month = rep(c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'), 4),
  Total_Sales = c(10000, 15000, 12000, 13000, 9000, 16000, 14000, 11000, 11000, 17000, 13000, 15000, 12000, 18000, 16000, 14000, 13000, 19000, 15000, 16000, 14000, 20000, 17000, 15000, 15000, 21000, 16000, 14000, 16000, 22000, 13000, 15000, 12000, 18000, 16000, 14000, 13000, 19000, 15000, 16000, 14000, 20000, 17000, 15000, 15000, 21000, 16000, 14000),
  Number_Of_Customers = c(500, 700, 600, 650, 450, 800, 700, 550, 550, 850, 650, 750, 600, 900, 800, 700, 650, 950, 750, 800, 700, 1000, 850, 750, 750, 1050, 800, 700, 800, 1100, 650, 750, 600, 900, 800, 700, 650, 950, 750, 800, 700, 1000, 850, 750, 750, 1050, 800, 700),
  Average_Transaction_Value = c(20, 21.43, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20)
)

sum(is.na(data))

data$Region <- as.factor(data$Region)
data$Month <- factor(data$Month, levels = c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'))

summary(data)

sales_by_region <- data %>% group_by(Region) %>% summarize(Total_Sales = sum(Total_Sales), .groups = 'drop')
ggplot(sales_by_region, aes(x=Region, y=Total_Sales, fill=Region)) + 
  geom_bar(stat='identity') + 
  labs(title="Total Sales by Region", x="Region", y="Total Sales")

sales_by_month <- data %>% group_by(Month) %>% summarize(Total_Sales = sum(Total_Sales), .groups = 'drop')
ggplot(sales_by_month, aes(x=Month, y=Total_Sales, fill=Month)) + 
  geom_bar(stat='identity') + 
  labs(title="Total Sales by Month", x="Month", y="Total Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data, aes(x=Total_Sales)) + 
  geom_histogram(binwidth=1000, fill="blue", color="black", alpha=0.7) + 
  labs(title="Distribution of Total Sales", x="Total Sales", y="Count")

customers_by_month <- data %>% group_by(Month) %>% summarize(Number_Of_Customers = sum(Number_Of_Customers), .groups = 'drop')
ggplot(customers_by_month, aes(x=Month, y=Number_Of_Customers, fill=Month)) + 
  geom_bar(stat='identity') + 
  labs(title="Number of Customers by Month", x="Month", y="Number of Customers") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

mean_avg_trans <- mean(data$Average_Transaction_Value)
median_avg_trans <- median(data$Average_Transaction_Value)
sd_avg_trans <- sd(data$Average_Transaction_Value)

cat("Mean Average Transaction Value:", mean_avg_trans, "\n")
cat("Median Average Transaction Value:", median_avg_trans, "\n")
cat("Standard Deviation Average Transaction Value:", sd_avg_trans, "\n")

ggplot(data, aes(x=Month, y=Total_Sales, group=Region, color=Region)) + 
  geom_line() + 
  geom_point() + 
  labs(title="Trendline of Sales by Region", x="Month", y="Total Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

seasonal_sales <- data %>% group_by(Region, Month) %>% summarize(Total_Sales = sum(Total_Sales), .groups = 'drop')
ggplot(seasonal_sales, aes(x=Month, y=Total_Sales, group=Region, color=Region)) + 
  geom_line() + 
  geom_point() + 
  labs(title="Seasonal Sales by Region", x="Month", y="Total Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data, aes(x=Number_Of_Customers, y=Total_Sales, color=Region)) + 
  geom_point(size=3) + 
  geom_smooth(method="lm", se=FALSE) + 
  labs(title="Region-Based Sales Over Number of Customers", x="Number of Customers", y="Total Sales")

plot_ly(data, x = ~Number_Of_Customers, y = ~Total_Sales, z = ~Average_Transaction_Value, color = ~Region, type = "scatter3d", mode = "markers") %>%
  layout(scene = list(xaxis = list(title = 'Number of Customers'),
                      yaxis = list(title = 'Total Sales'),
                      zaxis = list(title = 'Average Transaction Value')))

ggplot(sales_by_region, aes(x=Region, y=Total_Sales, fill=Region)) + 
  geom_bar(stat='identity') + 
  labs(title="Total Sales by Region", x="Region", y="Total Sales")

ggplot(sales_by_month, aes(x=Month, y=Total_Sales, fill=Month)) + 
  geom_bar(stat='identity') + 
  labs(title="Total Sales by Month", x="Month", y="Total Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data, aes(x=Total_Sales)) + 
  geom_histogram(binwidth=1000, fill="blue", color="black", alpha=0.7) + 
  labs(title="Distribution of Total Sales", x="Total Sales", y="Count")

ggplot(customers_by_month, aes(x=Month, y=Number_Of_Customers, fill=Month)) + 
  geom_bar(stat='identity') + 
  labs(title="Number of Customers by Month", x="Month", y="Number of Customers") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data, aes(x=Month, y=Total_Sales, group=Region, color=Region)) + 
  geom_line() + 
  geom_point() + 
  labs(title="Trendline of Sales by Region", x="Month", y="Total Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(seasonal_sales, aes(x=Month, y=Total_Sales, group=Region, color=Region)) + 
  geom_line() + 
  geom_point() + 
  labs(title="Seasonal Sales by Region", x="Month", y="Total Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data, aes(x=Number_Of_Customers, y=Total_Sales, color=Region)) + 
  geom_point(size=3) + 
  geom_smooth(method="lm", se=FALSE) + 
  labs(title="Region-Based Sales Over Number of Customers", x="Number of Customers", y="Total Sales")



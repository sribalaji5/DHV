library(ggplot2)

whdata <- data.frame(
  Weight=c(60,65,70,72,75),
  Height=c(170,175,168,180,178)
)
ggplot(whdata,aes(x=Weight,y=Height))+
  geom_point(color="brown",size=3)+
  labs(title="Weight vs Height",
       x="Weight(kg)",
       y="Height(cm)")+
  theme_minimal()



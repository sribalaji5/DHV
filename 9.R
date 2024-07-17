sgd <- data.frame(
  Group = c("X", "X", "X", "X", "Y", "Y", "Y", "Y"),
  Score = c(80, 85, 78, 92, 88, 76, 80, 84)
)
ggplot(sgd,aes(x=Group,y=Score,fill=Group))+
  geom_violin(fill = "orange")+
  labs(title="Class score",
       x="Group",
       y="Scores")+
  theme_minimal()


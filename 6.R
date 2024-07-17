market <- data.frame(
  Company=c("A","B","C","D"),
  MarketShare=c(20,30,25,25)
)

ggplot(market,aes(x="",y=MarketShare,fill=Company))+
  geom_bar(stat="identity",width=1)+
  coord_polar("y")+
  labs(title="Market Share by Company",
       x=NULL,
       y=NULL)+
  theme_void()+
  theme(legend.position = "right")


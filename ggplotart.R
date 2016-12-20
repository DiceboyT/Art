library(ggplot2)

## HOT AND COLD

data <- data.frame(x = runif(99999), y = runif(99999), z = rep(1:3,33333))
data2 <- data.frame(x = runif(99999), y = runif(99999)+1, z = rep(4:6,33333))
data3 <- data.frame(x = runif(99999)+1, y = runif(99999), z = rep(4:6,33333))
data4 <- data.frame(x = runif(99999)+1, y = runif(99999)+1, z = rep(1:3,33333))

poly <- data.frame(x = c(0,0,2,2), y = c(0,2,2,0))

vline <- data.frame(x = c(1,1), y = c(2,0))
hline <- data.frame(x = c(2,0), y = c (1,1))

df <- rbind(data,data2,data3,data4)

ggplot(df, aes(x,y,col=factor(z)))+
  geom_point(alpha = .5, shape = 16, size = 2)+
  theme_void()+
  scale_color_manual(values = c("red","orange","yellow","green","blue","purple"), guide = "none")+
  geom_line(data = hline, aes(x,y), col = "black", size = 3)+
  geom_line(data = vline, aes(x,y), col = "black", size = 3)+
  geom_polygon(data = poly, aes(x,y), col = "white", fill = NA, size = 4)

# BULLSEYE

data <- data.frame(x = c(0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,0,
                         0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1,0), 
                   y = c(0,0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,
                         0,0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1),
                   z = rep(1:10, each = 4))

data2 <- data.frame(x = -c(0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,0,
                          0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1,0), 
                    y = c(0,0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,
                          0,0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1),
                    z = rep(1:10, each = 4))

data3 <- data.frame(x = c(0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,0,
                           0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1,0), 
                    y = -c(0,0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,
                          0,0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1),
                    z = rep(1:10, each = 4))

data4 <- data.frame(x = -c(0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,0,
                           0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1,0), 
                    y = -c(0,0,10,10,0,0,9,9,0,0,8,8,0,0,7,7,0,0,6,6,
                          0,0,5,5,0,0,4,4,0,0,3,3,0,0,2,2,0,0,1,1),
                    z = rep(1:10, each = 4))

data <- rbind(data,data2,data3,data4)

ggplot(data, aes(x,y, fill = z, group = z))+
  geom_polygon(col = "white")+
  theme_void()+
  guides(fill = "none")+
  scale_fill_gradient2(low = "red", mid = "blue", high = "red")

# rainbow

data <- data.frame(x = rep(1:10,1000), y = rep(1:1000,each=10), z=rep(1:1000,each=10))

ggplot(data,aes(x,y,group=z, col=factor(z)))+
  geom_line()+
  scale_color_discrete(c=230,l=80,guide = F)+
  theme_void()

# mondrian

df <- data.frame(x1 = round(runif(100,0,5)), 
                 x2 = round(runif(100,0,5)),
                 y1 = round(runif(100,0,5)),
                 y2 = round(runif(100,0,5)),
                 col = factor(round(runif(100,0,5))))

ggplot(df,aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2, fill=col)) + 
  geom_rect(col="black",size = 2)+
  scale_fill_manual(values=c("blue","black","red","yellow","white","white"),guide=F)+
  theme_void()

# rothko

specs <- data.frame(x = c(0,100,100,0), y = c(0,0,120,120))

cloud1 <- data.frame(x = runif(1000,8,92), y = runif(1000,73,112))

cloud2 <- data.frame(x = runif(1000,8,92), y = runif(1000,8,47))

middle <-  data.frame(x = runif(600,8,92), y = runif(600,60,60))

ggplot(specs, aes(x,y))+
  geom_polygon(fill = "red")+
  geom_point(data = cloud1, aes(x,y), col = "darkred", size = 13, alpha = .15, shape = 16) +
  geom_point(data = cloud2, aes(x,y), col = "darkred", size = 13, alpha = .15, shape = 16) +
  geom_jitter(data = middle, aes(x,y), col = "gold", size = 10, alpha = .15, shape = 16,
              width = 10, height = 10) +
  theme_void()

# pollock

specs<- data.frame(x = c(7,10,10,7), y = c(100,100,120,120))

data <- data.frame(x=rep(1:10,1000),
                   y=runif(10000,0,150),
                   z = rep(1:1000, each = 10))

data2 <- data.frame(x = c(runif(18,8,8.5),
                          runif(18,8.5,9),
                          runif(18,8,8.5),
                          runif(18,8.5,9)),
                    y = c(runif(18,105,110),
                          runif(18,105,110),
                          runif(18,110,115),
                          runif(18,110,115)),
                    z = rep(1:24,each=3))

poly <- data.frame(x = c(runif(15,8,8.5),
                         runif(15,8.5,9)),
                   y = runif(30,105,115),
                   z = c(rep(1,7),
                         rep(2,8),
                         rep(3,7),
                         rep(4,8)))

ggplot(specs, aes(x,y))+
  geom_polygon(fill = "beige")+
  geom_smooth(data = data2, aes(x,y,group=z), se=F, size = 2,col="black")+
  geom_smooth(data = data, aes(x,y,col=z,group=z),se=F)+
  coord_cartesian(xlim = c(8,9),
                  ylim=c(105,115))+
  scale_color_gradient(high="blue",low="green",guide=F)+
  geom_polygon(data=poly, aes(x,y,fill=z,group=z),alpha=.4)+
  scale_fill_gradient(high = "red", low = "orange", guide = F)+
  theme_void()














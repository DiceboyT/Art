library(shiny)
library(ggplot2)

server <- function(input, output) {
  
  data_mondrian <- eventReactive(input$go_mondrian,{
    data_mondrian <- data.frame(x1 = round(runif(100,0,5)), 
                                x2 = round(runif(100,0,5)),
                                y1 = round(runif(100,0,5)),
                                y2 = round(runif(100,0,5)),
                                col = factor(round(runif(100,0,5))))
  })
  
  rothko_cloud1 <- eventReactive(input$go_rothko,{
    rothko_cloud1 <- data.frame(x = runif(1000,8,92), y = runif(1000,73,112))
  })
  
  rothko_cloud2 <- eventReactive(input$go_rothko,{
    rothko_cloud2 <- data.frame(x = runif(1000,8,92), y = runif(1000,8,47))
  })
  
  rothko_middle <- eventReactive(input$go_rothko,{
    rothko_middle <-  data.frame(x = runif(600,8,92), y = runif(600,60,60))
  })
  
  specs_rothko <- data.frame(x = c(0,100,100,0), y = c(0,0,120,120))
  
  data_pollock1 <- eventReactive(input$go_pollock,{
    data_pollock1 <- data.frame(x=rep(1:10,1000),
                       y=runif(10000,0,150),
                       z = rep(1:1000, each = 10))
  })
  
  data_pollock2 <- eventReactive(input$go_pollock,{
    data_pollock2 <- data.frame(x = c(runif(18,8,8.5),
                              runif(18,8.5,9),
                              runif(18,8,8.5),
                              runif(18,8.5,9)),
                        y = c(runif(18,105,110),
                              runif(18,105,110),
                              runif(18,110,115),
                              runif(18,110,115)),
                        z = rep(1:24,each=3))
  })
  
  data_pollock3 <- eventReactive(input$go_pollock,{
    data_pollock3 <- data.frame(x = c(runif(15,8,8.5),
                             runif(15,8.5,9)),
                       y = runif(30,105,115),
                       z = c(rep(1,7),
                             rep(2,8),
                             rep(3,7),
                             rep(4,8)))
  })
  
  specs_pollock <- data.frame(x = c(7,10,10,7), y = c(100,100,120,120))
  
  output$mondrian <- renderPlot({
    ggplot(data_mondrian(),aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2, fill=col)) + 
      geom_rect(col="black",size = 2)+
      scale_fill_manual(values=c("blue","black","red","yellow","white","white"),guide=F)+
      theme_void()
  })
  
  output$rothko <- renderPlot({
    ggplot(specs_rothko, aes(x,y))+
      geom_polygon(fill = isolate(input$background))+
      geom_point(data = rothko_cloud1(), aes(x,y), col = isolate(input$cloud1), size = 13, alpha = .15, shape = 16) +
      geom_point(data = rothko_cloud2(), aes(x,y), col = isolate(input$cloud2), size = 13, alpha = .15, shape = 16) +
      geom_jitter(data = rothko_middle(), aes(x,y), col = isolate(input$middle), size = 10, alpha = .15, shape = 16,
                  width = 10, height = 10) +
      theme_void()
  })
  
  output$pollock <- renderPlot({
    ggplot(specs_pollock, aes(x,y))+
      geom_polygon(fill = "beige")+
      geom_smooth(data = data_pollock2(), aes(x,y,group=z), se=F, size = 2,
                  col= isolate(input$pollock1))+
      geom_smooth(data = data_pollock1(), aes(x,y,col=z,group=z),se=F)+
      coord_cartesian(xlim = c(8,9),
                      ylim=c(105,115))+
      scale_color_gradient(high=isolate(input$pollock2),
                           low=isolate(input$pollock3),guide=F)+
      geom_polygon(data=data_pollock3(), aes(x,y,fill=z,group=z),alpha=.4)+
      scale_fill_gradient(high = isolate(input$pollock4), 
                          low = isolate(input$pollock5), guide = F)+
      theme_void()
  })
  
   
}


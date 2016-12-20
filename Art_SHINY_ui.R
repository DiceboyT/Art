library(shiny)
library(ggplot2)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("cosmo"),
  titlePanel("Abstract Art Recreations"),
    tabsetPanel(
      
      tabPanel("Mondrian", 
               
               sidebarPanel(width = 2,
               
               actionButton("go_mondrian","Create")
               
               ),
               
               mainPanel(
               
               plotOutput("mondrian",width = "87%", height="500px")
               
               )
               
               ),
      
      tabPanel("Rothko",
               
               sidebarPanel(width = 2,
               
               textInput("background", 
                         label = "Background Color"),
               
               textInput("cloud1",
                          label="Upper Cloud Color"),
               
               textInput("cloud2",
                          label="Lower Cloud Color"),
               
               textInput("middle",
                          label="Middle Color"),
               
               actionButton("go_rothko","Create")
               
               ),
               
               mainPanel(
               
               plotOutput("rothko",width="40%")
               
               )
               
               ),
      
      tabPanel("Pollock", 
               
               sidebarPanel(width = 2,
               
               textInput("pollock1",
                          label="Thick Lines Color"),
               
              textInput("pollock2",
                          label="Thin Lines Color (1)"),
               
              textInput("pollock3",
                          label="Thin Lines Color (2)"),
              
              textInput("pollock4",
                           label="Polygon Color (1)"),
              
              textInput("pollock5",
                           label="Polygon Color (2)"),
              
              actionButton("go_pollock", "Create")
              
              ),
              
              mainPanel(
               
              plotOutput("pollock",width = "95%",height="500px")
              
              )
              
              )
  )
)







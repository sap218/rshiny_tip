# 20130123
# lets say you are designing a shiny app, you want a navbar system and each tab should have a set of params to play with the data
# however you want a main [left] sidebar panel to be static
# perhaps the left main sidebar panel will have some data filtering (e.g. filter by only red cars and ignore blue/yellow cars)
# and so the tabs could show different plots and each tab's sidebar panel has options to play with the plot (e.g. choosing the x / y axis for that particular plot)

# UI ---------

ui <- fluidPage(
  theme = shinytheme("superhero"), # https://rstudio.github.io/shinythemes/ - go find a theme that speaks to you!
  
  titlePanel("Example title for whole application"),
  
  fluidRow(
    column(2,
           helpText("Data sorting"),

               # Data filtering parameters ----
               sliderInput(inputId="rangeage", label="Age range:",
                           value=c(0,100),
                           min=0, max=100)
    ), # end of col 2
    
    column(10,
           navbarPage("Navigation",
                      
                      tabPanel("Numerical",
                               sidebarLayout(
                                 position = "right",
                                 sidebarPanel(
                                   helpText("Features"),
                                   textInput(inputId="xaxis", label="Feature (x):", placeholder="AGE"),    
                                   textInput(inputId="yaxis", label="Feature (y):", placeholder="HEIGHT"), 
                                 ),
                                 mainPanel(
                                   plotOutput("scatterplot")
                                 ) # end of main panel
                               ) # end of panel layout
                      ), # end of numeric panel
                      
                      
                      tabPanel("Other panel",
                        # here is an example of a tab with no inner panel (if you want that)
                      ) # end of other tab panel
                      
           ) # end of navbar
    ) # end of col 10
  ) # end of fluid rows
) # end of fluid page

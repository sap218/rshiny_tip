# 20130123
# scenario: as a data scientist, i had members of the statistical team ask for a way to quickly view some nice tables/plots of their results
# HOWEVER, all data was clinical and stored on the server - instead of creating a new script each time: reading in csv files, creating ggplots, i designed an RShiny app for generic basic use
# i could not find much information online about server access, and rather only upload functions 
# the purpose of this code allows for users to type in a file path, and the script retrieves the data from the server which the same app is ran 

# UI ---------

# the example below could be a user typing/coping in /serverdata/clinicalstudies/output/baseline_results.csv 
textInput(inputId="userpathfile", label="Path to file:")

# SERVER ---------
# make input data reactive: this way any preprocessing can be done here before returning file

dataFrame <- reactive({
  req(input$userpathfile) 

  tryCatch(
    {
      df <- read.csv(input$userpathfile,
                     header = TRUE,
                     sep = input$sep)
    },
    error = function(e) { stop(safeError(e)) # return a safeError if a parsing error occurs
    }
  )

  # perhaps here you would like to do some data cleaning

  return(df)
}) # end of reactive

# below is important: call in the data via calling the reactive function (above)
output$maincontent <- renderTable({
  req(input$userpathfile)
  df <- dataFrame()
  head(df, n=50)
})

# BACK TO UI ---------

# to have this in a mainPanel()
div(tableOutput("maincontent"), style="font-size:70%", width="60%")

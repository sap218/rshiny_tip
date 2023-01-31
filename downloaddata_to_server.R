# 20130123
# scenario: you are using a shiny applicaiton to explore some data and made a nice table, but oh no! the data is not allowed to be downloaded on only allowed on the server
# what do you do? (p.s. this may be due to handling clinical data)
# what you do is this:
# another p.s. imagine you used the brushed points on a scatter plot to create a table of some outliers

# SERVER ---------

selectedData <- reactive({
  df_todownload <- brushedPoints(df, input$plot_brush, xvar=input$xaxis, yvar=input$yaxis)
  write.csv(df_todownload,
            paste0("/serverdata/rshinyapp/derived_brushed_tables/", format(Sys.Date(), format="%Y%m%d"), "_", input$downloadCaption, "_", userid, '.csv'),
            sep='', row.names=FALSE)
})
output$downloadData <- downloadHandler(
  filename = function() { 
    paste0("/serverdata/rshinyapp/derived_brushed_tables/", format(Sys.Date(), format="%Y%m%d"), "_", input$downloadCaption, "_", userid, '.csv'),
  content = function(file) {
    selectedData()
  }
) 

# UI ---------
userid <- Sys.getenv("USER") # at the top

# to be in a mainPanel()
textInput(inputId="downloadCaption", label="Name output file"),
downloadButton('downloadData', 'Save to server', icon=shiny::icon("cloud"))

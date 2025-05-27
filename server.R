library(shiny)
library(wordcloud)
library(tm)
library(ggplot2)  

shinyServer(function(input, output, session) {
  final_data <- read.csv("final_data.csv")
  
  output$wordcloud <- renderPlot({
    validate(
      need(input$year >= 1980 && input$year <= 2016, "Year must be between 1980 and 2016")
    )
    vgsales_year <- subset(final_data, Year == input$year)
    sales_by_genre <- aggregate(NA_Sales ~ Genre, data = vgsales_year, sum)
    
    if (nrow(sales_by_genre) > 0) {
      wordcloud(words = sales_by_genre$Genre, freq = sales_by_genre$NA_Sales,
                min.freq = 1,
                scale = c(6, 0.5),
                random.order = FALSE,
                rot.per = 0.1,
                colors = rainbow(20))
    } else {
      print(paste("No data available for the year", input$year))
    }
  })
  
  output$genrePlot <- renderPlot({
    validate(
      need(length(input$selectedGenres) > 0, "Please select at least one genre.")
    )
    
    filtered_data <- subset(final_data, Genre %in% input$selectedGenres & Year >= 1980 & Year <= 2016)
    sales_summary <- aggregate(NA_Sales ~ Year + Genre, data = filtered_data, sum)
    
    ggplot(sales_summary, aes(x = Year, y = NA_Sales, color = Genre, group = Genre)) +
      geom_line() +
      geom_point() +
      theme_minimal() +
      scale_x_continuous(breaks = seq(1980, 2016, by = 1)) +
      labs(title = "Sales by Genre over Years",
           x = "Year",
           y = "Sales in North America (Millions)",
           color = "Genre") + 
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
  })
})
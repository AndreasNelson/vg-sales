library(shiny)
library(shinythemes) # Load the shinythemes package

fluidPage(
  theme = shinytheme("darkly"), # Apply dark theme
  
  div(style = "padding-left: 200px; padding-right: 200px; padding-bottom: 200px;",
      titlePanel("Video Game Sales Data Analysis"),
      
      # Context Section (formerly "Context" tab)
      fluidRow(
        column(
          6,
          h3("Goal"),
          h5(
            "The objective of this project is to gather data of the most popular video game genres in North America, and visually represent the data in a more informative way. I was most interested in trends of the popularity of video game genres in North America and how they change over time. The popularity of a genre was determined by the number of games sold in North America (in millions). To display my data, I used word clouds to display the most popular genres for any given year in the data set, and I used a line graph to compare the popularity of different given genres across the entire dataset"
          )
        ),
        column(
          6,
          h3("The Data"),
          h5(
            "The data was originally collected by Gregory Smith. The dataset was created using a webscraper to catalog popular video games released between 1980 and 2016 from vgchartz.com. Any game in that time period with over 100,000 copies sold was added to the dataset, and the CSV file was uploaded to kaggle.com in 2017. The dataset contains many variables, but for this study all variables except for title, Genre, Year, and North American Sales were dropped from the dataset. All titles with missing year information were ommitted as well, and titles that were released across multiple platforms had their sales numbers consolidated. These modifactions resulted in the loss of around 2% of the entries in the dataset."
          )
        )
      ),
      
      hr(),
      
      # Details Section (formerly "Details" tab)
      h3("Sales by Genre per Year"),
      fluidRow(
        column(
          # Adjusted column width for checkbox group
          3,
          checkboxGroupInput(
            "selectedGenres",
            "Select Genres:",
            choices = c(
              "Action",
              "Adventure",
              "Fighting",
              "Platform",
              "Puzzle",
              "Racing",
              "Role-Playing",
              "Shooter",
              "Simulation",
              "Sports",
              "Strategy"
            ),
            selected = "Action"
          )
        ),
        column(
          9,
          plotOutput("genrePlot", width = "100%", height = "400px")
        )
      ),
      
      hr(), # Optional: adds a horizontal line for separation
      

      h3("Genre Popularity Word Cloud by Year"), 
      sidebarLayout(
        sidebarPanel(
          sliderInput(
            "year",
            "Select Year:",
            min = 1980,
            max = 2016,
            value = 1990,
            step = 1
          )
        ),
        mainPanel(
          plotOutput("wordcloud", width = "100%", height = "400px")
        )
      )
  ) # Close the div wrapper for padding
)
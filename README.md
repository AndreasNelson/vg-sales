# vg-sales

## Project Overview

This is an R-based Shiny web application that provides interactive visualizations of video game sales data by genre from 1980 to 2020. It was developed as the final project for an introductory data science course.

## Project Goals

The main goals of this project were:

*   To analyze trends in the popularity of different video game genres in North America over time.
*   To provide users with an interactive way to explore and visualize the data.
*   To gain experience with data manipulation, visualization, and Shiny app development in R.

## Data Source

The data used in this project was originally collected by Gregory Smith and is available on Kaggle. The dataset was created using a web scraper to catalog popular video games released between 1980 and 2016 from vgchartz.com.

## Data Cleaning and Preprocessing

The original dataset underwent the following cleaning and preprocessing steps:

*   Irrelevant variables were removed, keeping only the title, genre, year, and North American sales figures.
*   Entries with missing year information were omitted.
*   Sales figures for titles released across multiple platforms were consolidated.

## Application Features

This Shiny web application provides two main interactive features:

*   **Word Clouds:** Users can select a year using a slider and visualize the popularity of different genres in that year using a word cloud. The size of each word in the word cloud corresponds to the total sales of games in that genre for the selected year.
*   **Line Graph:** Users can select multiple genres using checkboxes and visualize the sales trends of those genres over time using a line graph. This allows for easy comparison of the popularity of different genres across the entire dataset.

## Technologies Used

*   R
*   Shiny
*   wordcloud
*   tm
*   ggplot2

## How to Run the Application

1.  Clone this repository to your local machine.
2.  Make sure you have the required R packages installed (`shiny`, `wordcloud`, `tm`, `ggplot2`).
3.  Open the `ui.R` and `server.R` files in RStudio.
4.  Run the Shiny app by clicking the "Run App" button in RStudio.

## Future Improvements

Potential future improvements for this project include:

*   Adding more interactive features, such as filtering by platform or publisher.
*   Incorporating more data sources to enrich the analysis.
*   Improving the user interface and design of the application.
*   Deploying the application online for easier access.

## Project Status

This project is currently considered complete as it fulfilled the requirements of the data science course final project. However, there is always room for further development and improvement.

## Contact

If you have any questions or suggestions regarding this project, feel free to contact [Your Name] at [Your Email Address].
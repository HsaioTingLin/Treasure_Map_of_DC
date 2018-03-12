library(shiny)
library(leaflet)
library(shinydashboard)


header <- dashboardHeader(
  title = "Treasure Map of DC"
)


body <- dashboardBody(
  fluidRow(
    column(4,
           wellPanel(helpText("Note: Information shown in this application does not include",
                              "neighborhoods/artists/art works",
                              "that have less than 5 pieces of art work.")),
           wellPanel(
             selectInput(inputId = "top_5_variable", 
                         label = "Choose a variable to summarize",
                         choices = list("ARTIST", 
                                        "ART_TYPE",
                                        "NEIGHBORHOOD",
                                        "MEDIUM"),
                         selected = "NEIGHBORHOOD"),
             hr(),
             radioButtons("For_Neighborhood",
                          label = "Neighborhood Map -- Choose a neighborhood to show on the map and art work information table",
                          choices = list("Anacostia",
                                         "shaw",
                                         "Downtown",
                                         "columbia heights",
                                         "Southwest Waterfront",
                                         "columbia heights",
                                         "old city",
                                         "dupont circle",
                                         "saint elizabeth's",
                                         "Capitol Hill",
                                         "congress heights",
                                         "adams morgan"),
                          selected = "Anacostia")
           ),
           
           wellPanel(
             selectInput(inputId = "For_Artist", 
                         label = "Artist Map -- Choose an artist to show on the map and art work information table",
                         choices = list("Lize Mogel", 
                                        "Wilfredo Valladares",
                                        "Byron Peck",
                                        "Words, Beats and Life",
                                        "Cheryl Foster",
                                        "Floating Lab Collective",
                                        "Walter Kravitz"),
                         selected = "Lize Mogel")
           ),
           
           wellPanel(
             selectInput(inputId = "For_Art_Type", 
                         label = "Art Type Map -- Choose an art type to show on the map and art work information table",
                         choices = list("Mural", 
                                        "Sculpture",
                                        "Installation",
                                        "Tour",
                                        "Sculpture, Installation",
                                        "Performance",
                                        "Lecture"),
                         selected = "Sculpture")
           ),
           
           
           
           wellPanel(
             radioButtons(inputId = "Artist_for_total_map",
                          label = "Total Map -- Choose an artist and art type to show on the map and art work information table",
                          choices = list("Lize Mogel",
                                         "Wilfredo Valladares",
                                         "Byron Peck",
                                         "Words, Beats and Life",
                                         "Cheryl Foster",
                                         "Floating Lab Collective",
                                         "Walter Kravitz"),
                          selected = "Byron Peck"),
             
             uiOutput("for_artist_total")
           )
           
    ),
    
    column(8,
           tabsetPanel(
             tabPanel(title = "Summary & Neighborhood Map", tableOutput("Top5Table"), 
                      h2(textOutput(outputId = "sayNeighborhoodMap")), 
                      leafletOutput(outputId = "MapSummary3"),
                      h2(textOutput(outputId = "sayNeighborhoodTable")),
                      tableOutput("VariableTable3")),
             
             tabPanel(title = "Artist Map", h2(textOutput(outputId = "count")), 
                      leafletOutput(outputId = "MapSummary"), 
                      tableOutput("VariableTable"), tableOutput("VariableTable1_2")),
             
             tabPanel(title = "Art Type Map", h2(textOutput(outputId = "count2")), 
                      leafletOutput(outputId = "MapSummary2"), 
                      tableOutput("VariableTable2"), tableOutput("VariableTable2_2")),
             
             
             tabPanel(title = "Total Map", h2(textOutput(outputId = "count5")), 
                      leafletOutput(outputId = "MapSummary5"), 
                      tableOutput("VariableTable5")) 
           )
           
    )
  )
)

dashboardPage(
  header,
  dashboardSidebar(disable = TRUE),
  body
)
library(shiny)
shinyUI(pageWithSidebar(
    headerPanel(h3('Predicting Concrete Strength based on its Mixture')),
                 
    sidebarPanel(
        sliderInput('cement', 'Cement (kg/m3)', 272, min = 0, max = 600, step =0.5),
        sliderInput('slag', 'Blast Furnace Slag (kg/m3)', 22, min = 0, max = 400, step =0.5),
        sliderInput('flyash', 'Fly Ash (kg/m3)', 100, min = 0, max = 300, step =0.5),
        sliderInput('water', 'Water (kg/m3)', 180, min = 0, max = 300, step =0.5),
        sliderInput('plasticizer', 'Superplasticizer (kg/m3)', 6, min = 0, max = 50, step =0.5),
        sliderInput('coarse', 'Coarse Aggregate (kg/m3)', 800, min = 100, max = 1300, step =0.5),
        sliderInput('fine', 'Fine Aggregate (kg/m3)', 970, min = 400, max = 1000, step =0.5),
        sliderInput('age', 'Age (days)', 28, min = 1, max = 365, step =1),
        submitButton('Submit')
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Results",
                        h6('Used value for Cement'),
                        verbatimTextOutput("oid1"),
                        h6('Used value for Blast Furnace Slag'),
                        verbatimTextOutput("oid2"),
                        h6('Used value for Fly Ash'),
                        verbatimTextOutput("oid3"),
                        h6('Used value for Water'),
                        verbatimTextOutput("oid4"),
                        h6('Used value for Superplasticizer'),
                        verbatimTextOutput("oid5"),
                        h6('Used value for Coarse Aggregate'),
                        verbatimTextOutput("oid6"),
                        h6('Used value for Fine Aggregate'),
                        verbatimTextOutput("oid7"),
                        h6('Used value for Age'),
                        verbatimTextOutput("oid8"),
                        h4('Prediction of Concrete Compressive Strength (MPa)'),
                        verbatimTextOutput("oid9")
            ),
            tabPanel("Documentation",
                     h5('This data application predicts the concrete compressive strength'),
                     h5('based on the mixture of its ingredients'),
                     h5('Slide the right amount of each ingredient and press the submit button'),
                     h5('Recalculation will be done everytime the submit button is pressed'),
                     h5('Data source: Concrete data set by I-Cheng Yeh'),
                     h5('Random Forest regression used for the prediction model')
            )
        )
     )
))
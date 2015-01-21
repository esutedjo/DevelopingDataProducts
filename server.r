require(AppliedPredictiveModeling)
require(randomForest)
require(caret)
require(shiny)

#Load data
data(concrete)
train <- concrete

# Rename columns
names(train) <- c("cement",
                  "slag",
                  "flyash",
                  "water",
                  "plasticizer",
                  "coarse",
                  "fine",
                  "age",
                  "strength"
                  )

# Create training and test dataset
set.seed(355)
InTrain<-createDataPartition(y=train$strength,p=0.9,list=FALSE)
train <-train[InTrain,]
test <- train[-InTrain,]

# Train prediction model with random forest
fit <- train(strength ~ .,
             data = train,
             method ="rf",
             prox=TRUE,
             trControl=trainControl(method="cv",number=3)
)

shinyServer(
    function(input, output) {
                
        output$oid1 <- renderPrint({input$cement})
        output$oid2 <- renderPrint({input$slag})
        output$oid3 <- renderPrint({input$flyash})
        output$oid4 <- renderPrint({input$water})
        output$oid5 <- renderPrint({input$plasticizer})
        output$oid6 <- renderPrint({input$coarse})
        output$oid7 <- renderPrint({input$fine})       
        output$oid8 <- renderPrint({input$age})
        
        output$oid9 <- renderPrint({
                        
            # Create dataframe of the input parameters
             df <- data.frame(cement = input$cement,
                              slag = input$slag,
                              flyash = input$flyash,
                              water = input$water,
                              plasticizer = input$plasticizer,
                              coarse = input$coarse,
                              fine = input$fine,
                              age = round(input$age)
                              )
             # Prediction
             predict(fit, df)
        })
    }
)
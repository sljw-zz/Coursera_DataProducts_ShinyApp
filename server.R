library(UsingR)
library(ggplot2)
library(plyr)
data(swiss)

shinyServer(
    function(input, output) {
        
        output$fertilitysummary <- renderPrint({
            summary(swiss$Fertility)
        })
        
        output$variablesummary <- renderPrint({
            if(input$variable == "Agriculture")
                summary(swiss$Agriculture)
            else if(input$variable == "Examination")
                summary(swiss$Examination)
            else if(input$variable == "Education")
                summary(swiss$Education)
            else if(input$variable == "Catholic")
                summary(swiss$Catholic)
            else if(input$variable == "Infant.Mortality")
                summary(swiss$Infant.Mortality)
        })
        
        output$cplot <- renderPlot({
            ggplot(swiss, aes_string(input$variable, "Fertility"))+
            geom_point(color="skyblue3", size=4)+
            geom_smooth(method="lm", colour="orange", size=1.5
                        )+
            guides(color=FALSE)+theme_classic()+ 
            ggtitle(paste("Fertility vs.",input$variable, sep=" "))+
            theme(plot.title = element_text(size = 18,face="bold"))+
            theme(axis.title = element_text(size = 15,face = "bold"))
                })
        
        output$summaryvariable <- renderText({
            paste("Summary of", input$variable, sep=" ")
        })
        
        output$regsummary <- renderPrint({
            if(input$variable == "Agriculture")
                summary(lm(Fertility ~ Agriculture, data = swiss))
            else if(input$variable == "Examination")
                summary(lm(Fertility ~ Examination, data = swiss))
            else if(input$variable == "Education")
                summary(lm(Fertility ~ Education, data = swiss))
            else if(input$variable == "Catholic")
                summary(lm(Fertility ~ Catholic, data = swiss))
            else if(input$variable == "Infant.Mortality")
                summary(lm(Fertility ~ Infant.Mortality, data = swiss))
        })
        
})
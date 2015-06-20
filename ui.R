shinyUI(pageWithSidebar(
    headerPanel("Swiss Fertility Rates"),
    sidebarPanel(
        h3("Instructions"),
        p("In this project, we study the relationship between Fertility Rates
           in Switzerland in 1888 and several socio-economic indicators. These
            indicators are as listed below."),
        
        p("Select the socio-economic indicator from the drop-down menu
          that you would like to analyse against Fertility."),
        
        selectInput(inputId= 'variable', label = "Select Indicator:", 
            choices = c("Agriculture", "Examination", "Education", "Catholic", "Infant.Mortality"))
    ),
    mainPanel(
        h5("The Swiss Fertility and Socioeconomic Indicators Data encompasses the
            Standardized fertility measure and socio-economic indicators for each of 
           47 French-speaking provinces of Switzerland at about 1888. There are 6 variables
           in this dataset, each of which is represented in percent(%). All variables but
           'Fertility' give proportions of the population."),
        p(" "),
        h4("Summary of Fertility"),
        verbatimTextOutput('fertilitysummary'),
        h4(textOutput('summaryvariable')),
        verbatimTextOutput('variablesummary'),
        plotOutput('cplot'),
        verbatimTextOutput('regsummary')
    )
)
)

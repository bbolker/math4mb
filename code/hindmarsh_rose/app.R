#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(deSolve)
library(tidyverse); theme_set(theme_bw())

ui <- fluidPage(

    # Application title
    titlePanel("Hindmarsh-Rose"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("I",
                        "Applied current:",
                        min = 1,
                        max = 3.5,
                        value = 2, step=0.001),
            numericInput("r",
                         "rate of slow process:",
                         value = 0.0021),
            numericInput("z0",
                         "starting z:",
                         value = 4),
            sliderInput("t_trans",
                        "Transient time",
                        min=0,
                        max=10000,
                        step=50,
                        value=500),
            sliderInput("t_run",
                        "Running time",
                        min=0,
                        max=1000,
                        step=50,
                        value=500),
           textInput("method",
                         "ODE method:",
                         value = "ode23"),
           submitButton(text = "Run", icon = NULL, width = NULL)
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

HRgrad <- function(t, y, parms) {
    grad <- with(as.list(c(y,parms)),
         {
             c(x=3*x^2-x^3 + y - z + I,
               y = 1 - 5*x^2 - y,
               z = r*(4*(x+8/5)-z))
         })
    return(list(grad))
         }
    

# Define server logic 
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        ## browser()
        ##input <- list(t_trans=500,t_run=500,r=0.0021,I=2)
        dt <- 0.1
        t_vec <- c(0,seq(input$t_trans,input$t_run+input$t_trans,by=dt))
        y0 <- c(x=0.2,y=0.2,z=input$z0)
        x <- ode(y=y0, times=t_vec, 
                 parms=list(r=input$r,I=input$I), 
                 func=HRgrad,
                 method=input$method)
        xL <- (x
               %>% as.data.frame %>% as_tibble()
               %>% tail(-1)  ## drop t=0
               %>% pivot_longer(names_to="var",-time)
        )
        ggplot(xL, aes(time, value, colour=var)) + 
            geom_line() +
            facet_wrap(~var,ncol=1,scale="free")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

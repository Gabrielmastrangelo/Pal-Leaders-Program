
library('shiny')
library(ggplot2)
library(rsconnect)
library(dplyr)

plotting <- function(n, p, xend) {
  
  x <- 0:n
  p_binom <- dbinom(x, n, p)
  p_norm <- pnorm(x+0.5, n*p, sqrt(n*p*(1-p))) - pnorm(x-0.5, n*p, sqrt(n*p*(1-p)))
  
  df <- data.frame(x, p_binom, p_norm)
  
  error <-  abs(df$p_binom - df$p_norm)
  
  p <- ggplot(df, aes(x=x)) +
    geom_line(aes(y = p_binom, colour = "Binominal Distribution")) +
    geom_line(aes(y = p_norm, colour = "Normal Distribution")) +
    geom_area(data = subset(df, x >= xend[1] & x <= xend[2]), aes(y = p_binom)) +
    scale_colour_manual('Distribution',  values = c("blue", "brown")) +
    ggtitle("Normal approximation to a Binomial Distribution", ) +
    xlab("x value")+
    ylab("P(x)")
  
  maxY <- c(df$p_binom, df$p_norm)
  
  points <- data.frame(xend, df[df$x %in% xend, 2])
  #print(points)
  colnames(points) <- c("x_point", "y_point")
  
  plot <- p + theme_bw() +
    geom_point(data = points, aes(x = x_point, y = y_point), size = 3, colour = 'blue')
  
  return(plot)
}

px_binom <- function(xs, n, p) {
  px <- pbinom(xs, n, p)
  return(px[2]-px[1])
}
px_norm <- function(xs, n, p) {
  xs <- xs + c(-0.5, 0.5)
  p_norm <- pnorm(xs, n*p, sqrt(n*p*(1-p)))
  return(p_norm[2]-p_norm[1])
}

ui <- fluidPage(
  titlePanel("Approximating a Binomial from a Normal Distribution"),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput(inputId = "n", label = "n", min = 0, max = 200, value = 100),
      sliderInput(inputId = "px", label = "p(x)", min = 0, max = 1, value = 0.5),
      sliderInput(inputId = "x", label = "x", min = 0, max = 100, value = c(0, 50))
    ),
    
    mainPanel(
      plotOutput("hist")
    ),
  ),
  
  verbatimTextOutput('stats')
  
)

server <- function(input, output) {
  # when air change, update water
  observeEvent(input$n,  {
    updateSliderInput(inputId = "x", max = input$n)
  })
  
  output$hist <- renderPlot({ 
    plotting(input$n, input$px, input$x)
  })
  output$stats <- renderPrint({
    px_actual <- px_binom(input$x, input$n, input$px)
    stringPx_binom <- paste("P(", input$x[1], "<=x<=", input$x[2], ") = ",px_actual , sep = "")
    rowOne <- paste("By Binomial Distribution", stringPx_binom)
    rowOne
    px_estimated <- px_norm(input$x, input$n, input$px)
    stringPx_norm <- paste("P(", input$x[1], "<=x<=", input$x[2], ") = ",px_estimated , sep = "")
    rowTwo <- paste("By Normal Approximation", stringPx_norm)
    rowTwo
    rowThree <- paste("Error =", abs(px_actual-px_estimated))
    rows <- paste(rowOne, rowTwo, rowThree, sep = '\n')
    writeLines(rows)
  })
}

shinyApp(ui = ui, server = server)

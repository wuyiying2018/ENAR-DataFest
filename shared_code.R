#' -------------------------------------------------------------------------------------------------------
#' Project Name: shared_code.R
#' Software Version: R Studio Version 2023.06.0+421 / R Version 4.3.1
#' 
#' Short Description: This is the file to save shared code
#'
#' Author:  Yi Huang
#'          Yiying Wu
#'          
#' Date Authored: 12/20/2023
#' --------------------------------------------------------------------------------------------------------


#'---------------------------------------------------------------------------------------------------------
#' FUNCTION: exactDec
#' PURPOSE:  rounding function
#' @param x
#' @param n
#'---------------------------------------------------------------------------------------------------------

exactDec <- function(x, n = 2){
  round2 <- function(x, n) {
    posneg <- sign(x)
    z <- abs(x) * 10 ^ n
    z <- z + 0.5 + sqrt(.Machine$double.eps)
    z <- trunc(z)
    z <- z / 10 ^ n
    return(z * posneg)
  }
  round2(x, n) %>%
    format(nsmall = n) %>%
    trimws()
}   



#'---------------------------------------------------------------------------------------------------------
#' FUNCTION: pvalue_rounder
#' PURPOSE:  Function for rounding p values according to the rules specified in the guide:
#' p >= 0.005 report with 2 decimal places, p < 0.005 report with 1 sigfig,
#' and p < 0.0001 report as `"<0.0001"`
#' @param p-value
#'---------------------------------------------------------------------------------------------------------

pvalue_rounder <- function(p_value){
  case_when(p_value < 0.0001~"<0.0001",
            p_value <= 0.005~formatC(p_value,1, format = "fg", flag = "#"),
            TRUE~exactDec(p_value, n = 4))
}
#' -------------------------------------------------------------------------------------------------------
#' Project Name: convert_rtf.R
#' Software Version: R Studio Version 2023.06.0+421 / R Version 4.3.1
#' 
#' Short Description: This is the file to convert the model results into rtf
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


#'---------------------------------------------------------------------------------------------------------
#' FUNCTION: cont_to_rtf
#' PURPOSE:  outputs continuous table into RTF format
#' @param table        the table to be outputted to rtf
#' @param title        the title of the table
#' @param location     the desired location of the rtf output, as a string
#' @param filename     the name of the output rtf file, as a string
#' @param source       the source of datasets
#' @param footnote     desired footnotes, as a string
#'---------------------------------------------------------------------------------------------------------

library(r2rtf)
library(dplyr)
library(tidyr)

names(model1$coef)


decimals <- 2

# Assuming model1$coef is your data frame
df1 <- model_s1$coef %>% rename_with(~paste0("M1_", .)) # stage 1
df2 <- model3$coef %>% rename_with(~paste0("M2_", .)) # stage 2

df <- cbind(df1, df2)

gof <- data.frame(
  M1_r2mf=model_s1$R2MF,
  M1_r2cu=model_s1$R2CU,
  M2_r2mf=model3$R2MF,
  M2_r2cu=model3$R2CU
)

# write.csv(df, "results.csv", row.names=TRUE)
# write.csv(gof, "gof_results.csv", row.names=TRUE)

# Calculate OR and 95% CI for OR
df <- df %>%
  mutate(
    M1_OR = exp(M1_b.pool),
    `M1_OR Lower CI` = exp(M1_lower.ci),
    `M1_OR Upper CI` = exp(M1_upper.ci),
    `M1_OR (95% CI)` = paste(round(`M1_OR Lower CI`, 2), "to", round(`M1_OR Upper CI`, 2)),
    M2_OR = exp(M2_b.pool),
    `M2_OR Lower CI` = exp(M2_lower.ci),
    `M2_OR Upper CI` = exp(M2_upper.ci),
    `M2_OR (95% CI)` = paste(round(`M2_OR Lower CI`, 2), "to", round(`M2_OR Upper CI`, 2))
  )



# Select and rename columns for the table
df_table <- df %>%
  mutate(`M1_OR (95% CI)`= str_c(exactDec(M1_OR, decimals), " (", exactDec(`M1_OR Lower CI`, decimals), ", ", exactDec(`M1_OR Upper CI`, decimals), ")"),
         `M1_p-value` = pvalue_rounder(M1_pvalue.pool),
         `M2_OR (95% CI)`= str_c(exactDec(M2_OR, decimals), " (", exactDec(`M2_OR Lower CI`, decimals), ", ", exactDec(`M2_OR Upper CI`, decimals), ")"),
         `M2_p-value` = pvalue_rounder(M2_pvalue.pool)) %>%
  select(
    `M1_OR (95% CI)`,
    `M1_p-value`,
    `M2_OR (95% CI)`,
    `M2_p-value`
  )

df_table <- cbind(Variable = rownames(df_table), df_table) %>%
  mutate( var_label = c(rep("svy_year", 9), "Age", "Race", "Race",
                        "Gender", rep("BMI",2), "Diabetes", "CKD", 
                        "CVD", "Medication", "Hypertension Awareness"))

# Convert to rtf format
rtf_table <- df_table %>%
  rtf_page(width = 9.5,
           height = 11) %>%
  rtf_title("Table 1: Summary of Logistic Regression Model") %>%
  rtf_colheader(" |BP Systolic >130 and Diastolic >80 | BP Systolic >140 and Diastolic >90",
                col_rel_width = c(rep(2, 3))) %>%
  rtf_colheader("Variable | OR (95% CI) | p-value | OR (95% CI) | p-value ",
                col_rel_width = c(2, 1, 1, 1, 1),
                border_top = c(rep("single", 5)),
                border_left = c("single")) %>%
  rtf_body(
    text_font = 8,
    text_font_size = c(rep(8, 5)),
    col_rel_width = c(2, 1, 1, 1, 1),
    text_justification = c("l", rep("c",4)),
    border_left = c("single", rep("single",4)),
    border_right = c(rep("single", 4), "single")
  ) %>%
  rtf_footnote("This is a footnote") %>%
  rtf_source("Source: xxx") %>%
  rtf_encode()

# Write to an RTF file
write_rtf(rtf_table, file = "logistic_regression_output.rtf")



cont_to_rtf <- 
  function(table, 
           title,
           location,
           filename,
           source = NULL,
           footnote = NULL){
    
    # File name
    filename <- paste0(filename, ".rtf")
    
    # Setting title, if more than one study, appending to title
    rtf_ttl <- title
    
    # Setting location path with file name
    fp <- paste0(location, filename)
    
    # # Setting Colheader
    # co_header <- colheader
    
    # RTF table
    table %>% 
      rtf_page(orientation = "portrait", 
               width = 8.5, 
               height = 11) %>%
      rtf_title(rtf_ttl,
                text_font = 4,
                text_font_size = 8,
                text_justification = "l") %>%
      rtf_colheader(paste0(colnames(table), collapse = " | "),
                    col_rel_width = c(1.2, 1.2, 4.2, rep(1.5, ncol(table)-3)),
                    border_left = c(rep("", 2), rep("single", ncol(table)-2)),
                    border_right = c("")) %>%
      rtf_body(text_font = 4,
               text_font_size = c(rep(7.2, ncol(table))),
               col_rel_width = c(1.2, 1.2, 4.2, rep(1.5, ncol(table)-3)) ,
               text_justification = c("l", "r", rep("d", ncol(table)-2)),
               border_left = c(rep("", 2), rep("single", ncol(table)-2)),
               border_right = c(""))%>%
      rtf_encode() %>%
      write_rtf(fp)
    
    message(paste("Table output was saved in:", location))
    message(paste("Table Document:", filename))
  }
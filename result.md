result
================

## This document shows the result of the code

## CardioStatsUSA

To install CardioStatsUSA, run this

``` r
install.packages("CardioStatsUSA")
```

if not work, try this

``` r
if (!requireNamespace("remotes", quietly = TRUE))
install.packages("remotes")
remotes::install_github("jhs-hwg/CardioStatsUSA")
```

## R packages

``` r
library(cardioStatsUSA)
library(tidyverse)
library(survey)
library(gtsummary)
library(mice)
```

## data

``` r
# head(nhanes_data)
dat<-nhanes_data
```

## data cleaning

**combine categories**

``` r
dat <- dat %>%
  mutate(
    # Demographics variables
    # demo_age_cat
    demo_age_cat = factor(case_when(
      demo_age_cat == "65 to 74" ~ "65+",  
      demo_age_cat == "75+" ~ "65+", 
      TRUE ~ demo_age_cat
    )),
    # demo_race
    demo_race=factor(case_when(
      demo_race == "Non-Hispanic Asian" ~ "Hispanic/Asian/Other",
      demo_race == "Hispanic" ~ "Hispanic/Asian/Other",
      demo_race == "Other" ~ "Hispanic/Asian/Other",
      TRUE ~ demo_race
    )),
    
    # Antihypertensive medication variables
    # bp_med_n_class
    bp_med_n_class=factor(case_when(
      bp_med_n_class == "Two" ~ "Two or more",
      bp_med_n_class == "Three" ~ "Two or more",
      bp_med_n_class == "Four or more" ~ "Two or more",
      TRUE ~ bp_med_n_class
    )),
    # bp_med_n_pills
    bp_med_n_pills=factor(case_when(
      bp_med_n_pills == "Two" ~ "Two or more",
      bp_med_n_pills == "Three" ~ "Two or more",
      bp_med_n_pills == "Four or more" ~ "Two or more",
      TRUE ~ bp_med_n_pills
    )),
    # cc_bmi
    cc_bmi=factor(case_when(
      cc_bmi == "30 to <35" ~ "30+",
      cc_bmi == "35+" ~ "30+",
      TRUE ~ cc_bmi
    )),
    # cc_smoke
    cc_smoke=factor(case_when(
      cc_smoke == "Former" ~ "Former/Current",
      cc_smoke == "Current" ~ "Former/Current",
      TRUE ~ cc_smoke
    ))
  )
```

### recode categorical data

``` r
dat <- dat %>% mutate(
  # Demographics variables
  demo_age_cat=relevel(demo_age_cat, ref = "18 to 44"),
  demo_race=relevel(demo_race,ref="Non-Hispanic White"),
  pregnant=ifelse(demo_pregnant=="Yes",1,ifelse(demo_pregnant=="No",0,NA)),
  female=ifelse(demo_gender=="Women",1,ifelse(demo_gender=="Men",0,NA)),
  
  # Blood pressure variables
  bp_uncontrolled_140_90=ifelse(bp_uncontrolled_140_90=="Yes",1,ifelse(bp_uncontrolled_140_90=="No",0,NA)),
  bp_uncontrolled_130_80=ifelse(bp_uncontrolled_130_80=="Yes",1,ifelse(bp_uncontrolled_130_80=="No",0,NA)),
  
  # Hypertension variables
  htn_accaha=ifelse(htn_accaha=="Yes",1,ifelse(htn_accaha=="No",0,NA)),
  htn_aware=ifelse(htn_aware=="Yes",1,ifelse(htn_aware=="No",0,NA)),
  htn_resistant_jnc7=ifelse(htn_resistant_jnc7=="Yes",1,ifelse(htn_resistant_jnc7=="No",0,NA)),
  htn_resistant_accaha=ifelse(htn_resistant_accaha=="Yes",1,ifelse(htn_resistant_accaha=="No",0,NA)),
  htn_resistant_accaha_thz=ifelse(htn_resistant_accaha_thz=="Yes",1,ifelse(htn_resistant_accaha_thz=="No",0,NA)),
  htn_resistant_jnc7_thz=ifelse(htn_resistant_jnc7_thz=="Yes",1,ifelse(htn_resistant_jnc7_thz=="No",0,NA)),
  
  # Antihypertensive medication variables
  bp_med_use=ifelse(bp_med_use=="Yes",1,ifelse(bp_med_use=="No",0,NA)),
  bp_med_recommended_jnc7=ifelse(bp_med_recommended_jnc7=="Yes",1,ifelse(bp_med_recommended_jnc7=="No",0,NA)),
  bp_med_recommended_accaha=ifelse(bp_med_recommended_accaha=="Yes",1,ifelse(bp_med_recommended_accaha=="No",0,NA)),
  bp_med_recommended_escesh=ifelse(bp_med_recommended_escesh=="Yes",1,ifelse(bp_med_recommended_escesh=="No",0,NA)),
  bp_med_n_class=relevel(bp_med_n_class,ref="None"),
  bp_med_n_pills=relevel(bp_med_n_pills,ref="None"),
  bp_med_combination=ifelse(bp_med_combination=="Yes",1,ifelse(bp_med_combination=="No",0,NA)),
  bp_med_pills_gteq_2=ifelse(bp_med_pills_gteq_2=="Yes",1,ifelse(bp_med_pills_gteq_2=="No",0,NA)),
  bp_med_ace=ifelse(bp_med_ace=="Yes",1,ifelse(bp_med_ace=="No",0,NA)),
  bp_med_aldo=ifelse(bp_med_aldo=="Yes",1,ifelse(bp_med_aldo=="No",0,NA)),
  bp_med_alpha=ifelse(bp_med_alpha=="Yes",1,ifelse(bp_med_alpha=="No",0,NA)),
  bp_med_angioten=ifelse(bp_med_angioten=="Yes",1,ifelse(bp_med_angioten=="No",1,NA)),
  bp_med_beta=ifelse(bp_med_beta=="Yes",1,ifelse(bp_med_beta=="No",0,NA)),
  bp_med_ccb=ifelse(bp_med_ccb=="Yes",1,ifelse(bp_med_ccb=="No",0,NA)),
  bp_med_ccb_dh=ifelse(bp_med_ccb_dh=="Yes",1,ifelse(bp_med_ccb_dh=="No",0,NA)),
  bp_med_ccb_ndh=ifelse(bp_med_ccb_ndh=="Yes",1,ifelse(bp_med_ccb_ndh=="No",0,NA)),
  bp_med_central=ifelse(bp_med_central=="Yes",1,ifelse(bp_med_central=="No",0,NA)),
  bp_med_renin_inhibitors=ifelse(bp_med_renin_inhibitors=="Yes",1,ifelse(bp_med_renin_inhibitors=="No",0,NA)),
  bp_med_vasod=ifelse(bp_med_vasod=="Yes",1,ifelse(bp_med_vasod=="No",0,NA)),
  bp_med_diur_loop=ifelse(bp_med_diur_loop=="Yes",1,ifelse(bp_med_diur_loop=="No",0,NA)),
  bp_med_diur_Ksparing=ifelse(bp_med_diur_Ksparing=="Yes",1,ifelse(bp_med_diur_Ksparing=="No",0,NA)),
  bp_med_diur_thz=ifelse(bp_med_diur_thz=="Yes",1,ifelse(bp_med_diur_thz=="No",0,NA)),
  
  # Comorbidities variables
  cc_smoke=relevel(cc_smoke,ref="Never"),
  cc_bmi=relevel(cc_bmi,ref="<25"),
  cc_diabetes=ifelse(cc_diabetes=="Yes",1,ifelse(cc_diabetes=="No",0,NA)),
  cc_ckd=ifelse(cc_ckd=="Yes",1,ifelse(cc_ckd=="No",0,NA)),
  cc_cvd_mi=ifelse(cc_cvd_mi=="Yes",1,ifelse(cc_cvd_mi=="No",0,NA)),
  cc_cvd_chd=ifelse(cc_cvd_chd=="Yes",1,ifelse(cc_cvd_chd=="No",0,NA)),
  cc_cvd_stroke=ifelse(cc_cvd_stroke=="Yes",1,ifelse(cc_cvd_stroke=="No",0,NA)),
  cc_cvd_ascvd=ifelse(cc_cvd_ascvd=="Yes",1,ifelse(cc_cvd_ascvd=="No",0,NA)),
  cc_cvd_hf=ifelse(cc_cvd_hf=="Yes",1,ifelse(cc_cvd_hf=="No",0,NA)),
  cc_cvd_any=ifelse(cc_cvd_any=="Yes",1,ifelse(cc_cvd_any=="No",0,NA))
)
```

### select the relavent variables

``` r
dat=dat%>%select(
  # Survey variables
  svy_id, svy_psu,svy_strata, svy_weight_mec, svy_subpop_htn,
  svy_year,
  # Demographics variables
  demo_age_cat, demo_age_years, demo_race, pregnant, female, 
  # Blood pressure variables
  bp_uncontrolled_140_90,bp_uncontrolled_130_80,
  # Hypertension variables
  htn_accaha, htn_aware, htn_resistant_accaha,
  htn_resistant_accaha_thz,
  # Antihypertensive medication variables
  bp_med_use, bp_med_recommended_accaha, bp_med_n_class,
  bp_med_n_pills, bp_med_combination, bp_med_pills_gteq_2,
  bp_med_ace, bp_med_aldo, bp_med_alpha, bp_med_angioten,
  bp_med_beta, bp_med_ccb, bp_med_ccb_dh, bp_med_ccb_ndh, 
  bp_med_central, bp_med_renin_inhibitors, bp_med_vasod,
  bp_med_diur_loop, bp_med_diur_Ksparing, bp_med_diur_thz, 
  # Comorbidities variables
  cc_smoke, cc_bmi, cc_diabetes, cc_ckd, cc_cvd_mi, cc_cvd_chd, 
  cc_cvd_stroke, cc_cvd_ascvd, cc_cvd_hf, cc_cvd_any
)
```

**check variables**

``` r
## Summary Statistics
dat %>% 
  select(everything()) %>% 
  tbl_summary() %>% 
  bold_labels()
```

<div id="yiabnhjbcl" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#yiabnhjbcl table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#yiabnhjbcl thead, #yiabnhjbcl tbody, #yiabnhjbcl tfoot, #yiabnhjbcl tr, #yiabnhjbcl td, #yiabnhjbcl th {
  border-style: none;
}

#yiabnhjbcl p {
  margin: 0;
  padding: 0;
}

#yiabnhjbcl .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#yiabnhjbcl .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#yiabnhjbcl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#yiabnhjbcl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#yiabnhjbcl .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#yiabnhjbcl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#yiabnhjbcl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#yiabnhjbcl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#yiabnhjbcl .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#yiabnhjbcl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#yiabnhjbcl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#yiabnhjbcl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#yiabnhjbcl .gt_spanner_row {
  border-bottom-style: hidden;
}

#yiabnhjbcl .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#yiabnhjbcl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#yiabnhjbcl .gt_from_md > :first-child {
  margin-top: 0;
}

#yiabnhjbcl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#yiabnhjbcl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#yiabnhjbcl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#yiabnhjbcl .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#yiabnhjbcl .gt_row_group_first td {
  border-top-width: 2px;
}

#yiabnhjbcl .gt_row_group_first th {
  border-top-width: 2px;
}

#yiabnhjbcl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#yiabnhjbcl .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#yiabnhjbcl .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#yiabnhjbcl .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#yiabnhjbcl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#yiabnhjbcl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#yiabnhjbcl .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#yiabnhjbcl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#yiabnhjbcl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#yiabnhjbcl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#yiabnhjbcl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#yiabnhjbcl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#yiabnhjbcl .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#yiabnhjbcl .gt_left {
  text-align: left;
}

#yiabnhjbcl .gt_center {
  text-align: center;
}

#yiabnhjbcl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#yiabnhjbcl .gt_font_normal {
  font-weight: normal;
}

#yiabnhjbcl .gt_font_bold {
  font-weight: bold;
}

#yiabnhjbcl .gt_font_italic {
  font-style: italic;
}

#yiabnhjbcl .gt_super {
  font-size: 65%;
}

#yiabnhjbcl .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#yiabnhjbcl .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#yiabnhjbcl .gt_indent_1 {
  text-indent: 5px;
}

#yiabnhjbcl .gt_indent_2 {
  text-indent: 10px;
}

#yiabnhjbcl .gt_indent_3 {
  text-indent: 15px;
}

#yiabnhjbcl .gt_indent_4 {
  text-indent: 20px;
}

#yiabnhjbcl .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 59,799&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 59,799</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Respondent sequence number</td>
<td headers="stat_0" class="gt_row gt_center">56,171 (29,381, 83,307)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-PSU</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">29,272 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">29,516 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    3</td>
<td headers="stat_0" class="gt_row gt_center">1,011 (1.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-Stratum</td>
<td headers="stat_0" class="gt_row gt_center">80 (40, 118)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Full Sample 2 Year MEC Exam Weight</td>
<td headers="stat_0" class="gt_row gt_center">25,473 (14,775, 50,242)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Subpopulation for hypertension</td>
<td headers="stat_0" class="gt_row gt_center">56,017 (94%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">NHANES cycle</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1999-2000</td>
<td headers="stat_0" class="gt_row gt_center">4,976 (8.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2001-2002</td>
<td headers="stat_0" class="gt_row gt_center">5,592 (9.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2003-2004</td>
<td headers="stat_0" class="gt_row gt_center">5,303 (8.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2005-2006</td>
<td headers="stat_0" class="gt_row gt_center">5,334 (8.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2007-2008</td>
<td headers="stat_0" class="gt_row gt_center">5,995 (10%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2009-2010</td>
<td headers="stat_0" class="gt_row gt_center">6,360 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2011-2012</td>
<td headers="stat_0" class="gt_row gt_center">5,615 (9.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2013-2014</td>
<td headers="stat_0" class="gt_row gt_center">5,924 (9.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2015-2016</td>
<td headers="stat_0" class="gt_row gt_center">5,735 (9.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2017-2020</td>
<td headers="stat_0" class="gt_row gt_center">8,965 (15%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_age_cat</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    18 to 44</td>
<td headers="stat_0" class="gt_row gt_center">27,935 (47%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    45 to 64</td>
<td headers="stat_0" class="gt_row gt_center">18,082 (30%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    65+</td>
<td headers="stat_0" class="gt_row gt_center">13,782 (23%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age at Screening Adjudicated - Recode</td>
<td headers="stat_0" class="gt_row gt_center">47 (31, 63)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_race</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic White</td>
<td headers="stat_0" class="gt_row gt_center">25,254 (42%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Hispanic/Asian/Other</td>
<td headers="stat_0" class="gt_row gt_center">21,262 (36%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic Black</td>
<td headers="stat_0" class="gt_row gt_center">13,283 (22%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">pregnant</td>
<td headers="stat_0" class="gt_row gt_center">1,620 (2.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">671</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">female</td>
<td headers="stat_0" class="gt_row gt_center">30,917 (52%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_140_90</td>
<td headers="stat_0" class="gt_row gt_center">11,082 (19%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_130_80</td>
<td headers="stat_0" class="gt_row gt_center">22,028 (37%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_accaha</td>
<td headers="stat_0" class="gt_row gt_center">28,056 (47%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_aware</td>
<td headers="stat_0" class="gt_row gt_center">19,647 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">268</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_resistant_accaha</td>
<td headers="stat_0" class="gt_row gt_center">2,723 (4.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_resistant_accaha_thz</td>
<td headers="stat_0" class="gt_row gt_center">1,580 (2.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_use</td>
<td headers="stat_0" class="gt_row gt_center">14,690 (25%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">292</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_recommended_accaha</td>
<td headers="stat_0" class="gt_row gt_center">23,082 (39%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_n_class</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    None</td>
<td headers="stat_0" class="gt_row gt_center">42,088 (71%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    One</td>
<td headers="stat_0" class="gt_row gt_center">7,347 (12%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Two or more</td>
<td headers="stat_0" class="gt_row gt_center">9,883 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_n_pills</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    None</td>
<td headers="stat_0" class="gt_row gt_center">42,088 (71%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    One</td>
<td headers="stat_0" class="gt_row gt_center">8,995 (15%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Two or more</td>
<td headers="stat_0" class="gt_row gt_center">8,235 (14%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_combination</td>
<td headers="stat_0" class="gt_row gt_center">3,256 (5.5%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_pills_gteq_2</td>
<td headers="stat_0" class="gt_row gt_center">8,235 (14%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ace</td>
<td headers="stat_0" class="gt_row gt_center">7,061 (12%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_aldo</td>
<td headers="stat_0" class="gt_row gt_center">439 (0.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_alpha</td>
<td headers="stat_0" class="gt_row gt_center">809 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_angioten</td>
<td headers="stat_0" class="gt_row gt_center">59,318 (100%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_beta</td>
<td headers="stat_0" class="gt_row gt_center">6,493 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ccb</td>
<td headers="stat_0" class="gt_row gt_center">5,236 (8.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ccb_dh</td>
<td headers="stat_0" class="gt_row gt_center">4,110 (6.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ccb_ndh</td>
<td headers="stat_0" class="gt_row gt_center">1,148 (1.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_central</td>
<td headers="stat_0" class="gt_row gt_center">504 (0.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_renin_inhibitors</td>
<td headers="stat_0" class="gt_row gt_center">26 (&lt;0.1%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_vasod</td>
<td headers="stat_0" class="gt_row gt_center">296 (0.5%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_diur_loop</td>
<td headers="stat_0" class="gt_row gt_center">2,042 (3.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_diur_Ksparing</td>
<td headers="stat_0" class="gt_row gt_center">839 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_diur_thz</td>
<td headers="stat_0" class="gt_row gt_center">5,311 (9.0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_smoke</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">31,331 (55%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former/Current</td>
<td headers="stat_0" class="gt_row gt_center">25,309 (45%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">3,159</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_bmi</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt;25</td>
<td headers="stat_0" class="gt_row gt_center">18,364 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    25 to &lt;30</td>
<td headers="stat_0" class="gt_row gt_center">19,086 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    30+</td>
<td headers="stat_0" class="gt_row gt_center">20,771 (36%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">1,578</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_diabetes</td>
<td headers="stat_0" class="gt_row gt_center">7,782 (13%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_ckd</td>
<td headers="stat_0" class="gt_row gt_center">9,979 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_mi</td>
<td headers="stat_0" class="gt_row gt_center">2,437 (4.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">4,213</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_chd</td>
<td headers="stat_0" class="gt_row gt_center">3,573 (6.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">4,216</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_stroke</td>
<td headers="stat_0" class="gt_row gt_center">2,205 (4.0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">4,196</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_ascvd</td>
<td headers="stat_0" class="gt_row gt_center">5,134 (8.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_hf</td>
<td headers="stat_0" class="gt_row gt_center">1,880 (3.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">4,293</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_any</td>
<td headers="stat_0" class="gt_row gt_center">5,823 (9.7%)</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR); n (%)</td>
    </tr>
  </tfoot>
</table>
</div>

### Create a new data frame that contains 11 predictors

``` r
my_dat <- dat %>% select(# Survey variables 
                         svy_id, svy_weight_mec, svy_psu, svy_strata, svy_year, svy_subpop_htn,
                         # outcome
                         bp_uncontrolled_140_90, bp_uncontrolled_130_80, 
                         # predictors
                         demo_age_years, demo_race, female, pregnant, cc_bmi, 
                         cc_diabetes, cc_ckd, cc_cvd_any, bp_med_use, htn_aware, cc_smoke
                         # bp_med_n_class, htn_resistant_jnc7
                        )

## Summary Statistics
my_dat %>% 
  select(everything()) %>% 
  tbl_summary() %>% 
  bold_labels()
```

<div id="fomvtzadrh" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#fomvtzadrh table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#fomvtzadrh thead, #fomvtzadrh tbody, #fomvtzadrh tfoot, #fomvtzadrh tr, #fomvtzadrh td, #fomvtzadrh th {
  border-style: none;
}

#fomvtzadrh p {
  margin: 0;
  padding: 0;
}

#fomvtzadrh .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#fomvtzadrh .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#fomvtzadrh .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#fomvtzadrh .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#fomvtzadrh .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fomvtzadrh .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fomvtzadrh .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fomvtzadrh .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#fomvtzadrh .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#fomvtzadrh .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#fomvtzadrh .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#fomvtzadrh .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#fomvtzadrh .gt_spanner_row {
  border-bottom-style: hidden;
}

#fomvtzadrh .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#fomvtzadrh .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#fomvtzadrh .gt_from_md > :first-child {
  margin-top: 0;
}

#fomvtzadrh .gt_from_md > :last-child {
  margin-bottom: 0;
}

#fomvtzadrh .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#fomvtzadrh .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#fomvtzadrh .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#fomvtzadrh .gt_row_group_first td {
  border-top-width: 2px;
}

#fomvtzadrh .gt_row_group_first th {
  border-top-width: 2px;
}

#fomvtzadrh .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fomvtzadrh .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#fomvtzadrh .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#fomvtzadrh .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fomvtzadrh .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fomvtzadrh .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#fomvtzadrh .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#fomvtzadrh .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#fomvtzadrh .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fomvtzadrh .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fomvtzadrh .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#fomvtzadrh .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fomvtzadrh .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#fomvtzadrh .gt_left {
  text-align: left;
}

#fomvtzadrh .gt_center {
  text-align: center;
}

#fomvtzadrh .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#fomvtzadrh .gt_font_normal {
  font-weight: normal;
}

#fomvtzadrh .gt_font_bold {
  font-weight: bold;
}

#fomvtzadrh .gt_font_italic {
  font-style: italic;
}

#fomvtzadrh .gt_super {
  font-size: 65%;
}

#fomvtzadrh .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#fomvtzadrh .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#fomvtzadrh .gt_indent_1 {
  text-indent: 5px;
}

#fomvtzadrh .gt_indent_2 {
  text-indent: 10px;
}

#fomvtzadrh .gt_indent_3 {
  text-indent: 15px;
}

#fomvtzadrh .gt_indent_4 {
  text-indent: 20px;
}

#fomvtzadrh .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 59,799&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 59,799</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Respondent sequence number</td>
<td headers="stat_0" class="gt_row gt_center">56,171 (29,381, 83,307)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Full Sample 2 Year MEC Exam Weight</td>
<td headers="stat_0" class="gt_row gt_center">25,473 (14,775, 50,242)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-PSU</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">29,272 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">29,516 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    3</td>
<td headers="stat_0" class="gt_row gt_center">1,011 (1.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-Stratum</td>
<td headers="stat_0" class="gt_row gt_center">80 (40, 118)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">NHANES cycle</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1999-2000</td>
<td headers="stat_0" class="gt_row gt_center">4,976 (8.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2001-2002</td>
<td headers="stat_0" class="gt_row gt_center">5,592 (9.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2003-2004</td>
<td headers="stat_0" class="gt_row gt_center">5,303 (8.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2005-2006</td>
<td headers="stat_0" class="gt_row gt_center">5,334 (8.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2007-2008</td>
<td headers="stat_0" class="gt_row gt_center">5,995 (10%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2009-2010</td>
<td headers="stat_0" class="gt_row gt_center">6,360 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2011-2012</td>
<td headers="stat_0" class="gt_row gt_center">5,615 (9.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2013-2014</td>
<td headers="stat_0" class="gt_row gt_center">5,924 (9.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2015-2016</td>
<td headers="stat_0" class="gt_row gt_center">5,735 (9.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2017-2020</td>
<td headers="stat_0" class="gt_row gt_center">8,965 (15%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Subpopulation for hypertension</td>
<td headers="stat_0" class="gt_row gt_center">56,017 (94%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_140_90</td>
<td headers="stat_0" class="gt_row gt_center">11,082 (19%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_130_80</td>
<td headers="stat_0" class="gt_row gt_center">22,028 (37%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age at Screening Adjudicated - Recode</td>
<td headers="stat_0" class="gt_row gt_center">47 (31, 63)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_race</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic White</td>
<td headers="stat_0" class="gt_row gt_center">25,254 (42%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Hispanic/Asian/Other</td>
<td headers="stat_0" class="gt_row gt_center">21,262 (36%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic Black</td>
<td headers="stat_0" class="gt_row gt_center">13,283 (22%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">female</td>
<td headers="stat_0" class="gt_row gt_center">30,917 (52%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">pregnant</td>
<td headers="stat_0" class="gt_row gt_center">1,620 (2.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">671</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_bmi</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt;25</td>
<td headers="stat_0" class="gt_row gt_center">18,364 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    25 to &lt;30</td>
<td headers="stat_0" class="gt_row gt_center">19,086 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    30+</td>
<td headers="stat_0" class="gt_row gt_center">20,771 (36%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">1,578</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_diabetes</td>
<td headers="stat_0" class="gt_row gt_center">7,782 (13%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_ckd</td>
<td headers="stat_0" class="gt_row gt_center">9,979 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_any</td>
<td headers="stat_0" class="gt_row gt_center">5,823 (9.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_use</td>
<td headers="stat_0" class="gt_row gt_center">14,690 (25%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">292</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_aware</td>
<td headers="stat_0" class="gt_row gt_center">19,647 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">268</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_smoke</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">31,331 (55%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former/Current</td>
<td headers="stat_0" class="gt_row gt_center">25,309 (45%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">3,159</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR); n (%)</td>
    </tr>
  </tfoot>
</table>
</div>

### missing values

Participants with missing pregnancy status were assumed to be
nonpregnant for these analyses. reference:
<https://www.ahajournals.org/doi/10.1161/HYPERTENSIONAHA.123.20900>

survey weights are calibrated within race, gender, and age groups to
account for missing information on SBP, DBP or self-reported
antihypertensive medication use:
<https://www.sciencedirect.com/science/article/pii/S027263860350004X?casa_token=U-KIitsxOGEAAAAA:jVZ1jyZmsVzR6BGEFVWUTjCh3wfKqvF1JXOLL55qFOu4Dk8giNQSfyU4pGS05Xl4DfM8uiwfPQ>

``` r
# Check the distribution of demo_age_years
hist(my_dat$demo_age_years, main="demo_age_years")

# adj for pregnant missing
my_dat <- my_dat %>% 
  mutate(pregnant = ifelse(is.na(pregnant), 0, pregnant))

# Initial imputation
ini = mice(my_dat, maxit = 0, print = FALSE)
pred0 = ini$pred
method0 = ini$method
method0
ini$nmis

# Study missing patterns in more details
md.pattern(my_dat,plot = FALSE)

# Modify the imputation predictor matrix
# and generate 5 imputations with 5 iterations 
# in each imputation using the modified predictor matrix
pred1 = pred0
pred1[, c("svy_id", "svy_weight_mec", "svy_psu", "svy_strata", "svy_year", "svy_subpop_htn")] = 0
pred1

# to Speed Up the Process, subset the data
# my_dat<-my_dat%>%filter(svy_subpop_chol == 1)
ini_1 = mice(my_dat, pred = pred1, m = 5, maxit = 5, print = FALSE, seed = 1)

# get the first imputed data set, use the complete( ) function
imp1 =  complete(ini_1, 1)

## Check the convergence of the model
plot(ini_1)

## Summary Statistics
imp1 %>% 
  select(everything()) %>% 
  tbl_summary() %>% 
  bold_labels()
```

# survey design

**Notes**:

-   combine weight in many years, refer to
    <https://wwwn.cdc.gov/nchs/nhanes/tutorials/Weighting.aspx>
-   The weight in the dataset is: **Full sample 2 year MEC exam weight**
    (2-year weight?)
-   However, for all analyses that combine 1999-2000 with other survey
    cycles, you must start by using the 4-year weights provided by NCHS
    for 1999-2002, then include the 2-year weights for each additional
    2-year cycle that is combined. (refer to larger nhance dataset to
    find 4-year weights???)

## weight adjustment for years

To simplify this, we first ignore the “must start by using the 4-year
weights provided by NCHS for 1999-2002”, and use 2-year weights for all
observations from 1999-2016. Treat 2017-2020Mar as 3.2 years.

Combining nine survey cycles + one 3.2 year survey cycle (18+3.2 years:
1999-2016 2017-2020Mar)

``` r
my_dat$svy_weight_mec<-ifelse(my_dat$svy_year %in% c("2017-2020"),my_dat$svy_weight_mec*3.2/21.2,my_dat$svy_weight_mec*2/21.2)
```

## define survey design

``` r
nhanes_all<-svydesign(data=my_dat,id=~svy_id, strata=~svy_strata, weights=~svy_weight_mec, nest=TRUE)
```

## for blood pressure and hypertension sub-population

According to
<https://wwwn.cdc.gov/nchs/nhanes/tutorials/VarianceEstimation.aspx>, As
a general rule when working with complex survey data such as NHANES, you
should never drop records from your analysis dataset before executing
your analysis procedures. Instead, use the special statements provided
in your software’s analysis procedure to perform subgroup analyses.

We can use `subset` to produce correct variance estimates.

``` r
nhanes<-subset(nhanes_all,svy_subpop_htn == 1)
```

# Doing Imputation and logistic regression at the Same Time

``` r
# adj for pregnant missing
my_dat <- my_dat %>% 
  mutate(pregnant = ifelse(is.na(pregnant), 0, pregnant))

#create five imputations. The imputations object contains all five
#complete datasets.
imputations <- mice(my_dat, 5, printFlag=FALSE)

lm_svy_mi <- function(formula, imputations) {
  
  #setting up null objects allows us to easily add results
  #later
  b <- se <-  NULL
  
  #now loop through our imputations and run the model
  for(i in 1:imputations$m) {
    #grab the complete dataset
    imputation <- complete(imputations, i)
    #create the design effect object
    svy <- svydesign(data=my_dat,id=~svy_id, strata=~svy_strata, weights=~svy_weight_mec, nest=TRUE)
    imputation.svy<-subset(svy,svy_subpop_htn == 1)
    #run the model
    model <- svyglm(formula, design=imputation.svy,family=quasibinomial)
    #collect the results
    b <- cbind(b, coef(model))
    se <- cbind(se, summary(model)$coef[,2])
  }
  
  #now pool the results
  b.pool <- apply(b, 1, mean)
  between.var <- apply(b, 1, var)
  within.var <- apply(se^2, 1, mean)
  se.pool <- sqrt(within.var+between.var+between.var/imputations$m) 
  t.pool <- b.pool/se.pool 
  pvalue.pool <- (1-pnorm(abs(t.pool)))*2 
  coefficients <- data.frame(b.pool, se.pool, t.pool, pvalue.pool)
  
  #we can also grap n and p from the last model since 
  #they should be the same across all iterations
  n <- nobs(model)
  p <- length(model$coefficients)-1
  
  #return everything in a list
  return(list(coef=coefficients,
              n=n))
}

#now lets try the model out
lm_svy_mi(bp_uncontrolled_140_90~svy_year+demo_age_years+demo_race+female+pregnant+cc_bmi+cc_diabetes+cc_ckd+cc_cvd_any+bp_med_use+htn_aware+cc_smoke, imputations)
```

    ## $coef
    ##                                    b.pool     se.pool      t.pool  pvalue.pool
    ## (Intercept)                   -4.45249021 0.089699331 -49.6379422 0.000000e+00
    ## svy_year2001-2002             -0.13207038 0.072028046  -1.8335966 6.671390e-02
    ## svy_year2003-2004             -0.17653369 0.073789776  -2.3923868 1.673919e-02
    ## svy_year2005-2006             -0.31204348 0.074016470  -4.2158655 2.488220e-05
    ## svy_year2007-2008             -0.42835597 0.071685713  -5.9754720 2.294249e-09
    ## svy_year2009-2010             -0.60441550 0.072044467  -8.3894783 0.000000e+00
    ## svy_year2011-2012             -0.58679776 0.078885334  -7.4386166 1.016964e-13
    ## svy_year2013-2014             -0.66563211 0.074020885  -8.9924905 0.000000e+00
    ## svy_year2015-2016             -0.50756634 0.076491048  -6.6356306 3.231171e-11
    ## svy_year2017-2020             -0.46606156 0.072247058  -6.4509417 1.111573e-10
    ## demo_age_years                 0.05150787 0.001186082  43.4269126 0.000000e+00
    ## demo_raceHispanic/Asian/Other  0.21917142 0.039888771   5.4945643 3.916763e-08
    ## demo_raceNon-Hispanic Black    0.67131000 0.037371545  17.9631320 0.000000e+00
    ## female                        -0.19143379 0.034571649  -5.5373056 3.071603e-08
    ## pregnant                      -1.62936467 0.430609921  -3.7838531 1.544190e-04
    ## cc_bmi25 to <30                0.04754081 0.044090315   1.0782596 2.809179e-01
    ## cc_bmi30+                      0.24552229 0.043828787   5.6018501 2.120759e-08
    ## cc_diabetes                   -0.05927520 0.048111729  -1.2320322 2.179371e-01
    ## cc_ckd                         0.47106534 0.041741785  11.2852226 0.000000e+00
    ## cc_cvd_any                    -0.29757056 0.050219897  -5.9253519 3.116293e-09
    ## bp_med_use                    -0.61359137 0.057311022 -10.7063414 0.000000e+00
    ## htn_aware                      1.39141977 0.053385802  26.0634796 0.000000e+00
    ## cc_smokeFormer/Current        -0.03019251 0.034913206  -0.8647878 3.871553e-01
    ## 
    ## $n
    ## [1] 51977

if not doing imputation

``` r
fit<-svyglm(bp_uncontrolled_140_90~svy_year+demo_age_years+demo_race+female+pregnant+cc_bmi+cc_diabetes+cc_ckd+cc_cvd_any+bp_med_use+htn_aware+cc_smoke, 
            design=nhanes,family=quasibinomial)

summary(fit)
```

    ## 
    ## Call:
    ## svyglm(formula = bp_uncontrolled_140_90 ~ svy_year + demo_age_years + 
    ##     demo_race + female + pregnant + cc_bmi + cc_diabetes + cc_ckd + 
    ##     cc_cvd_any + bp_med_use + htn_aware + cc_smoke, design = nhanes, 
    ##     family = quasibinomial)
    ## 
    ## Survey design:
    ## subset(nhanes_all, svy_subpop_htn == 1)
    ## 
    ## Coefficients:
    ##                               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -4.43901    0.08995 -49.350  < 2e-16 ***
    ## svy_year2001-2002             -0.13478    0.07229  -1.865 0.062255 .  
    ## svy_year2003-2004             -0.18161    0.07411  -2.450 0.014271 *  
    ## svy_year2005-2006             -0.31550    0.07423  -4.250 2.14e-05 ***
    ## svy_year2007-2008             -0.43123    0.07183  -6.003 1.94e-09 ***
    ## svy_year2009-2010             -0.61022    0.07225  -8.446  < 2e-16 ***
    ## svy_year2011-2012             -0.59037    0.07907  -7.467 8.36e-14 ***
    ## svy_year2013-2014             -0.66958    0.07423  -9.021  < 2e-16 ***
    ## svy_year2015-2016             -0.51119    0.07668  -6.666 2.65e-11 ***
    ## svy_year2017-2020             -0.47149    0.07241  -6.511 7.52e-11 ***
    ## demo_age_years                 0.05139    0.00119  43.188  < 2e-16 ***
    ## demo_raceHispanic/Asian/Other  0.21647    0.03996   5.417 6.10e-08 ***
    ## demo_raceNon-Hispanic Black    0.66939    0.03743  17.882  < 2e-16 ***
    ## female                        -0.18915    0.03465  -5.459 4.80e-08 ***
    ## pregnant                      -1.63381    0.43061  -3.794 0.000148 ***
    ## cc_bmi25 to <30                0.04513    0.04416   1.022 0.306772    
    ## cc_bmi30+                      0.23926    0.04394   5.445 5.21e-08 ***
    ## cc_diabetes                   -0.05626    0.04818  -1.168 0.242998    
    ## cc_ckd                         0.47253    0.04181  11.303  < 2e-16 ***
    ## cc_cvd_any                    -0.29758    0.05029  -5.917 3.30e-09 ***
    ## bp_med_use                    -0.61572    0.05748 -10.712  < 2e-16 ***
    ## htn_aware                      1.39295    0.05358  25.996  < 2e-16 ***
    ## cc_smokeFormer/Current        -0.02993    0.03499  -0.856 0.392263    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for quasibinomial family taken to be 0.9539904)
    ## 
    ## Number of Fisher Scoring iterations: 6

# Lasso

# Fit model

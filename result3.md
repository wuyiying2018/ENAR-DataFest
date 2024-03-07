result3
================
Yi Huang, YiyingWu
2024-02-20

## This document shows the modified result of the code

## CardioStatsUSA

To install CardioStatsUSA, run this

``` r
install.packages("CardioStatsUSA")
```

## R packages

``` r
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE,include=TRUE)
# INSTALL PACKAGES
packages <- c("tidyverse", "dplyr", "knitr", "kableExtra", "cardioStatsUSA", 
              "survey", "gtsummary", "mice", "stargazer", "texreg", "jtools", 
              "haven", "gridExtra", "r2rtf","gt","officer","flextable")

# Install missing packages
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages], dependencies = TRUE)
}

# Load packages invisibly
invisible(lapply(packages, library, character.only = TRUE))

# # Remove variables associated with package installation
# rm(packages, installed_packages)
```

## data

## data cleaning

**combine categories**

### recode categorical data

### select the relavent variables

**check variables**

<div id="lufpwzxong" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#lufpwzxong table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#lufpwzxong thead, #lufpwzxong tbody, #lufpwzxong tfoot, #lufpwzxong tr, #lufpwzxong td, #lufpwzxong th {
  border-style: none;
}
&#10;#lufpwzxong p {
  margin: 0;
  padding: 0;
}
&#10;#lufpwzxong .gt_table {
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
&#10;#lufpwzxong .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#lufpwzxong .gt_title {
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
&#10;#lufpwzxong .gt_subtitle {
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
&#10;#lufpwzxong .gt_heading {
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
&#10;#lufpwzxong .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#lufpwzxong .gt_col_headings {
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
&#10;#lufpwzxong .gt_col_heading {
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
&#10;#lufpwzxong .gt_column_spanner_outer {
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
&#10;#lufpwzxong .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#lufpwzxong .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#lufpwzxong .gt_column_spanner {
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
&#10;#lufpwzxong .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#lufpwzxong .gt_group_heading {
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
&#10;#lufpwzxong .gt_empty_group_heading {
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
&#10;#lufpwzxong .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#lufpwzxong .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#lufpwzxong .gt_row {
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
&#10;#lufpwzxong .gt_stub {
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
&#10;#lufpwzxong .gt_stub_row_group {
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
&#10;#lufpwzxong .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#lufpwzxong .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#lufpwzxong .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lufpwzxong .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#lufpwzxong .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#lufpwzxong .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#lufpwzxong .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lufpwzxong .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#lufpwzxong .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#lufpwzxong .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#lufpwzxong .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#lufpwzxong .gt_footnotes {
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
&#10;#lufpwzxong .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lufpwzxong .gt_sourcenotes {
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
&#10;#lufpwzxong .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lufpwzxong .gt_left {
  text-align: left;
}
&#10;#lufpwzxong .gt_center {
  text-align: center;
}
&#10;#lufpwzxong .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#lufpwzxong .gt_font_normal {
  font-weight: normal;
}
&#10;#lufpwzxong .gt_font_bold {
  font-weight: bold;
}
&#10;#lufpwzxong .gt_font_italic {
  font-style: italic;
}
&#10;#lufpwzxong .gt_super {
  font-size: 65%;
}
&#10;#lufpwzxong .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#lufpwzxong .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#lufpwzxong .gt_indent_1 {
  text-indent: 5px;
}
&#10;#lufpwzxong .gt_indent_2 {
  text-indent: 10px;
}
&#10;#lufpwzxong .gt_indent_3 {
  text-indent: 15px;
}
&#10;#lufpwzxong .gt_indent_4 {
  text-indent: 20px;
}
&#10;#lufpwzxong .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 20,409&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 20,409</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Respondent sequence number</td>
<td headers="stat_0" class="gt_row gt_center">58,206 (31,382, 85,543)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-PSU</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">10,131 (50%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">9,985 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    3</td>
<td headers="stat_0" class="gt_row gt_center">293 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-Stratum</td>
<td headers="stat_0" class="gt_row gt_center">83 (44, 122)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Full Sample 2 Year MEC Exam Weight</td>
<td headers="stat_0" class="gt_row gt_center">22,403 (12,297, 40,523)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Subpopulation for hypertension</td>
<td headers="stat_0" class="gt_row gt_center">19,377 (95%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">NHANES cycle</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1999-2000</td>
<td headers="stat_0" class="gt_row gt_center">1,598 (7.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2001-2002</td>
<td headers="stat_0" class="gt_row gt_center">1,690 (8.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2003-2004</td>
<td headers="stat_0" class="gt_row gt_center">1,765 (8.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2005-2006</td>
<td headers="stat_0" class="gt_row gt_center">1,593 (7.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2007-2008</td>
<td headers="stat_0" class="gt_row gt_center">2,184 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2009-2010</td>
<td headers="stat_0" class="gt_row gt_center">2,189 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2011-2012</td>
<td headers="stat_0" class="gt_row gt_center">1,904 (9.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2013-2014</td>
<td headers="stat_0" class="gt_row gt_center">2,015 (9.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2015-2016</td>
<td headers="stat_0" class="gt_row gt_center">2,015 (9.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2017-2020</td>
<td headers="stat_0" class="gt_row gt_center">3,456 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_age_cat</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    18 to 44</td>
<td headers="stat_0" class="gt_row gt_center">2,519 (12%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    45 to 64</td>
<td headers="stat_0" class="gt_row gt_center">8,160 (40%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    65+</td>
<td headers="stat_0" class="gt_row gt_center">9,730 (48%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age at Screening Adjudicated - Recode</td>
<td headers="stat_0" class="gt_row gt_center">64 (53, 74)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_race</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic White</td>
<td headers="stat_0" class="gt_row gt_center">9,056 (44%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Hispanic/Asian/Other</td>
<td headers="stat_0" class="gt_row gt_center">5,716 (28%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic Black</td>
<td headers="stat_0" class="gt_row gt_center">5,637 (28%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">pregnant</td>
<td headers="stat_0" class="gt_row gt_center">34 (0.2%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">96</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">female</td>
<td headers="stat_0" class="gt_row gt_center">10,435 (51%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_140_90</td>
<td headers="stat_0" class="gt_row gt_center">11,082 (54%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_130_80</td>
<td headers="stat_0" class="gt_row gt_center">14,381 (70%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_accaha</td>
<td headers="stat_0" class="gt_row gt_center">20,409 (100%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_aware</td>
<td headers="stat_0" class="gt_row gt_center">16,297 (80%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">35</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_resistant_accaha</td>
<td headers="stat_0" class="gt_row gt_center">2,723 (13%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_resistant_accaha_thz</td>
<td headers="stat_0" class="gt_row gt_center">1,580 (7.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_use</td>
<td headers="stat_0" class="gt_row gt_center">14,690 (72%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">38</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_recommended_accaha</td>
<td headers="stat_0" class="gt_row gt_center">20,409 (100%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_n_class</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    None</td>
<td headers="stat_0" class="gt_row gt_center">5,354 (27%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    One</td>
<td headers="stat_0" class="gt_row gt_center">5,733 (28%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Two or more</td>
<td headers="stat_0" class="gt_row gt_center">9,103 (45%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_n_pills</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    None</td>
<td headers="stat_0" class="gt_row gt_center">5,354 (27%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    One</td>
<td headers="stat_0" class="gt_row gt_center">7,265 (36%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Two or more</td>
<td headers="stat_0" class="gt_row gt_center">7,571 (37%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_combination</td>
<td headers="stat_0" class="gt_row gt_center">3,100 (15%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_pills_gteq_2</td>
<td headers="stat_0" class="gt_row gt_center">7,571 (37%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ace</td>
<td headers="stat_0" class="gt_row gt_center">6,296 (31%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_aldo</td>
<td headers="stat_0" class="gt_row gt_center">319 (1.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_alpha</td>
<td headers="stat_0" class="gt_row gt_center">622 (3.1%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_angioten</td>
<td headers="stat_0" class="gt_row gt_center">20,190 (100%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_beta</td>
<td headers="stat_0" class="gt_row gt_center">5,534 (27%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ccb</td>
<td headers="stat_0" class="gt_row gt_center">4,919 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ccb_dh</td>
<td headers="stat_0" class="gt_row gt_center">3,923 (19%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_ccb_ndh</td>
<td headers="stat_0" class="gt_row gt_center">1,018 (5.0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_central</td>
<td headers="stat_0" class="gt_row gt_center">469 (2.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_renin_inhibitors</td>
<td headers="stat_0" class="gt_row gt_center">25 (0.1%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_vasod</td>
<td headers="stat_0" class="gt_row gt_center">289 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_diur_loop</td>
<td headers="stat_0" class="gt_row gt_center">1,636 (8.1%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_diur_Ksparing</td>
<td headers="stat_0" class="gt_row gt_center">765 (3.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_diur_thz</td>
<td headers="stat_0" class="gt_row gt_center">4,986 (25%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">219</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_smoke</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">3,494 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former</td>
<td headers="stat_0" class="gt_row gt_center">6,536 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">10,295 (51%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">84</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_bmi</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt;25</td>
<td headers="stat_0" class="gt_row gt_center">4,045 (21%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    25 to &lt;30</td>
<td headers="stat_0" class="gt_row gt_center">6,525 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    30+</td>
<td headers="stat_0" class="gt_row gt_center">9,147 (46%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">692</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_diabetes</td>
<td headers="stat_0" class="gt_row gt_center">5,376 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_ckd</td>
<td headers="stat_0" class="gt_row gt_center">6,542 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_mi</td>
<td headers="stat_0" class="gt_row gt_center">1,748 (8.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">125</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_chd</td>
<td headers="stat_0" class="gt_row gt_center">2,588 (13%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">128</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_stroke</td>
<td headers="stat_0" class="gt_row gt_center">1,666 (8.2%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">116</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_ascvd</td>
<td headers="stat_0" class="gt_row gt_center">3,739 (18%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_hf</td>
<td headers="stat_0" class="gt_row gt_center">1,450 (7.2%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">189</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_any</td>
<td headers="stat_0" class="gt_row gt_center">4,241 (21%)</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR); n (%)</td>
    </tr>
  </tfoot>
</table>
</div>

### Create a new data frame that contains 10 predictors

<div id="ybuohyqcgz" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ybuohyqcgz table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ybuohyqcgz thead, #ybuohyqcgz tbody, #ybuohyqcgz tfoot, #ybuohyqcgz tr, #ybuohyqcgz td, #ybuohyqcgz th {
  border-style: none;
}
&#10;#ybuohyqcgz p {
  margin: 0;
  padding: 0;
}
&#10;#ybuohyqcgz .gt_table {
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
&#10;#ybuohyqcgz .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ybuohyqcgz .gt_title {
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
&#10;#ybuohyqcgz .gt_subtitle {
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
&#10;#ybuohyqcgz .gt_heading {
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
&#10;#ybuohyqcgz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ybuohyqcgz .gt_col_headings {
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
&#10;#ybuohyqcgz .gt_col_heading {
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
&#10;#ybuohyqcgz .gt_column_spanner_outer {
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
&#10;#ybuohyqcgz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ybuohyqcgz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ybuohyqcgz .gt_column_spanner {
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
&#10;#ybuohyqcgz .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ybuohyqcgz .gt_group_heading {
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
&#10;#ybuohyqcgz .gt_empty_group_heading {
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
&#10;#ybuohyqcgz .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ybuohyqcgz .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ybuohyqcgz .gt_row {
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
&#10;#ybuohyqcgz .gt_stub {
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
&#10;#ybuohyqcgz .gt_stub_row_group {
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
&#10;#ybuohyqcgz .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ybuohyqcgz .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ybuohyqcgz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ybuohyqcgz .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ybuohyqcgz .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ybuohyqcgz .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ybuohyqcgz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ybuohyqcgz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ybuohyqcgz .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ybuohyqcgz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ybuohyqcgz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ybuohyqcgz .gt_footnotes {
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
&#10;#ybuohyqcgz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ybuohyqcgz .gt_sourcenotes {
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
&#10;#ybuohyqcgz .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ybuohyqcgz .gt_left {
  text-align: left;
}
&#10;#ybuohyqcgz .gt_center {
  text-align: center;
}
&#10;#ybuohyqcgz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ybuohyqcgz .gt_font_normal {
  font-weight: normal;
}
&#10;#ybuohyqcgz .gt_font_bold {
  font-weight: bold;
}
&#10;#ybuohyqcgz .gt_font_italic {
  font-style: italic;
}
&#10;#ybuohyqcgz .gt_super {
  font-size: 65%;
}
&#10;#ybuohyqcgz .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ybuohyqcgz .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ybuohyqcgz .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ybuohyqcgz .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ybuohyqcgz .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ybuohyqcgz .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ybuohyqcgz .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 20,409&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 20,409</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Respondent sequence number</td>
<td headers="stat_0" class="gt_row gt_center">58,206 (31,382, 85,543)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Full Sample 2 Year MEC Exam Weight</td>
<td headers="stat_0" class="gt_row gt_center">22,403 (12,297, 40,523)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-PSU</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">10,131 (50%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">9,985 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    3</td>
<td headers="stat_0" class="gt_row gt_center">293 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-Stratum</td>
<td headers="stat_0" class="gt_row gt_center">83 (44, 122)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">NHANES cycle</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1999-2000</td>
<td headers="stat_0" class="gt_row gt_center">1,598 (7.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2001-2002</td>
<td headers="stat_0" class="gt_row gt_center">1,690 (8.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2003-2004</td>
<td headers="stat_0" class="gt_row gt_center">1,765 (8.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2005-2006</td>
<td headers="stat_0" class="gt_row gt_center">1,593 (7.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2007-2008</td>
<td headers="stat_0" class="gt_row gt_center">2,184 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2009-2010</td>
<td headers="stat_0" class="gt_row gt_center">2,189 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2011-2012</td>
<td headers="stat_0" class="gt_row gt_center">1,904 (9.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2013-2014</td>
<td headers="stat_0" class="gt_row gt_center">2,015 (9.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2015-2016</td>
<td headers="stat_0" class="gt_row gt_center">2,015 (9.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2017-2020</td>
<td headers="stat_0" class="gt_row gt_center">3,456 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Subpopulation for hypertension</td>
<td headers="stat_0" class="gt_row gt_center">19,377 (95%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_140_90</td>
<td headers="stat_0" class="gt_row gt_center">11,082 (54%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_130_80</td>
<td headers="stat_0" class="gt_row gt_center">14,381 (70%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age at Screening Adjudicated - Recode</td>
<td headers="stat_0" class="gt_row gt_center">64 (53, 74)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_race</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic White</td>
<td headers="stat_0" class="gt_row gt_center">9,056 (44%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Hispanic/Asian/Other</td>
<td headers="stat_0" class="gt_row gt_center">5,716 (28%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic Black</td>
<td headers="stat_0" class="gt_row gt_center">5,637 (28%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">female</td>
<td headers="stat_0" class="gt_row gt_center">10,435 (51%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_bmi</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt;25</td>
<td headers="stat_0" class="gt_row gt_center">4,045 (21%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    25 to &lt;30</td>
<td headers="stat_0" class="gt_row gt_center">6,525 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    30+</td>
<td headers="stat_0" class="gt_row gt_center">9,147 (46%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">692</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_diabetes</td>
<td headers="stat_0" class="gt_row gt_center">5,376 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_ckd</td>
<td headers="stat_0" class="gt_row gt_center">6,542 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_any</td>
<td headers="stat_0" class="gt_row gt_center">4,241 (21%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_use</td>
<td headers="stat_0" class="gt_row gt_center">14,690 (72%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">38</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_aware</td>
<td headers="stat_0" class="gt_row gt_center">16,297 (80%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">35</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_smoke</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">3,494 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former</td>
<td headers="stat_0" class="gt_row gt_center">6,536 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">10,295 (51%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">84</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR); n (%)</td>
    </tr>
  </tfoot>
</table>
</div>
<div id="xmjfsxqmep" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#xmjfsxqmep table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#xmjfsxqmep thead, #xmjfsxqmep tbody, #xmjfsxqmep tfoot, #xmjfsxqmep tr, #xmjfsxqmep td, #xmjfsxqmep th {
  border-style: none;
}
&#10;#xmjfsxqmep p {
  margin: 0;
  padding: 0;
}
&#10;#xmjfsxqmep .gt_table {
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
&#10;#xmjfsxqmep .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#xmjfsxqmep .gt_title {
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
&#10;#xmjfsxqmep .gt_subtitle {
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
&#10;#xmjfsxqmep .gt_heading {
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
&#10;#xmjfsxqmep .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xmjfsxqmep .gt_col_headings {
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
&#10;#xmjfsxqmep .gt_col_heading {
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
&#10;#xmjfsxqmep .gt_column_spanner_outer {
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
&#10;#xmjfsxqmep .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#xmjfsxqmep .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#xmjfsxqmep .gt_column_spanner {
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
&#10;#xmjfsxqmep .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#xmjfsxqmep .gt_group_heading {
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
&#10;#xmjfsxqmep .gt_empty_group_heading {
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
&#10;#xmjfsxqmep .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#xmjfsxqmep .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#xmjfsxqmep .gt_row {
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
&#10;#xmjfsxqmep .gt_stub {
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
&#10;#xmjfsxqmep .gt_stub_row_group {
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
&#10;#xmjfsxqmep .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#xmjfsxqmep .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#xmjfsxqmep .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xmjfsxqmep .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#xmjfsxqmep .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#xmjfsxqmep .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xmjfsxqmep .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xmjfsxqmep .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#xmjfsxqmep .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#xmjfsxqmep .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#xmjfsxqmep .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xmjfsxqmep .gt_footnotes {
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
&#10;#xmjfsxqmep .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xmjfsxqmep .gt_sourcenotes {
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
&#10;#xmjfsxqmep .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xmjfsxqmep .gt_left {
  text-align: left;
}
&#10;#xmjfsxqmep .gt_center {
  text-align: center;
}
&#10;#xmjfsxqmep .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#xmjfsxqmep .gt_font_normal {
  font-weight: normal;
}
&#10;#xmjfsxqmep .gt_font_bold {
  font-weight: bold;
}
&#10;#xmjfsxqmep .gt_font_italic {
  font-style: italic;
}
&#10;#xmjfsxqmep .gt_super {
  font-size: 65%;
}
&#10;#xmjfsxqmep .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#xmjfsxqmep .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#xmjfsxqmep .gt_indent_1 {
  text-indent: 5px;
}
&#10;#xmjfsxqmep .gt_indent_2 {
  text-indent: 10px;
}
&#10;#xmjfsxqmep .gt_indent_3 {
  text-indent: 15px;
}
&#10;#xmjfsxqmep .gt_indent_4 {
  text-indent: 20px;
}
&#10;#xmjfsxqmep .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 16,297&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 16,297</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Respondent sequence number</td>
<td headers="stat_0" class="gt_row gt_center">60,044 (34,607, 86,120)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Full Sample 2 Year MEC Exam Weight</td>
<td headers="stat_0" class="gt_row gt_center">22,210 (12,230, 40,380)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-PSU</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">8,089 (50%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">7,979 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    3</td>
<td headers="stat_0" class="gt_row gt_center">229 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-Stratum</td>
<td headers="stat_0" class="gt_row gt_center">85 (47, 123)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">NHANES cycle</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1999-2000</td>
<td headers="stat_0" class="gt_row gt_center">1,105 (6.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2001-2002</td>
<td headers="stat_0" class="gt_row gt_center">1,214 (7.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2003-2004</td>
<td headers="stat_0" class="gt_row gt_center">1,357 (8.3%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2005-2006</td>
<td headers="stat_0" class="gt_row gt_center">1,253 (7.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2007-2008</td>
<td headers="stat_0" class="gt_row gt_center">1,750 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2009-2010</td>
<td headers="stat_0" class="gt_row gt_center">1,826 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2011-2012</td>
<td headers="stat_0" class="gt_row gt_center">1,584 (9.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2013-2014</td>
<td headers="stat_0" class="gt_row gt_center">1,714 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2015-2016</td>
<td headers="stat_0" class="gt_row gt_center">1,665 (10%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2017-2020</td>
<td headers="stat_0" class="gt_row gt_center">2,829 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Subpopulation for hypertension</td>
<td headers="stat_0" class="gt_row gt_center">15,345 (94%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_140_90</td>
<td headers="stat_0" class="gt_row gt_center">6,970 (43%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_130_80</td>
<td headers="stat_0" class="gt_row gt_center">10,269 (63%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age at Screening Adjudicated - Recode</td>
<td headers="stat_0" class="gt_row gt_center">64 (54, 74)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_race</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic White</td>
<td headers="stat_0" class="gt_row gt_center">7,240 (44%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Hispanic/Asian/Other</td>
<td headers="stat_0" class="gt_row gt_center">4,368 (27%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic Black</td>
<td headers="stat_0" class="gt_row gt_center">4,689 (29%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">female</td>
<td headers="stat_0" class="gt_row gt_center">8,632 (53%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_bmi</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt;25</td>
<td headers="stat_0" class="gt_row gt_center">2,856 (18%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    25 to &lt;30</td>
<td headers="stat_0" class="gt_row gt_center">5,098 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    30+</td>
<td headers="stat_0" class="gt_row gt_center">7,778 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">565</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_diabetes</td>
<td headers="stat_0" class="gt_row gt_center">4,817 (30%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_ckd</td>
<td headers="stat_0" class="gt_row gt_center">5,560 (34%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_any</td>
<td headers="stat_0" class="gt_row gt_center">3,900 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_use</td>
<td headers="stat_0" class="gt_row gt_center">14,690 (90%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">3</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_aware</td>
<td headers="stat_0" class="gt_row gt_center">16,297 (100%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_smoke</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">2,683 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former</td>
<td headers="stat_0" class="gt_row gt_center">5,378 (33%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">8,199 (50%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">37</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR); n (%)</td>
    </tr>
  </tfoot>
</table>
</div>
<div id="fhermerkzi" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#fhermerkzi table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#fhermerkzi thead, #fhermerkzi tbody, #fhermerkzi tfoot, #fhermerkzi tr, #fhermerkzi td, #fhermerkzi th {
  border-style: none;
}
&#10;#fhermerkzi p {
  margin: 0;
  padding: 0;
}
&#10;#fhermerkzi .gt_table {
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
&#10;#fhermerkzi .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#fhermerkzi .gt_title {
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
&#10;#fhermerkzi .gt_subtitle {
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
&#10;#fhermerkzi .gt_heading {
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
&#10;#fhermerkzi .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#fhermerkzi .gt_col_headings {
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
&#10;#fhermerkzi .gt_col_heading {
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
&#10;#fhermerkzi .gt_column_spanner_outer {
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
&#10;#fhermerkzi .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#fhermerkzi .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#fhermerkzi .gt_column_spanner {
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
&#10;#fhermerkzi .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#fhermerkzi .gt_group_heading {
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
&#10;#fhermerkzi .gt_empty_group_heading {
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
&#10;#fhermerkzi .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#fhermerkzi .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#fhermerkzi .gt_row {
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
&#10;#fhermerkzi .gt_stub {
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
&#10;#fhermerkzi .gt_stub_row_group {
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
&#10;#fhermerkzi .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#fhermerkzi .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#fhermerkzi .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fhermerkzi .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#fhermerkzi .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#fhermerkzi .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#fhermerkzi .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fhermerkzi .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#fhermerkzi .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#fhermerkzi .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#fhermerkzi .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#fhermerkzi .gt_footnotes {
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
&#10;#fhermerkzi .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fhermerkzi .gt_sourcenotes {
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
&#10;#fhermerkzi .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fhermerkzi .gt_left {
  text-align: left;
}
&#10;#fhermerkzi .gt_center {
  text-align: center;
}
&#10;#fhermerkzi .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#fhermerkzi .gt_font_normal {
  font-weight: normal;
}
&#10;#fhermerkzi .gt_font_bold {
  font-weight: bold;
}
&#10;#fhermerkzi .gt_font_italic {
  font-style: italic;
}
&#10;#fhermerkzi .gt_super {
  font-size: 65%;
}
&#10;#fhermerkzi .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#fhermerkzi .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#fhermerkzi .gt_indent_1 {
  text-indent: 5px;
}
&#10;#fhermerkzi .gt_indent_2 {
  text-indent: 10px;
}
&#10;#fhermerkzi .gt_indent_3 {
  text-indent: 15px;
}
&#10;#fhermerkzi .gt_indent_4 {
  text-indent: 20px;
}
&#10;#fhermerkzi .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 14,690&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 14,690</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Respondent sequence number</td>
<td headers="stat_0" class="gt_row gt_center">60,385 (35,556, 86,405)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Full Sample 2 Year MEC Exam Weight</td>
<td headers="stat_0" class="gt_row gt_center">21,909 (12,174, 40,345)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-PSU</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">7,301 (50%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">7,184 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    3</td>
<td headers="stat_0" class="gt_row gt_center">205 (1.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Masked Variance Pseudo-Stratum</td>
<td headers="stat_0" class="gt_row gt_center">86 (49, 124)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">NHANES cycle</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1999-2000</td>
<td headers="stat_0" class="gt_row gt_center">951 (6.5%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2001-2002</td>
<td headers="stat_0" class="gt_row gt_center">1,056 (7.2%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2003-2004</td>
<td headers="stat_0" class="gt_row gt_center">1,201 (8.2%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2005-2006</td>
<td headers="stat_0" class="gt_row gt_center">1,112 (7.6%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2007-2008</td>
<td headers="stat_0" class="gt_row gt_center">1,603 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2009-2010</td>
<td headers="stat_0" class="gt_row gt_center">1,690 (12%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2011-2012</td>
<td headers="stat_0" class="gt_row gt_center">1,446 (9.8%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2013-2014</td>
<td headers="stat_0" class="gt_row gt_center">1,542 (10%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2015-2016</td>
<td headers="stat_0" class="gt_row gt_center">1,507 (10%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2017-2020</td>
<td headers="stat_0" class="gt_row gt_center">2,582 (18%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Subpopulation for hypertension</td>
<td headers="stat_0" class="gt_row gt_center">13,747 (94%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_140_90</td>
<td headers="stat_0" class="gt_row gt_center">5,363 (37%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_uncontrolled_130_80</td>
<td headers="stat_0" class="gt_row gt_center">8,662 (59%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age at Screening Adjudicated - Recode</td>
<td headers="stat_0" class="gt_row gt_center">65 (55, 74)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_race</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic White</td>
<td headers="stat_0" class="gt_row gt_center">6,616 (45%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Hispanic/Asian/Other</td>
<td headers="stat_0" class="gt_row gt_center">3,863 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Non-Hispanic Black</td>
<td headers="stat_0" class="gt_row gt_center">4,211 (29%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">female</td>
<td headers="stat_0" class="gt_row gt_center">7,939 (54%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_bmi</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt;25</td>
<td headers="stat_0" class="gt_row gt_center">2,497 (18%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    25 to &lt;30</td>
<td headers="stat_0" class="gt_row gt_center">4,591 (32%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    30+</td>
<td headers="stat_0" class="gt_row gt_center">7,079 (50%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">523</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_diabetes</td>
<td headers="stat_0" class="gt_row gt_center">4,611 (31%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_ckd</td>
<td headers="stat_0" class="gt_row gt_center">5,127 (35%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_cvd_any</td>
<td headers="stat_0" class="gt_row gt_center">3,704 (25%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_use</td>
<td headers="stat_0" class="gt_row gt_center">14,690 (100%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_aware</td>
<td headers="stat_0" class="gt_row gt_center">14,690 (100%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">cc_smoke</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">2,284 (16%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former</td>
<td headers="stat_0" class="gt_row gt_center">4,947 (34%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">7,439 (51%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">20</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR); n (%)</td>
    </tr>
  </tfoot>
</table>
</div>

### missing values

survey weights are calibrated within race, gender, and age groups to
account for missing information on SBP, DBP or self-reported
antihypertensive medication use:
<https://www.sciencedirect.com/science/article/pii/S027263860350004X?casa_token=U-KIitsxOGEAAAAA:jVZ1jyZmsVzR6BGEFVWUTjCh3wfKqvF1JXOLL55qFOu4Dk8giNQSfyU4pGS05Xl4DfM8uiwfPQ>

# survey design

**Notes**:

- combine weight in many years, refer to
  <https://wwwn.cdc.gov/nchs/nhanes/tutorials/Weighting.aspx>
- The weight in the dataset is: **Full sample 2 year MEC exam weight**
  (2-year weight?)
- However, for all analyses that combine 1999-2000 with other survey
  cycles, you must start by using the 4-year weights provided by NCHS
  for 1999-2002, then include the 2-year weights for each additional
  2-year cycle that is combined. (refer to larger nhance dataset to find
  4-year weights???)

## weight adjustment for years

Since we must start by using the 4-year weights provided by NCHS for
1999-2002”, and use 2-year weights for all observations from 1999-2016.
Treat 2017-2020Mar as 3.2 years.

We refer to NHANES 1999-2000 and 2001-2002 and get the 4-year weights

Combining nine survey cycles + one 3.2 year survey cycle (18+3.2 years:
1999-2016 2017-2020Mar)

## define survey design

## for blood pressure and hypertension sub-population

According to
<https://wwwn.cdc.gov/nchs/nhanes/tutorials/VarianceEstimation.aspx>, As
a general rule when working with complex survey data such as NHANES, you
should never drop records from your analysis dataset before executing
your analysis procedures. Instead, use the special statements provided
in your software’s analysis procedure to perform subgroup analyses.

We can use `subset` to produce correct variance estimates.

For the variable `htn_aware`, its analysis should be confined to the
subpopulation with high blood pressure, as awareness of hypertension is
not applicable to healthy individuals. Consequently, our focus will be
on this specific group for this variable.

We can use the 140/90 cut off

Similarly, the variable `bp_med_use` should be examined within the
subset of the population that is aware of their high blood pressure
condition. This ensures that the analysis is relevant and targeted to
the appropriate group.

# Doing Imputation and logistic regression at the Same Time

## create the design effect object

    ## $coef
    ##                                     b.pool     se.pool     lower.ci
    ## (Intercept)                    1.440794422 0.174987705  1.097818521
    ## svy_year2001-2002             -0.174177313 0.139819581 -0.448223692
    ## svy_year2003-2004             -0.374729806 0.152859929 -0.674335267
    ## svy_year2005-2006             -0.534553084 0.140721968 -0.810368141
    ## svy_year2007-2008             -0.717822194 0.138595362 -0.989469105
    ## svy_year2009-2010             -0.904000149 0.136901862 -1.172327799
    ## svy_year2011-2012             -0.868984835 0.155170516 -1.173119047
    ## svy_year2013-2014             -0.952827230 0.161021892 -1.268430139
    ## svy_year2015-2016             -0.697805787 0.152743647 -0.997183336
    ## svy_year2017-2020             -0.712823099 0.132806418 -0.973123678
    ## demo_age_years                -0.001915965 0.001596255 -0.005044624
    ## demo_raceHispanic/Asian/Other  0.359811722 0.053080585  0.255773775
    ## demo_raceNon-Hispanic Black    0.361846906 0.047759925  0.268237453
    ## female                        -0.177633463 0.040968825 -0.257932360
    ## cc_bmi25 to <30               -0.473436781 0.067031538 -0.604818595
    ## cc_bmi30+                     -0.690097950 0.062206585 -0.812022857
    ## cc_diabetes                   -0.392762856 0.059476829 -0.509337442
    ## cc_ckd                         0.360653057 0.047095441  0.268345992
    ## cc_cvd_any                    -0.427621861 0.052288955 -0.530108214
    ##                                   upper.ci     t.pool  pvalue.pool
    ## (Intercept)                    1.783770323   8.233689 2.220446e-16
    ## svy_year2001-2002              0.099869066  -1.245729 2.128639e-01
    ## svy_year2003-2004             -0.075124345  -2.451459 1.422785e-02
    ## svy_year2005-2006             -0.258738028  -3.798647 1.454881e-04
    ## svy_year2007-2008             -0.446175284  -5.179266 2.227611e-07
    ## svy_year2009-2010             -0.635672500  -6.603271 4.021827e-11
    ## svy_year2011-2012             -0.564850624  -5.600193 2.141133e-08
    ## svy_year2013-2014             -0.637224321  -5.917377 3.271165e-09
    ## svy_year2015-2016             -0.398428239  -4.568477 4.912818e-06
    ## svy_year2017-2020             -0.452522520  -5.367384 7.988666e-08
    ## demo_age_years                 0.001212695  -1.200288 2.300277e-01
    ## demo_raceHispanic/Asian/Other  0.463849670   6.778594 1.213518e-11
    ## demo_raceNon-Hispanic Black    0.455456359   7.576371 3.552714e-14
    ## female                        -0.097334566  -4.335820 1.452175e-05
    ## cc_bmi25 to <30               -0.342054967  -7.062896 1.630696e-12
    ## cc_bmi30+                     -0.568173043 -11.093648 0.000000e+00
    ## cc_diabetes                   -0.276188271  -6.603628 4.012146e-11
    ## cc_ckd                         0.452960123   7.657919 1.887379e-14
    ## cc_cvd_any                    -0.325135508  -8.178053 2.220446e-16
    ## 
    ## $n
    ## [1] 18818
    ## 
    ## $R2MF
    ## [1] 0.03875694
    ## 
    ## $R2CU
    ## [1] 0.06960472
    ## 
    ## $aic
    ## [1] 25013.74

### awareness

    ## $coef
    ##                                    b.pool     se.pool    lower.ci    upper.ci
    ## (Intercept)                   -1.08789143 0.174959881 -1.43081280 -0.74497006
    ## svy_year2001-2002              0.09710851 0.139229153 -0.17578062  0.36999765
    ## svy_year2003-2004              0.30613365 0.144089037  0.02371913  0.58854816
    ## svy_year2005-2006              0.45287818 0.154878735  0.14931586  0.75644050
    ## svy_year2007-2008              0.55065923 0.135980721  0.28413702  0.81718144
    ## svy_year2009-2010              0.63951320 0.144166405  0.35694704  0.92207935
    ## svy_year2011-2012              0.69604616 0.165125604  0.37239998  1.01969234
    ## svy_year2013-2014              0.85659282 0.145743429  0.57093570  1.14224994
    ## svy_year2015-2016              0.60548657 0.146690232  0.31797372  0.89299943
    ## svy_year2017-2020              0.45325114 0.130428888  0.19761052  0.70889177
    ## demo_age_years                 0.01513907 0.001969542  0.01127876  0.01899937
    ## demo_raceHispanic/Asian/Other -0.23759554 0.064136101 -0.36330229 -0.11188878
    ## demo_raceNon-Hispanic Black    0.11016108 0.061565775 -0.01050784  0.23083000
    ## female                         0.32354640 0.056463011  0.21287890  0.43421390
    ## cc_bmi25 to <30                0.53069683 0.073560855  0.38651755  0.67487610
    ## cc_bmi30+                      1.00548870 0.064503175  0.87906247  1.13191492
    ## cc_diabetes                    0.70704017 0.082533188  0.54527512  0.86880521
    ## cc_ckd                         0.19926326 0.056744663  0.08804372  0.31048280
    ## cc_cvd_any                     1.14456148 0.081449098  0.98492125  1.30420171
    ##                                   t.pool  pvalue.pool
    ## (Intercept)                   -6.2179479 5.036986e-10
    ## svy_year2001-2002              0.6974726 4.855071e-01
    ## svy_year2003-2004              2.1246144 3.361880e-02
    ## svy_year2005-2006              2.9240824 3.454733e-03
    ## svy_year2007-2008              4.0495390 5.131863e-05
    ## svy_year2009-2010              4.4359377 9.167234e-06
    ## svy_year2011-2012              4.2152528 2.494986e-05
    ## svy_year2013-2014              5.8774027 4.167535e-09
    ## svy_year2015-2016              4.1276543 3.664825e-05
    ## svy_year2017-2020              3.4750825 5.106963e-04
    ## demo_age_years                 7.6865907 1.509903e-14
    ## demo_raceHispanic/Asian/Other -3.7045523 2.117645e-04
    ## demo_raceNon-Hispanic Black    1.7893234 7.356274e-02
    ## female                         5.7302364 1.002908e-08
    ## cc_bmi25 to <30                7.2143918 5.417888e-13
    ## cc_bmi30+                     15.5882047 0.000000e+00
    ## cc_diabetes                    8.5667376 0.000000e+00
    ## cc_ckd                         3.5115771 4.454563e-04
    ## cc_cvd_any                    14.0524758 0.000000e+00
    ## 
    ## $n
    ## [1] 18818
    ## 
    ## $R2MF
    ## [1] 0.08311685
    ## 
    ## $R2CU
    ## [1] 0.1277259
    ## 
    ## $aic
    ## [1] 17853.67

### med use

    ## $coef
    ##                                     b.pool     se.pool    lower.ci     upper.ci
    ## (Intercept)                   -1.396054682 0.239584331 -1.86563997 -0.926469394
    ## svy_year2001-2002             -0.041498464 0.206883495 -0.44699012  0.363993186
    ## svy_year2003-2004              0.005325693 0.220580373 -0.42701184  0.437663224
    ## svy_year2005-2006              0.064594874 0.216806926 -0.36034670  0.489536448
    ## svy_year2007-2008              0.350611323 0.212771451 -0.06642072  0.767643367
    ## svy_year2009-2010              0.739678183 0.214644460  0.31897504  1.160381324
    ## svy_year2011-2012              0.432299103 0.199148229  0.04196857  0.822629632
    ## svy_year2013-2014              0.232342440 0.230072042 -0.21859876  0.683283642
    ## svy_year2015-2016              0.298180272 0.199984652 -0.09378965  0.690150190
    ## svy_year2017-2020              0.435799287 0.189341039  0.06469085  0.806907723
    ## demo_age_years                 0.044552996 0.002701339  0.03925837  0.049847621
    ## demo_raceHispanic/Asian/Other -0.343990113 0.085538278 -0.51164514 -0.176335088
    ## demo_raceNon-Hispanic Black   -0.146751098 0.078060735 -0.29975014  0.006247942
    ## female                         0.461720905 0.068468765  0.32752213  0.595919684
    ## cc_bmi25 to <30                0.391546977 0.096686031  0.20204236  0.581051599
    ## cc_bmi30+                      0.530455364 0.111783663  0.31135939  0.749551342
    ## cc_diabetes                    0.843077613 0.121202612  0.60552049  1.080634733
    ## cc_ckd                        -0.257864120 0.093082439 -0.44030570 -0.075422540
    ## cc_cvd_any                     0.539703125 0.125285840  0.29414288  0.785263371
    ##                                   t.pool  pvalue.pool
    ## (Intercept)                   -5.8269866 5.643714e-09
    ## svy_year2001-2002             -0.2005886 8.410203e-01
    ## svy_year2003-2004              0.0241440 9.807377e-01
    ## svy_year2005-2006              0.2979373 7.657510e-01
    ## svy_year2007-2008              1.6478307 9.938742e-02
    ## svy_year2009-2010              3.4460623 5.688192e-04
    ## svy_year2011-2012              2.1707404 2.995080e-02
    ## svy_year2013-2014              1.0098682 3.125584e-01
    ## svy_year2015-2016              1.4910158 1.359574e-01
    ## svy_year2017-2020              2.3016631 2.135418e-02
    ## demo_age_years                16.4929282 0.000000e+00
    ## demo_raceHispanic/Asian/Other -4.0214758 5.783466e-05
    ## demo_raceNon-Hispanic Black   -1.8799605 6.011346e-02
    ## female                         6.7435261 1.545875e-11
    ## cc_bmi25 to <30                4.0496747 5.128887e-05
    ## cc_bmi30+                      4.7453747 2.081207e-06
    ## cc_diabetes                    6.9559360 3.502310e-12
    ## cc_ckd                        -2.7702768 5.600867e-03
    ## cc_cvd_any                     4.3077743 1.649055e-05
    ## 
    ## $n
    ## [1] 14904
    ## 
    ## $R2MF
    ## [1] 0.09627077
    ## 
    ## $R2CU
    ## [1] 0.1287267
    ## 
    ## $aic
    ## [1] 9274.373

## create result dataframe

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
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE)
# INSTALL PACKAGES
packages <- c("tidyverse", "dplyr", "knitr", "kableExtra", "cardioStatsUSA", 
              "survey", "gtsummary", "mice", "stargazer", "texreg", "jtools", 
              "haven", "gridExtra", "r2rtf","gt","officer","flextable", "ggplot2")

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

<div id="ijktwlvqoc" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ijktwlvqoc table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ijktwlvqoc thead, #ijktwlvqoc tbody, #ijktwlvqoc tfoot, #ijktwlvqoc tr, #ijktwlvqoc td, #ijktwlvqoc th {
  border-style: none;
}
&#10;#ijktwlvqoc p {
  margin: 0;
  padding: 0;
}
&#10;#ijktwlvqoc .gt_table {
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
&#10;#ijktwlvqoc .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ijktwlvqoc .gt_title {
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
&#10;#ijktwlvqoc .gt_subtitle {
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
&#10;#ijktwlvqoc .gt_heading {
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
&#10;#ijktwlvqoc .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ijktwlvqoc .gt_col_headings {
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
&#10;#ijktwlvqoc .gt_col_heading {
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
&#10;#ijktwlvqoc .gt_column_spanner_outer {
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
&#10;#ijktwlvqoc .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ijktwlvqoc .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ijktwlvqoc .gt_column_spanner {
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
&#10;#ijktwlvqoc .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ijktwlvqoc .gt_group_heading {
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
&#10;#ijktwlvqoc .gt_empty_group_heading {
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
&#10;#ijktwlvqoc .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ijktwlvqoc .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ijktwlvqoc .gt_row {
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
&#10;#ijktwlvqoc .gt_stub {
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
&#10;#ijktwlvqoc .gt_stub_row_group {
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
&#10;#ijktwlvqoc .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ijktwlvqoc .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ijktwlvqoc .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ijktwlvqoc .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ijktwlvqoc .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ijktwlvqoc .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ijktwlvqoc .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ijktwlvqoc .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ijktwlvqoc .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ijktwlvqoc .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ijktwlvqoc .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ijktwlvqoc .gt_footnotes {
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
&#10;#ijktwlvqoc .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ijktwlvqoc .gt_sourcenotes {
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
&#10;#ijktwlvqoc .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ijktwlvqoc .gt_left {
  text-align: left;
}
&#10;#ijktwlvqoc .gt_center {
  text-align: center;
}
&#10;#ijktwlvqoc .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ijktwlvqoc .gt_font_normal {
  font-weight: normal;
}
&#10;#ijktwlvqoc .gt_font_bold {
  font-weight: bold;
}
&#10;#ijktwlvqoc .gt_font_italic {
  font-style: italic;
}
&#10;#ijktwlvqoc .gt_super {
  font-size: 65%;
}
&#10;#ijktwlvqoc .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ijktwlvqoc .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ijktwlvqoc .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ijktwlvqoc .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ijktwlvqoc .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ijktwlvqoc .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ijktwlvqoc .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
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
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">11,615 (21%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former</td>
<td headers="stat_0" class="gt_row gt_center">13,694 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">31,331 (55%)</td></tr>
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
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR); n (%)</td>
    </tr>
  </tfoot>
</table>
</div>

### Preliminary Analysis

<img src="result_files/figure-gfm/unnamed-chunk-9-1.png" width="80%" />

### Create a new data frame that contains 11 predictors

<div id="gtvbpttkua" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#gtvbpttkua table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#gtvbpttkua thead, #gtvbpttkua tbody, #gtvbpttkua tfoot, #gtvbpttkua tr, #gtvbpttkua td, #gtvbpttkua th {
  border-style: none;
}
&#10;#gtvbpttkua p {
  margin: 0;
  padding: 0;
}
&#10;#gtvbpttkua .gt_table {
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
&#10;#gtvbpttkua .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#gtvbpttkua .gt_title {
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
&#10;#gtvbpttkua .gt_subtitle {
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
&#10;#gtvbpttkua .gt_heading {
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
&#10;#gtvbpttkua .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#gtvbpttkua .gt_col_headings {
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
&#10;#gtvbpttkua .gt_col_heading {
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
&#10;#gtvbpttkua .gt_column_spanner_outer {
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
&#10;#gtvbpttkua .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#gtvbpttkua .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#gtvbpttkua .gt_column_spanner {
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
&#10;#gtvbpttkua .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#gtvbpttkua .gt_group_heading {
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
&#10;#gtvbpttkua .gt_empty_group_heading {
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
&#10;#gtvbpttkua .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#gtvbpttkua .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#gtvbpttkua .gt_row {
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
&#10;#gtvbpttkua .gt_stub {
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
&#10;#gtvbpttkua .gt_stub_row_group {
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
&#10;#gtvbpttkua .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#gtvbpttkua .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#gtvbpttkua .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#gtvbpttkua .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#gtvbpttkua .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#gtvbpttkua .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#gtvbpttkua .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#gtvbpttkua .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#gtvbpttkua .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#gtvbpttkua .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#gtvbpttkua .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#gtvbpttkua .gt_footnotes {
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
&#10;#gtvbpttkua .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#gtvbpttkua .gt_sourcenotes {
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
&#10;#gtvbpttkua .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#gtvbpttkua .gt_left {
  text-align: left;
}
&#10;#gtvbpttkua .gt_center {
  text-align: center;
}
&#10;#gtvbpttkua .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#gtvbpttkua .gt_font_normal {
  font-weight: normal;
}
&#10;#gtvbpttkua .gt_font_bold {
  font-weight: bold;
}
&#10;#gtvbpttkua .gt_font_italic {
  font-style: italic;
}
&#10;#gtvbpttkua .gt_super {
  font-size: 65%;
}
&#10;#gtvbpttkua .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#gtvbpttkua .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#gtvbpttkua .gt_indent_1 {
  text-indent: 5px;
}
&#10;#gtvbpttkua .gt_indent_2 {
  text-indent: 10px;
}
&#10;#gtvbpttkua .gt_indent_3 {
  text-indent: 15px;
}
&#10;#gtvbpttkua .gt_indent_4 {
  text-indent: 20px;
}
&#10;#gtvbpttkua .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
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
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">11,615 (21%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Former</td>
<td headers="stat_0" class="gt_row gt_center">13,694 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">31,331 (55%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">3,159</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
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

# Plotting

All the variables used in plotting don’t have any missing values.

## plot 1: Weighted Trend of Blood Pressure Control Over Time

show the trend of uncontrolled blood pressure over the years, accounting
for survey design and weights.

<img src="result_files/figure-gfm/unnamed-chunk-16-1.png" width="80%" />

## plot 2: Weighted Distribution of Blood Pressure Control by race

<img src="result_files/figure-gfm/unnamed-chunk-17-1.png" width="80%" />

# Doing Imputation and logistic regression at the Same Time

    ## $coef
    ##                                    b.pool      se.pool    lower.ci
    ## (Intercept)                   -2.43432479 0.0632463433 -2.55828762
    ## svy_year2001-2002             -0.11426637 0.0582901921 -0.22851515
    ## svy_year2003-2004             -0.27028170 0.0595461635 -0.38699218
    ## svy_year2005-2006             -0.35906489 0.0590863286 -0.47487409
    ## svy_year2007-2008             -0.47684329 0.0577682660 -0.59006909
    ## svy_year2009-2010             -0.57991023 0.0570344508 -0.69169775
    ## svy_year2011-2012             -0.50998998 0.0629380504 -0.63334855
    ## svy_year2013-2014             -0.68354020 0.0579745847 -0.79717039
    ## svy_year2015-2016             -0.53593027 0.0616834810 -0.65682989
    ## svy_year2017-2020             -0.54238975 0.0587591256 -0.65755764
    ## demo_age_years                 0.04005547 0.0008778757  0.03833483
    ## demo_raceHispanic/Asian/Other  0.07740199 0.0298540176  0.01888811
    ## demo_raceNon-Hispanic Black    0.46664621 0.0297253511  0.40838452
    ## female                        -0.44871428 0.0269597755 -0.50155544
    ## cc_bmi25 to <30                0.20602748 0.0334690896  0.14042806
    ## cc_bmi30+                      0.54458914 0.0338678220  0.47820820
    ## cc_diabetes                   -0.09730799 0.0447127416 -0.18494496
    ## cc_ckd                         0.33756791 0.0388750077  0.26137289
    ## cc_cvd_any                    -0.37132604 0.0497795209 -0.46889390
    ## bp_med_use                    -0.56980796 0.0535171856 -0.67470164
    ## htn_aware                      1.21636197 0.0462906274  1.12563234
    ##                                    upper.ci     t.pool  pvalue.pool
    ## (Intercept)                   -2.310362e+00 -38.489574 0.000000e+00
    ## svy_year2001-2002             -1.759359e-05  -1.960302 4.996052e-02
    ## svy_year2003-2004             -1.535712e-01  -4.539028 5.651414e-06
    ## svy_year2005-2006             -2.432557e-01  -6.076954 1.224871e-09
    ## svy_year2007-2008             -3.636175e-01  -8.254416 2.220446e-16
    ## svy_year2009-2010             -4.681227e-01 -10.167718 0.000000e+00
    ## svy_year2011-2012             -3.866314e-01  -8.103047 4.440892e-16
    ## svy_year2013-2014             -5.699100e-01 -11.790342 0.000000e+00
    ## svy_year2015-2016             -4.150306e-01  -8.688392 0.000000e+00
    ## svy_year2017-2020             -4.272219e-01  -9.230732 0.000000e+00
    ## demo_age_years                 4.177610e-02  45.627720 0.000000e+00
    ## demo_raceHispanic/Asian/Other  1.359159e-01   2.592682 9.523065e-03
    ## demo_raceNon-Hispanic Black    5.249079e-01  15.698594 0.000000e+00
    ## female                        -3.958731e-01 -16.643843 0.000000e+00
    ## cc_bmi25 to <30                2.716269e-01   6.155754 7.472123e-10
    ## cc_bmi30+                      6.109701e-01  16.079839 0.000000e+00
    ## cc_diabetes                   -9.671017e-03  -2.176292 2.953342e-02
    ## cc_ckd                         4.137629e-01   8.683417 0.000000e+00
    ## cc_cvd_any                    -2.737582e-01  -7.459414 8.681944e-14
    ## bp_med_use                    -4.649143e-01 -10.647196 0.000000e+00
    ## htn_aware                      1.307092e+00  26.276636 0.000000e+00
    ## 
    ## $n
    ## [1] 54862
    ## 
    ## $R2MF
    ## [1] 0.138856
    ## 
    ## $R2CU
    ## [1] 0.2277175
    ## 
    ## $aic
    ## [1] 61895.47

    ## 
    ## =============================================
    ##                                Model 1       
    ## ---------------------------------------------
    ## (Intercept)                       -4.52 *    
    ##                                [-4.69; -4.36]
    ## svy_year2001-2002                 -0.14      
    ##                                [-0.27;  0.00]
    ## svy_year2003-2004                 -0.19 *    
    ##                                [-0.33; -0.05]
    ## svy_year2005-2006                 -0.32 *    
    ##                                [-0.46; -0.18]
    ## svy_year2007-2008                 -0.43 *    
    ##                                [-0.57; -0.30]
    ## svy_year2009-2010                 -0.61 *    
    ##                                [-0.75; -0.48]
    ## svy_year2011-2012                 -0.59 *    
    ##                                [-0.74; -0.44]
    ## svy_year2013-2014                 -0.67 *    
    ##                                [-0.81; -0.53]
    ## svy_year2015-2016                 -0.51 *    
    ##                                [-0.66; -0.36]
    ## svy_year2017-2020                 -0.47 *    
    ##                                [-0.61; -0.33]
    ## demo_age_years                     0.05 *    
    ##                                [ 0.05;  0.05]
    ## demo_raceHispanic/Asian/Other      0.22 *    
    ##                                [ 0.14;  0.30]
    ## demo_raceNon-Hispanic Black        0.67 *    
    ##                                [ 0.60;  0.74]
    ## female                            -0.20 *    
    ##                                [-0.26; -0.13]
    ## cc_bmi25 to <30                    0.05      
    ##                                [-0.03;  0.14]
    ## cc_bmi30+                          0.25 *    
    ##                                [ 0.17;  0.34]
    ## cc_diabetes                       -0.06      
    ##                                [-0.15;  0.03]
    ## cc_ckd                             0.46 *    
    ##                                [ 0.38;  0.54]
    ## cc_cvd_any                        -0.31 *    
    ##                                [-0.41; -0.21]
    ## bp_med_use                        -0.62 *    
    ##                                [-0.73; -0.51]
    ## htn_aware                          1.40 *    
    ##                                [ 1.30;  1.51]
    ## ---------------------------------------------
    ## McFadden's R-squared               0.18      
    ## Ragg-Uhler's R-squared             0.25      
    ## Mean AIC                       39924.09      
    ## =============================================
    ## * 0 outside the confidence interval.

    ## 
    ## =============================================
    ##                                Model 1       
    ## ---------------------------------------------
    ## (Intercept)                       -2.43 *    
    ##                                [-2.56; -2.31]
    ## svy_year2001-2002                 -0.11 *    
    ##                                [-0.23; -0.00]
    ## svy_year2003-2004                 -0.27 *    
    ##                                [-0.39; -0.15]
    ## svy_year2005-2006                 -0.36 *    
    ##                                [-0.47; -0.24]
    ## svy_year2007-2008                 -0.48 *    
    ##                                [-0.59; -0.36]
    ## svy_year2009-2010                 -0.58 *    
    ##                                [-0.69; -0.47]
    ## svy_year2011-2012                 -0.51 *    
    ##                                [-0.63; -0.39]
    ## svy_year2013-2014                 -0.68 *    
    ##                                [-0.80; -0.57]
    ## svy_year2015-2016                 -0.54 *    
    ##                                [-0.66; -0.42]
    ## svy_year2017-2020                 -0.54 *    
    ##                                [-0.66; -0.43]
    ## demo_age_years                     0.04 *    
    ##                                [ 0.04;  0.04]
    ## demo_raceHispanic/Asian/Other      0.08 *    
    ##                                [ 0.02;  0.14]
    ## demo_raceNon-Hispanic Black        0.47 *    
    ##                                [ 0.41;  0.52]
    ## female                            -0.45 *    
    ##                                [-0.50; -0.40]
    ## cc_bmi25 to <30                    0.21 *    
    ##                                [ 0.14;  0.27]
    ## cc_bmi30+                          0.54 *    
    ##                                [ 0.48;  0.61]
    ## cc_diabetes                       -0.10 *    
    ##                                [-0.18; -0.01]
    ## cc_ckd                             0.34 *    
    ##                                [ 0.26;  0.41]
    ## cc_cvd_any                        -0.37 *    
    ##                                [-0.47; -0.27]
    ## bp_med_use                        -0.57 *    
    ##                                [-0.67; -0.46]
    ## htn_aware                          1.22 *    
    ##                                [ 1.13;  1.31]
    ## ---------------------------------------------
    ## McFadden's R-squared               0.14      
    ## Ragg-Uhler's R-squared             0.23      
    ## Mean AIC                       61895.47      
    ## =============================================
    ## * 0 outside the confidence interval.

    ## 
    ## =============================================
    ##                                Model 1       
    ## ---------------------------------------------
    ## (Intercept)                       -4.52 *    
    ##                                [-4.69; -4.36]
    ## svy_year2001-2002                 -0.14      
    ##                                [-0.27;  0.00]
    ## svy_year2003-2004                 -0.19 *    
    ##                                [-0.33; -0.05]
    ## svy_year2005-2006                 -0.32 *    
    ##                                [-0.46; -0.18]
    ## svy_year2007-2008                 -0.43 *    
    ##                                [-0.57; -0.30]
    ## svy_year2009-2010                 -0.61 *    
    ##                                [-0.75; -0.48]
    ## svy_year2011-2012                 -0.59 *    
    ##                                [-0.74; -0.44]
    ## svy_year2013-2014                 -0.67 *    
    ##                                [-0.81; -0.53]
    ## svy_year2015-2016                 -0.51 *    
    ##                                [-0.66; -0.36]
    ## svy_year2017-2020                 -0.47 *    
    ##                                [-0.61; -0.33]
    ## demo_age_years                     0.05 *    
    ##                                [ 0.05;  0.05]
    ## demo_raceHispanic/Asian/Other      0.22 *    
    ##                                [ 0.14;  0.30]
    ## demo_raceNon-Hispanic Black        0.67 *    
    ##                                [ 0.60;  0.74]
    ## female                            -0.20 *    
    ##                                [-0.26; -0.13]
    ## cc_bmi25 to <30                    0.05      
    ##                                [-0.03;  0.14]
    ## cc_bmi30+                          0.25 *    
    ##                                [ 0.17;  0.34]
    ## cc_diabetes                       -0.06      
    ##                                [-0.15;  0.03]
    ## cc_ckd                             0.46 *    
    ##                                [ 0.38;  0.54]
    ## cc_cvd_any                        -0.31 *    
    ##                                [-0.41; -0.21]
    ## bp_med_use                        -0.62 *    
    ##                                [-0.73; -0.51]
    ## htn_aware                          1.40 *    
    ##                                [ 1.30;  1.51]
    ## ---------------------------------------------
    ## McFadden's R-squared               0.18      
    ## Ragg-Uhler's R-squared             0.25      
    ## Mean AIC                       39924.09      
    ## =============================================
    ## * 0 outside the confidence interval.

# plot OR and 95% CI

<img src="result_files/figure-gfm/unnamed-chunk-20-1.png" width="80%" />

# result table

# Data Description table

if not doing imputation

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
    ##                                Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -4.410833   0.090491 -48.743  < 2e-16 ***
    ## svy_year2001-2002             -0.143977   0.071464  -2.015 0.043944 *  
    ## svy_year2003-2004             -0.197119   0.073304  -2.689 0.007168 ** 
    ## svy_year2005-2006             -0.331430   0.073425  -4.514 6.38e-06 ***
    ## svy_year2007-2008             -0.446999   0.070930  -6.302 2.96e-10 ***
    ## svy_year2009-2010             -0.623664   0.071405  -8.734  < 2e-16 ***
    ## svy_year2011-2012             -0.605334   0.078307  -7.730 1.09e-14 ***
    ## svy_year2013-2014             -0.684010   0.073395  -9.320  < 2e-16 ***
    ## svy_year2015-2016             -0.526553   0.075908  -6.937 4.06e-12 ***
    ## svy_year2017-2020             -0.484679   0.071515  -6.777 1.24e-11 ***
    ## demo_age_years                 0.052346   0.001213  43.140  < 2e-16 ***
    ## demo_raceHispanic/Asian/Other  0.213948   0.039826   5.372 7.82e-08 ***
    ## demo_raceNon-Hispanic Black    0.656509   0.037494  17.510  < 2e-16 ***
    ## female                        -0.188065   0.034507  -5.450 5.06e-08 ***
    ## pregnant                      -1.586540   0.429971  -3.690 0.000225 ***
    ## cc_bmi25 to <30                0.057178   0.044039   1.298 0.194176    
    ## cc_bmi30+                      0.251124   0.043689   5.748 9.08e-09 ***
    ## cc_diabetes                   -0.056716   0.047941  -1.183 0.236802    
    ## cc_ckd                         0.467857   0.041605  11.245  < 2e-16 ***
    ## cc_cvd_any                    -0.299633   0.049955  -5.998 2.01e-09 ***
    ## bp_med_use                    -0.611200   0.057343 -10.659  < 2e-16 ***
    ## htn_aware                      1.388046   0.053428  25.980  < 2e-16 ***
    ## cc_smokeFormer                -0.170163   0.052661  -3.231 0.001233 ** 
    ## cc_smokeNever                 -0.070443   0.046484  -1.515 0.129668    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for quasibinomial family taken to be 0.9557377)
    ## 
    ## Number of Fisher Scoring iterations: 6

    ## 
    ## Call:
    ## svyglm(formula = bp_uncontrolled_130_80 ~ svy_year + demo_age_years + 
    ##     demo_race + female + pregnant + cc_bmi + cc_diabetes + cc_ckd + 
    ##     cc_cvd_any + bp_med_use + htn_aware + cc_smoke, design = nhanes, 
    ##     family = quasibinomial)
    ## 
    ## Survey design:
    ## subset(nhanes_all, svy_subpop_htn == 1)
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -2.3512522  0.0681959 -34.478  < 2e-16 ***
    ## svy_year2001-2002             -0.1292008  0.0598613  -2.158  0.03091 *  
    ## svy_year2003-2004             -0.2783926  0.0611689  -4.551 5.35e-06 ***
    ## svy_year2005-2006             -0.3729010  0.0606375  -6.150 7.82e-10 ***
    ## svy_year2007-2008             -0.4998897  0.0590562  -8.465  < 2e-16 ***
    ## svy_year2009-2010             -0.5882123  0.0582864 -10.092  < 2e-16 ***
    ## svy_year2011-2012             -0.5246217  0.0644360  -8.142 3.98e-16 ***
    ## svy_year2013-2014             -0.7088162  0.0589636 -12.021  < 2e-16 ***
    ## svy_year2015-2016             -0.5562614  0.0626654  -8.877  < 2e-16 ***
    ## svy_year2017-2020             -0.5691151  0.0597016  -9.533  < 2e-16 ***
    ## demo_age_years                 0.0390177  0.0009366  41.660  < 2e-16 ***
    ## demo_raceHispanic/Asian/Other  0.0814556  0.0304314   2.677  0.00744 ** 
    ## demo_raceNon-Hispanic Black    0.4598587  0.0303757  15.139  < 2e-16 ***
    ## female                        -0.4239655  0.0277516 -15.277  < 2e-16 ***
    ## pregnant                      -1.3734660  0.2002189  -6.860 6.97e-12 ***
    ## cc_bmi25 to <30                0.2046542  0.0339852   6.022 1.74e-09 ***
    ## cc_bmi30+                      0.5387338  0.0344525  15.637  < 2e-16 ***
    ## cc_diabetes                   -0.0958242  0.0447700  -2.140  0.03233 *  
    ## cc_ckd                         0.3444126  0.0392234   8.781  < 2e-16 ***
    ## cc_cvd_any                    -0.3571268  0.0497160  -7.183 6.90e-13 ***
    ## bp_med_use                    -0.5690089  0.0541361 -10.511  < 2e-16 ***
    ## htn_aware                      1.2146333  0.0471828  25.743  < 2e-16 ***
    ## cc_smokeFormer                -0.0636273  0.0416863  -1.526  0.12693    
    ## cc_smokeNever                  0.0076039  0.0349039   0.218  0.82755    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for quasibinomial family taken to be 1.01161)
    ## 
    ## Number of Fisher Scoring iterations: 5

# Lasso logistic

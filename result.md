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

## data

``` r
library(cardioStatsUSA)
library(tidyverse)
library(survey)
library(gtsummary)
# head(nhanes_data)
dat<-nhanes_data
```

## data cleaning

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

**check variables**

``` r
## Summary Statistics
dat %>% 
  select(demo_age_cat, pregnant, female, bp_med_n_class, htn_accaha, htn_accaha, bp_med_n_pills) %>% 
  tbl_summary() %>% 
  bold_labels()
```

<div id="putupnstgn" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#putupnstgn table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#putupnstgn thead, #putupnstgn tbody, #putupnstgn tfoot, #putupnstgn tr, #putupnstgn td, #putupnstgn th {
  border-style: none;
}

#putupnstgn p {
  margin: 0;
  padding: 0;
}

#putupnstgn .gt_table {
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

#putupnstgn .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#putupnstgn .gt_title {
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

#putupnstgn .gt_subtitle {
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

#putupnstgn .gt_heading {
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

#putupnstgn .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#putupnstgn .gt_col_headings {
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

#putupnstgn .gt_col_heading {
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

#putupnstgn .gt_column_spanner_outer {
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

#putupnstgn .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#putupnstgn .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#putupnstgn .gt_column_spanner {
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

#putupnstgn .gt_spanner_row {
  border-bottom-style: hidden;
}

#putupnstgn .gt_group_heading {
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

#putupnstgn .gt_empty_group_heading {
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

#putupnstgn .gt_from_md > :first-child {
  margin-top: 0;
}

#putupnstgn .gt_from_md > :last-child {
  margin-bottom: 0;
}

#putupnstgn .gt_row {
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

#putupnstgn .gt_stub {
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

#putupnstgn .gt_stub_row_group {
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

#putupnstgn .gt_row_group_first td {
  border-top-width: 2px;
}

#putupnstgn .gt_row_group_first th {
  border-top-width: 2px;
}

#putupnstgn .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#putupnstgn .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#putupnstgn .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#putupnstgn .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#putupnstgn .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#putupnstgn .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#putupnstgn .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#putupnstgn .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#putupnstgn .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#putupnstgn .gt_footnotes {
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

#putupnstgn .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#putupnstgn .gt_sourcenotes {
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

#putupnstgn .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#putupnstgn .gt_left {
  text-align: left;
}

#putupnstgn .gt_center {
  text-align: center;
}

#putupnstgn .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#putupnstgn .gt_font_normal {
  font-weight: normal;
}

#putupnstgn .gt_font_bold {
  font-weight: bold;
}

#putupnstgn .gt_font_italic {
  font-style: italic;
}

#putupnstgn .gt_super {
  font-size: 65%;
}

#putupnstgn .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#putupnstgn .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#putupnstgn .gt_indent_1 {
  text-indent: 5px;
}

#putupnstgn .gt_indent_2 {
  text-indent: 10px;
}

#putupnstgn .gt_indent_3 {
  text-indent: 15px;
}

#putupnstgn .gt_indent_4 {
  text-indent: 20px;
}

#putupnstgn .gt_indent_5 {
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
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">demo_age_cat</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    18 to 44</td>
<td headers="stat_0" class="gt_row gt_center">27,935 (47%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    45 to 64</td>
<td headers="stat_0" class="gt_row gt_center">18,082 (30%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    65 to 74</td>
<td headers="stat_0" class="gt_row gt_center">7,417 (12%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    75+</td>
<td headers="stat_0" class="gt_row gt_center">6,365 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">pregnant</td>
<td headers="stat_0" class="gt_row gt_center">1,620 (2.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">671</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">female</td>
<td headers="stat_0" class="gt_row gt_center">30,917 (52%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_n_class</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    None</td>
<td headers="stat_0" class="gt_row gt_center">42,088 (71%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    One</td>
<td headers="stat_0" class="gt_row gt_center">7,347 (12%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Two</td>
<td headers="stat_0" class="gt_row gt_center">5,740 (9.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Three</td>
<td headers="stat_0" class="gt_row gt_center">2,895 (4.9%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Four or more</td>
<td headers="stat_0" class="gt_row gt_center">1,248 (2.1%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">htn_accaha</td>
<td headers="stat_0" class="gt_row gt_center">28,056 (47%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">bp_med_n_pills</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    None</td>
<td headers="stat_0" class="gt_row gt_center">42,088 (71%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    One</td>
<td headers="stat_0" class="gt_row gt_center">8,995 (15%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Two</td>
<td headers="stat_0" class="gt_row gt_center">5,165 (8.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Three</td>
<td headers="stat_0" class="gt_row gt_center">2,200 (3.7%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Four or more</td>
<td headers="stat_0" class="gt_row gt_center">870 (1.5%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">481</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> n (%)</td>
    </tr>
  </tfoot>
</table>
</div>

### missing values

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

Combining nine survey cycles (18+3.2 years: 1999-2016 2017-2020Mar)

``` r
dat$svy_weight_mec<-ifelse(dat$svy_year %in% c("2017-2020"),dat$svy_weight_mec*3.2/21.2,dat$svy_weight_mec*2/21.2)
```

## define survey design

``` r
nhanes_all<-svydesign(data=dat,id=~svy_id, strata=~svy_strata, weights=~svy_weight_mec, nest=TRUE)
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

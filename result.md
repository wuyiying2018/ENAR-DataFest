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
head(nhanes_data)
```

    ##    svy_id svy_weight_mec svy_psu svy_strata  svy_year svy_subpop_htn
    ## 1:     12      95494.214       2          6 1999-2000              1
    ## 2:     21       2910.630       2          3 1999-2000              1
    ## 3:     27       1935.098       2         13 1999-2000              1
    ## 4:     28      41107.191       2          1 1999-2000              1
    ## 5:     56      89768.526       1         12 1999-2000              1
    ## 6:     57     102609.750       2          5 1999-2000              1
    ##    svy_subpop_chol demo_age_cat          demo_race demo_race_black
    ## 1:               1     18 to 44 Non-Hispanic White              No
    ## 2:               1     18 to 44           Hispanic              No
    ## 3:               0     18 to 44           Hispanic              No
    ## 4:               1     18 to 44 Non-Hispanic White              No
    ## 5:               0     18 to 44 Non-Hispanic White              No
    ## 6:               1     18 to 44 Non-Hispanic White              No
    ##    demo_age_years demo_pregnant demo_gender bp_sys_mean bp_dia_mean
    ## 1:             37            No         Men    176.6667   102.00000
    ## 2:             18            No         Men    121.3333    80.00000
    ## 3:             18            No         Men    118.0000    78.00000
    ## 4:             18            No         Men     94.0000    42.66667
    ## 5:             21            No         Men    121.0000    65.00000
    ## 6:             39            No         Men    119.3333    85.33333
    ##                         bp_cat_meds_excluded
    ## 1:                SBP 160+ or DBP 100+ mm Hg
    ## 2: SBP of 130 to <140 or DBP 80 to <90 mm Hg
    ## 3:                SBP <120 and DBP <80 mm Hg
    ## 4:                SBP <120 and DBP <80 mm Hg
    ## 5:      SBP of 120 to <130 and DBP <80 mm Hg
    ## 6: SBP of 130 to <140 or DBP 80 to <90 mm Hg
    ##                         bp_cat_meds_included bp_control_jnc7 bp_control_accaha
    ## 1:       taking antihypertensive medications              No                No
    ## 2: SBP of 130 to <140 or DBP 80 to <90 mm Hg             Yes                No
    ## 3:                SBP <120 and DBP <80 mm Hg             Yes               Yes
    ## 4:                SBP <120 and DBP <80 mm Hg             Yes               Yes
    ## 5:     SBP of 120 to <130 and DBP < 80 mm Hg             Yes               Yes
    ## 6: SBP of 130 to <140 or DBP 80 to <90 mm Hg             Yes                No
    ##    bp_control_escesh_1 bp_control_escesh_2 bp_control_140_90 bp_control_130_80
    ## 1:                  No                  No                No                No
    ## 2:                 Yes                  No               Yes                No
    ## 3:                 Yes                 Yes               Yes               Yes
    ## 4:                 Yes                 Yes               Yes               Yes
    ## 5:                 Yes                 Yes               Yes               Yes
    ## 6:                 Yes                  No               Yes                No
    ##    bp_uncontrolled_jnc7 bp_uncontrolled_accaha bp_uncontrolled_escesh_1
    ## 1:                  Yes                    Yes                      Yes
    ## 2:                   No                    Yes                       No
    ## 3:                   No                     No                       No
    ## 4:                   No                     No                       No
    ## 5:                   No                     No                       No
    ## 6:                   No                    Yes                       No
    ##    bp_uncontrolled_escesh_2 bp_uncontrolled_140_90 bp_uncontrolled_130_80
    ## 1:                      Yes                    Yes                    Yes
    ## 2:                      Yes                     No                    Yes
    ## 3:                       No                     No                     No
    ## 4:                       No                     No                     No
    ## 5:                       No                     No                     No
    ## 6:                      Yes                     No                    Yes
    ##    bp_med_use bp_med_recommended_jnc7 bp_med_recommended_accaha
    ## 1:        Yes                     Yes                       Yes
    ## 2:         No                      No                        No
    ## 3:         No                      No                        No
    ## 4:         No                      No                        No
    ## 5:         No                      No                        No
    ## 6:         No                      No                        No
    ##    bp_med_recommended_escesh bp_med_n_class bp_med_n_pills bp_med_combination
    ## 1:                       Yes            One            One                 No
    ## 2:                        No           None           None                 No
    ## 3:                        No           None           None                 No
    ## 4:                        No           None           None                 No
    ## 5:                        No           None           None                 No
    ## 6:                        No           None           None                 No
    ##    bp_med_pills_gteq_2 bp_med_ace bp_med_aldo bp_med_alpha bp_med_angioten
    ## 1:                  No        Yes          No           No              No
    ## 2:                  No         No          No           No              No
    ## 3:                  No         No          No           No              No
    ## 4:                  No         No          No           No              No
    ## 5:                  No         No          No           No              No
    ## 6:                  No         No          No           No              No
    ##    bp_med_beta bp_med_central bp_med_ccb bp_med_ccb_dh bp_med_ccb_ndh
    ## 1:          No             No         No            No             No
    ## 2:          No             No         No            No             No
    ## 3:          No             No         No            No             No
    ## 4:          No             No         No            No             No
    ## 5:          No             No         No            No             No
    ## 6:          No             No         No            No             No
    ##    bp_med_diur_Ksparing bp_med_diur_loop bp_med_diur_thz
    ## 1:                   No               No              No
    ## 2:                   No               No              No
    ## 3:                   No               No              No
    ## 4:                   No               No              No
    ## 5:                   No               No              No
    ## 6:                   No               No              No
    ##    bp_med_renin_inhibitors bp_med_vasod htn_jnc7 htn_accaha htn_escesh
    ## 1:                      No           No      Yes        Yes        Yes
    ## 2:                      No           No       No        Yes         No
    ## 3:                      No           No       No         No         No
    ## 4:                      No           No       No         No         No
    ## 5:                      No           No       No         No         No
    ## 6:                      No           No       No        Yes         No
    ##    htn_aware htn_resistant_jnc7 htn_resistant_accaha htn_resistant_jnc7_thz
    ## 1:       Yes                 No                   No                     No
    ## 2:        No                 No                   No                     No
    ## 3:        No                 No                   No                     No
    ## 4:        No                 No                   No                     No
    ## 5:        No                 No                   No                     No
    ## 6:       Yes                 No                   No                     No
    ##    htn_resistant_accaha_thz                      chol_measured_never
    ## 1:                       No Cholesterol has been measured previously
    ## 2:                       No Cholesterol has been measured previously
    ## 3:                       No                                     <NA>
    ## 4:                       No Cholesterol has been measured previously
    ## 5:                       No                                     <NA>
    ## 6:                       No Cholesterol has been measured previously
    ##               chol_measured_last chol_total chol_total_gteq_200
    ## 1:              1 to 5 years ago        156                  No
    ## 2:                          <NA>        161                  No
    ## 3:                          <NA>         NA                <NA>
    ## 4:                          <NA>        151                  No
    ## 5:                          <NA>         NA                <NA>
    ## 6: >5 years ago (possibly never)        243                 Yes
    ##    chol_total_gteq_240 chol_hdl chol_hdl_low chol_trig chol_trig_gteq_150
    ## 1:                  No       38          Yes       146                 No
    ## 2:                  No       34          Yes       120                 No
    ## 3:                <NA>       NA         <NA>        NA               <NA>
    ## 4:                  No       64           No        52                 No
    ## 5:                <NA>       NA         <NA>        NA               <NA>
    ## 6:                 Yes       46          Yes        97                 No
    ##     chol_ldl     chol_ldl_5cat chol_ldl_lt_70 chol_ldl_gteq_70 chol_ldl_lt_100
    ## 1:  90.87551  70 to <100 mg/dL             No              Yes             Yes
    ## 2: 104.23559 100 to <130 mg/dL             No              Yes              No
    ## 3:        NA              <NA>           <NA>             <NA>            <NA>
    ## 4:  75.74248  70 to <100 mg/dL             No              Yes             Yes
    ## 5:        NA              <NA>           <NA>             <NA>            <NA>
    ## 6: 179.25406 130 to <190 mg/dL             No              Yes              No
    ##    chol_ldl_gteq_100 chol_ldl_gteq_190 chol_ldl_persistent chol_nonhdl
    ## 1:                No                No                  No         118
    ## 2:               Yes                No                  No         127
    ## 3:              <NA>              <NA>                <NA>          NA
    ## 4:                No                No                  No          87
    ## 5:              <NA>              <NA>                <NA>          NA
    ## 6:               Yes                No                  No         197
    ##     chol_nonhdl_5cat chol_nonhdl_lt_100 chol_nonhdl_gteq_100
    ## 1: 100 to <130 mg/dL                 No                  Yes
    ## 2: 100 to <130 mg/dL                 No                  Yes
    ## 3:              <NA>               <NA>                 <NA>
    ## 4:       < 100 mg/dL                Yes                   No
    ## 5:              <NA>               <NA>                 <NA>
    ## 6: 160 to <220 mg/dL                 No                  Yes
    ##    chol_nonhdl_gteq_220 chol_med_use chol_med_use_sr chol_med_statin
    ## 1:                   No           No              No              No
    ## 2:                   No           No              No              No
    ## 3:                 <NA>         <NA>            <NA>            <NA>
    ## 4:                   No           No              No              No
    ## 5:                 <NA>         <NA>            <NA>            <NA>
    ## 6:                   No           No              No              No
    ##    chol_med_ezetimibe chol_med_pcsk9i chol_med_bile chol_med_fibric_acid
    ## 1:                 No              No            No                   No
    ## 2:                 No              No            No                   No
    ## 3:               <NA>            <NA>          <NA>                 <NA>
    ## 4:                 No              No            No                   No
    ## 5:               <NA>            <NA>          <NA>                 <NA>
    ## 6:                 No              No            No                   No
    ##    chol_med_atorvastatin chol_med_simvastatin chol_med_rosuvastatin
    ## 1:                    No                   No                    No
    ## 2:                    No                   No                    No
    ## 3:                  <NA>                 <NA>                  <NA>
    ## 4:                    No                   No                    No
    ## 5:                  <NA>                 <NA>                  <NA>
    ## 6:                    No                   No                    No
    ##    chol_med_pravastatin chol_med_pitavastatin chol_med_fluvastatin
    ## 1:                   No                    No                   No
    ## 2:                   No                    No                   No
    ## 3:                 <NA>                  <NA>                 <NA>
    ## 4:                   No                    No                   No
    ## 5:                 <NA>                  <NA>                 <NA>
    ## 6:                   No                    No                   No
    ##    chol_med_lovastatin chol_med_other chol_med_addon_use
    ## 1:                  No             No                 No
    ## 2:                  No             No                 No
    ## 3:                <NA>           <NA>               <NA>
    ## 4:                  No             No                 No
    ## 5:                <NA>           <NA>               <NA>
    ## 6:                  No             No                 No
    ##    chol_med_addon_recommended_ahaacc chol_med_statin_recommended_ahaacc
    ## 1:                                No                                 No
    ## 2:                                No                                 No
    ## 3:                              <NA>                               <NA>
    ## 4:                                No                                 No
    ## 5:                              <NA>                               <NA>
    ## 6:                                No                                 No
    ##    chol_med_recommended_ever ascvd_risk_vh_ahaacc cc_smoke    cc_bmi
    ## 1:                        No                   No    Never 30 to <35
    ## 2:                        No                   No     <NA>       35+
    ## 3:                      <NA>                 <NA>     <NA> 25 to <30
    ## 4:                        No                   No     <NA>       <25
    ## 5:                      <NA>                 <NA>   Former       <25
    ## 6:                        No                   No    Never 25 to <30
    ##    cc_diabetes cc_ckd cc_cvd_mi cc_cvd_chd cc_cvd_stroke cc_cvd_ascvd cc_cvd_hf
    ## 1:          No    Yes        No         No            No           No        No
    ## 2:          No     No      <NA>       <NA>          <NA>           No      <NA>
    ## 3:          No     No      <NA>       <NA>          <NA>           No      <NA>
    ## 4:          No     No      <NA>       <NA>          <NA>           No      <NA>
    ## 5:          No     No        No         No            No           No        No
    ## 6:          No     No        No         No            No           No        No
    ##    cc_cvd_any
    ## 1:         No
    ## 2:         No
    ## 3:         No
    ## 4:         No
    ## 5:         No
    ## 6:         No

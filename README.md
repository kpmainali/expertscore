# expertscore: computes score of an expert map

This packages computes score of an expert map based on its congruence with probability surface of a species distribution model. A quantitative metric called “expert score” was developed by Mainali et al (2020) to evaluate the agreement between an expert map and a habitat probability surface obtained from a species distribution model (SDM). This method rewards both the avoidance of unsuitable sites and the inclusion of suitable sites in the expert map. 

The Expert Score has a similar interpretation as the familiar coefficient of determination from simple linear regression or the more general pseudo-coefficient of determination for generalized linear models. For example, when the Expert Score equals 0, the expert map has predictive accuracy equal to that that of the null map. When the Expert Score equals 1, the expert map perfectly distinguishes occupied sites from unoccupied sites. Expert Score can be negative when an expert map has less predictive accuracy than the null map. The score is computed as (1 - expert map deviance/null deviance). Given the heterogeneity and discontinuity of suitable landscape, expert maps that are drawn with more detail are more likely to agree with SDMs and thus minimize both commission and omission errors. 


Kumar Mainali, Trevor Hefley, Leslie Ries, William Fagan (2020). Matching expert range maps with species distribution model predictions. Conservation Biology https://doi.org/10.1111/cobi.13492


# Installation

The library can be installed from GitHub with devtools:

```
require(devtools)
install_github("kpmainali/expertscore")
```

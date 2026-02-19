# College Enrollment Prediction Using Multiple Linear Regression (SAS)

## Overview

This project applies Multiple Linear Regression (MLR) to predict student enrollment
based on institutional characteristics from the 1995 U.S. News & World Report College dataset.

The objective is to evaluate whether enrollment levels are dependent on
university attributes such as acceptance numbers, academic quality indicators,
student population metrics, and institutional type.

---

## Dataset Information

- 777 observations
- 18 variables
- Target Variable: ENROLL (Number of new students enrolled)

Key predictors used in the final model:
- ACCEPT (Number of applications accepted)
- TOP10PERC (% of new students from top 10% of high school class)
- F_UNDERGRAD (Full-time undergraduate students)
- LP_UNDERGRAD (Log-transformed part-time undergraduates)
- ROOM_BOARD (Room and board cost)
- GRAD_RATE (Graduation rate)
- PRIVATE_DUMMY (1 = Private, 0 = Public)

---

## Data Preparation

The following preprocessing steps were performed:

• Dummy coding for the PRIVATE variable  
• Outlier detection using boxplots  
• Removal of extreme values for ACCEPT, ENROLL, and TOP10PERC  
• Log transformation of P_UNDERGRAD to correct right skewness  
• Train/Test split:
  - Training Set: First 544 observations  
  - Test Set: Remaining 233 observations  

---

## Model Specification

ENROLL =
ACCEPT +
TOP10PERC +
F_UNDERGRAD +
LP_UNDERGRAD +
ROOM_BOARD +
GRAD_RATE +
PRIVATE_DUMMY

Multicollinearity diagnostics were performed using:
- Variance Inflation Factor (VIF)
- Tolerance
- Collinearity diagnostics

All VIF values were below 5, indicating acceptable multicollinearity levels.

---

## Results

Training Mean Squared Error (MSE): 12,326  
Test Mean Squared Error (MSE): 14,774  
Increase in MSE: 2,467  

The moderate increase between training and test MSE suggests reasonable
generalization performance with limited overfitting.

---

## Model Evaluation

Residual analysis indicated:

• Residuals approximately normally distributed  
• No major heteroskedasticity  
• No severe multicollinearity  
• Stable coefficient estimates  

Based on statistical significance testing, GRAD_RATE was removed in a refined model
while retaining the PRIVATE dummy variable for interpretability.

---

## Tools Used

SAS  
Multiple Linear Regression  
Statistical Diagnostics  
Train/Test Validation  
Data Cleaning & Transformation  

---

## Key Takeaways

This project demonstrates:

✔ End-to-end regression modeling workflow  
✔ Feature engineering (log transformation & dummy coding)  
✔ Model validation using train/test split  
✔ Multicollinearity assessment  
✔ Business interpretation of statistical results  

---

Author: Ian Tom-Johnson  
MBA – Business Analytics

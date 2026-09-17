# 📊 SaaS Customer Churn & Retention Intelligence

**👤 Author:** Abhishek Devkatte\
**🎓 B.Tech --- Computer Science & Engineering**

------------------------------------------------------------------------

## 🔎 Project Overview

**SaaS Customer Churn & Retention Intelligence** is an end-to-end
analytics and machine learning project built for a fictional B2B SaaS
company, **CloudFlow**.

The project combines **SQL, Python, Machine Learning, Explainable AI,
and Power BI** to identify customers at risk of churn, understand churn
drivers, estimate revenue exposure, and recommend retention actions.

------------------------------------------------------------------------

## 🎯 Business Problem

Customer churn can directly affect recurring SaaS revenue. The project
answers four key business questions:

-   👥 **Who** is likely to churn?
-   🔍 **Why** are customers churning?
-   💰 **How much MRR** is exposed?
-   🎯 **What retention action** can be considered?

------------------------------------------------------------------------

## 🛠️ Tools & Technologies

  Area                  Technologies
  --------------------- ---------------------------------------------
  🗄️ Data Analysis    :  MySQL, SQL
	
  🐍 Data Science     :  Python, Pandas, NumPy
  📈 Visualization     : Matplotlib, Seaborn, Power BI
  🤖 Machine Learning  : Logistic Regression, Random Forest, XGBoost
  🧠 Explainable AI    : SHAP
  🔧 Version Control   : Git, GitHub

------------------------------------------------------------------------

## 📌 Dataset

The project uses a **10,000-customer synthetic B2B SaaS dataset**
containing customer, subscription, usage, support, and churn
information.

### Main data areas

-   👤 Customer profile
-   💳 Subscription & contract details
-   📱 Product usage & engagement
-   🎧 Support interactions
-   🚪 Churn status & churn reasons

------------------------------------------------------------------------

## 📊 Key Business Findings

-   👥 **10,000 customers** analyzed
-   🚪 **24.85%** overall churn rate
-   📅 **31.16%** churn rate for monthly contracts vs **15.96%** for
    annual contracts
-   💰 Churned customers represented approximately **₹15.08 lakh in
    monthly recurring revenue**
-   📉 Average feature adoption was **53.65%** among churned customers
    vs **64.05%** among active customers
-   🔎 Churn patterns were analyzed across contract type, plan,
    industry, company size, usage, and support indicators

------------------------------------------------------------------------

## 🤖 Machine Learning

Three classification models were evaluated:

  Model                   Accuracy   Recall   ROC-AUC
  --------------------- ---------- -------- ---------
  Logistic Regression       70.25%   71.63%     0.779
  Random Forest             73.10%   61.97%     0.764
  XGBoost                   76.55%   27.16%     0.759

**Logistic Regression** was used for the retention-focused risk analysis
because identifying potential churners was prioritized.

SHAP was used to improve model interpretability and understand which
features had the greatest influence on predictions.

------------------------------------------------------------------------

## ⚠️ Customer Risk & Retention

The model assigns customers to:

-   🟢 **Low Risk**
-   🟡 **Medium Risk**
-   🔴 **High Risk**

The project also generates recommended retention actions:

-   🧩 Feature Adoption Campaign
-   🔄 Re-engagement Campaign
-   🎧 Priority Support
-   🚀 Onboarding Intervention
-   🤝 Customer Success Review

------------------------------------------------------------------------

## 📈 Power BI Dashboard

The interactive dashboard contains **3 pages**:

### 1️⃣ Executive Overview

-   Total customers
-   Churn rate
-   Churn rate by contract type
-   Churn reasons

### 2️⃣ Churn Drivers

-   Churn by industry
-   Churn by plan
-   Churn by company size
-   Churn by country

### 3️⃣ Customer Risk & Retention

-   Risk distribution
-   Customer-level risk predictions
-   Recommended retention actions
-   Risk level by recommended action

------------------------------------------------------------------------

## 🔄 Project Workflow

``` text
Raw Data
   ↓
SQL Data Analysis
   ↓
Python EDA & Feature Engineering
   ↓
Machine Learning
   ↓
SHAP Explainability
   ↓
Customer Risk Scoring
   ↓
Retention Recommendations
   ↓
Power BI Dashboard
```

------------------------------------------------------------------------

## 📁 Project Structure

``` text
SaaS-Customer-Churn-Intelligence/
│
├── 📂 data/
├── 📂 sql/
├── 📂 python/
├── 📂 PowerBi/
├── 📂 screenshots/
├── 📄 README.md
└── 📄 .gitignore
```

------------------------------------------------------------------------

## 💡 Business Value

This project demonstrates how customer data can be converted into
**actionable retention intelligence** by connecting:

**Data → Insights → Prediction → Business Action**

------------------------------------------------------------------------

## 👤 Author

### Abhishek Devkatte

**B.Tech Computer Science & Engineering**\
Interested in **Data Analytics, Artificial Intelligence, Machine
Learning, and Intelligent Systems**.

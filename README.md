# 📊 SaaS Customer Churn & Retention Intelligence

> **An end-to-end data analytics and machine learning project that identifies customers at risk of churn, explains churn drivers, estimates revenue exposure, and recommends retention actions.**

**Author:** Abhishek Devkatte  
**B.Tech — Computer Science & Engineering**

---

## 🔎 Project Overview

**SaaS Customer Churn & Retention Intelligence** is an end-to-end analytics and machine learning project developed for a fictional B2B SaaS company, **CloudFlow**.

The project transforms raw customer data into actionable retention intelligence by combining:

- 🗄️ SQL-based business analysis
- 🐍 Python data analysis and feature engineering
- 🤖 Machine learning-based churn prediction
- 🧠 SHAP-based model explainability
- 📊 Power BI business intelligence dashboards
- 🎯 Customer risk segmentation and retention recommendations

The primary objective is to help a SaaS business understand **which customers are likely to churn, why they are at risk, how much recurring revenue is associated with churned customers, and what retention action can be considered.**

---

## 🎯 Business Problem

Customer churn is a major challenge for subscription-based SaaS businesses because losing customers can directly reduce recurring revenue.

This project addresses four key business questions:

| Business Question | Analysis |
|---|---|
| 👥 **Who is likely to churn?** | Customer-level churn prediction and risk scoring |
| 🔍 **Why are customers churning?** | Churn driver and SHAP analysis |
| 💰 **How much revenue is associated with churn?** | MRR analysis of churned customers |
| 🎯 **What action can be considered?** | Data-driven retention recommendations |

---

## 🛠️ Technologies & Tools

### 🗄️ Data Analysis & Database

- **SQL**
- Data aggregation
- Filtering and segmentation
- Business KPI analysis
- Customer-level analysis

### 🐍 Data Science

- **Python**
- **Pandas**
- **NumPy**
- Exploratory Data Analysis (EDA)
- Data cleaning
- Feature engineering

### 🤖 Machine Learning

- **Logistic Regression**
- **Random Forest**
- **XGBoost**
- Classification
- Churn prediction

### 🧠 Explainable AI

- **SHAP**
- Feature importance
- Prediction explanation
- Churn driver analysis

### 📈 Data Visualization

- **Power BI**
- Interactive dashboards
- KPI visualization
- Customer segmentation

### 🔧 Development & Version Control

- **Git**
- **GitHub**

---

## 📌 Dataset

The project uses a **10,000-customer synthetic B2B SaaS dataset** representing customer demographics, subscriptions, product usage, support interactions, and churn information.

### Dataset Categories

#### 👤 Customer Information

- Customer profile
- Country
- Industry
- Company size
- Signup date

#### 💳 Subscription Information

- Subscription plan
- Contract type
- Monthly recurring revenue (MRR)
- Discount percentage
- Contract dates

#### 📱 Product Engagement

- Product usage
- Feature adoption
- Login/activity indicators
- Usage change
- Onboarding completion
- Number of integrations

#### 🎧 Customer Support

- Support tickets
- Unresolved tickets
- Resolution time
- Satisfaction score
- NPS score

#### 🚪 Churn Information

- Churn status
- Churn date
- Churn reasons
- Customer retention status

---

# 📊 Key Business Findings

The analysis of **10,000 customers** produced several important business insights.

### 👥 Customer Base

- **10,000 customers** analyzed
- **24.85% overall churn rate**
- **2,485 customers churned**
- **7,515 customers remained active**

### 📅 Contract Type

| Contract Type | Churn Rate |
|---|---:|
| Monthly | **31.16%** |
| Quarterly | **22.72%** |
| Annual | **15.96%** |

Monthly-contract customers showed a substantially higher **observed churn rate** than annual-contract customers in this dataset.

This is an observed association and does not by itself establish causation.

### 💰 Revenue Associated With Churned Customers

Customers who churned represented approximately:

> **₹15.08 lakh in Monthly Recurring Revenue (MRR)**

This represents the MRR associated with customers who had churned in the analyzed dataset.

### 📉 Feature Adoption

| Customer Status | Average Feature Adoption |
|---|---:|
| Active | **64.05%** |
| Churned | **53.65%** |

The dataset shows lower average feature adoption among churned customers.

### 🔎 Segmentation Analysis

Churn patterns were further analyzed across:

- Contract type
- Subscription plan
- Industry
- Company size
- Country
- Product usage
- Feature adoption
- Customer support indicators

---

# 🤖 Machine Learning

Three classification algorithms were evaluated for predicting customer churn.

## 📈 Model Evaluation

| Model | Accuracy | Recall | ROC-AUC |
|---|---:|---:|---:|
| Logistic Regression | **70.25%** | **71.63%** | **0.779** |
| Random Forest | **73.10%** | **61.97%** | **0.764** |
| XGBoost | **76.55%** | **27.16%** | **0.759** |

### 🎯 Model Selection

For the retention-focused risk analysis, **Logistic Regression** was selected because the project prioritizes identifying potential churners.

For a churn-retention use case, recall is particularly important because failing to identify a customer who is actually going to churn can result in a missed retention opportunity.

Therefore, model selection was not based on accuracy alone.

---

# 🧠 Explainable AI with SHAP

Machine learning predictions are more useful to business teams when the reasons behind the predictions can also be understood.

**SHAP (SHapley Additive exPlanations)** was used to interpret model predictions.

The analysis helps answer questions such as:

- Which customer characteristics contribute to higher churn risk?
- Which factors reduce predicted churn risk?
- Why was a particular customer classified as high risk?
- Which behavioral patterns are associated with churn?

This connects:

> **Prediction → Explanation → Business Action**

---

# ⚠️ Customer Risk Scoring

Each customer receives a churn-risk classification based on the predicted probability of churn.

### Risk Levels

| Risk Level | Description |
|---|---|
| 🟢 **Low Risk** | Lower predicted probability of churn |
| 🟡 **Medium Risk** | Moderate predicted probability of churn |
| 🔴 **High Risk** | Higher predicted probability of churn |

Customer-level risk predictions can be used by customer success teams to prioritize potential interventions.

---

# 🎯 Retention Recommendations

The project converts customer risk information into potential retention actions.

| Retention Action | Example Use Case |
|---|---|
| 🧩 **Feature Adoption Campaign** | Low product or feature adoption |
| 🔄 **Re-engagement Campaign** | Reduced customer engagement |
| 🎧 **Priority Support** | Customers showing support-related risk |
| 🚀 **Onboarding Intervention** | Customers requiring additional onboarding |
| 🤝 **Customer Success Review** | Higher-risk customers requiring personalized attention |

These recommendations are intended as **data-driven intervention suggestions**, rather than guaranteed outcomes.

---

# 📈 Power BI Dashboard

The project includes an interactive **3-page Power BI dashboard**.

## 1️⃣ Executive Overview

Provides a high-level view of customer churn.

### KPIs

- 👥 Total Customers
- 📊 Churn Rate

### Visualizations

- Churn Rate by Contract Type
- Churn Reasons

This page provides a quick overview of the overall customer churn situation.

---

## 2️⃣ Churn Drivers

Focuses on identifying patterns associated with customer churn.

### Analysis Includes

- Churn by Industry
- Churned Customers by Plan
- Churned Customers by Company Size
- Churn by Country

This page helps business users investigate **where churn is concentrated** across different customer segments.

---

## 3️⃣ Customer Risk & Retention

Focuses on actionable customer-level insights.

### Includes

- Customer Risk Distribution
- Customer-level Risk Table
- Recommended Retention Actions
- Risk Level by Recommended Action

The risk table contains:

- Customer ID
- Churn Probability
- Risk Level
- Monthly Recurring Revenue
- Predicted MRR at Risk
- Recommended Retention Action

This page connects analytical predictions with potential business interventions.

---

# 🔄 End-to-End Project Workflow

RAW CUSTOMER DATA  
↓  
DATA PREPARATION  
↓  
SQL ANALYSIS  
↓  
PYTHON EDA & CLEANING  
↓  
FEATURE ENGINEERING  
↓  
MACHINE LEARNING MODELS  
↓  
MODEL EVALUATION  
↓  
SHAP EXPLAINABILITY  
↓  
CUSTOMER RISK SCORING  
↓  
RETENTION RECOMMENDATIONS  
↓  
POWER BI DASHBOARD  
↓  
BUSINESS INSIGHTS

---

# 📁 Project Structure

SaaS-Customer-Churn-Retention-Intelligence/

├── 📂 data/  
│   ├── churn_analysis.csv  
│   ├── customer_risk_predictions.csv  
│   ├── customer_status.csv  
│   ├── customers.csv  
│   ├── saas_churn_master.csv  
│   ├── subscriptions.csv  
│   ├── support_data.csv  
│   └── usage_metrics.csv  
│  
├── 📂 sql/  
│   └── churn_analysis.sql  
│  
├── 📂 python/  
│   └── churn_analysis_ml.ipynb  
│  
├── 📂 PowerBi/  
│   └── SaaS_churn_intelligence.pbix  
│  
├── 📂 screenshots/  
│   ├── Churn Drivers.png  
│   ├── Customer Risk.png  
│   └── Executive Overview.png  
│  
├── 📄 README.md  
└── 📄 .gitignore

> **Note:** The local `venv/` folder is excluded from GitHub using `.gitignore`.

---

# 💼 Business Value

The project demonstrates how organizations can transform customer data into actionable retention intelligence.

### Traditional Analytics

Customer Data  
↓  
Historical Reports  
↓  
Churn Insights

### This Project

Customer Data  
↓  
SQL Analysis  
↓  
Customer Behavior Insights  
↓  
Churn Prediction  
↓  
Risk Scoring  
↓  
Explainable Predictions  
↓  
Retention Recommendations  
↓  
Business Dashboard

The approach enables business teams to move from simply **understanding historical churn** toward **identifying customers who may require attention**.

---

# 📌 Skills Demonstrated

This project demonstrates practical experience in:

- SQL querying
- MySQL
- Data cleaning
- Exploratory Data Analysis
- Feature engineering
- Statistical analysis
- Classification algorithms
- Model evaluation
- Recall and ROC-AUC interpretation
- Explainable AI
- SHAP
- Customer segmentation
- Churn analysis
- Revenue analysis
- Business KPI development
- Power BI dashboard development
- Data storytelling
- Git & GitHub

---

# 🚀 Future Improvements

Potential improvements to the project include:

- 🔄 Automated model retraining pipeline
- 📡 Real-time customer risk monitoring
- 📊 Automated Power BI data refresh
- 💰 Customer Lifetime Value (CLV) prediction
- 📈 Retention campaign effectiveness tracking
- 🧪 A/B testing of retention strategies
- ☁️ Cloud deployment
- 🔔 Automated alerts for newly identified high-risk customers

---

# 🎓 Project Takeaway

The core idea of this project is:

> **Data → Insights → Prediction → Explanation → Action**

Rather than looking only at historical churn, the project combines analytics, machine learning, explainability, and business intelligence to create a complete **customer churn and retention intelligence system**.

---

# 👤 Author

## Abhishek Devkatte

**B.Tech — Computer Science & Engineering**

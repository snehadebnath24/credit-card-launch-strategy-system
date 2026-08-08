# Credit Card Adoption & Profitability System

## 📑 Overview
This project develops a **Credit Card Launch Strategy System** using **PostgreSQL + Python analytics**.  
It predicts adoption likelihood, forecasts profitability, and provides an interactive dashboard for scenario simulation.  
The system is designed to help banks and fintechs make **data‑driven decisions** when launching new credit cards.

---

## 🏦 Business Problem
Launching a new credit card is a high‑stakes decision. Banks face challenges such as:

- **Uncertainty in Targeting:** Wrong customer segments lead to low adoption rates.  
- **Profitability vs Risk:** High‑spending customers drive revenue, but defaults erode profitability.  
- **Competitive Market:** Customers already have multiple card options; differentiation is critical.  
- **Resource Allocation:** Marketing budgets must be directed toward segments most likely to adopt and generate long‑term value.  

**Problem Statement:**  
The bank needs to identify **which customer segments to target** and **what product features to offer** in order to maximize adoption and profitability while minimizing default risk.

---

## 💡 Solution Approach
1. **Data Infrastructure**  
   - PostgreSQL database with tables for customers, credit history, transactions, and marketing response.  
   - Synthetic dataset generated in Python to simulate realistic customer behavior.  

2. **Data Analytics Workflow**  
   - SQL queries for segmentation and aggregation.  
   - Python (pandas, seaborn, scikit‑learn) for EDA, feature engineering, and modeling.  

3. **Strategy Simulation**  
   - Tested scenarios (cashback %, fee waivers, rewards).  
   - Compared adoption and profitability outcomes under different strategies.  

4. **Dashboard & Decision Support**  
   - Streamlit dashboard connected to PostgreSQL.  
   - KPIs: adoption rate, average monthly spend, revenue uplift, risk exposure.  
   - Filters for income bracket, credit segment, and region.  

---

## 📊 Key Insights
- **Adoption Rate:** ~46.6% overall.  
- **Target Segments:** Urban, high‑income, young professionals (26–35) with Excellent/Very Good credit scores.  
- **Risk Segments:** Customers with default history and low credit scores.  
- **Profitability Drivers:** Spend‑to‑income ratio, credit score, age group.  
- **Regional Focus:** East region shows strongest adoption (~60%).  

---

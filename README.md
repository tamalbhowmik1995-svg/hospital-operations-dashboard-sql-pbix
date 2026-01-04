hospital-operations-dashboard-sql-pbix
An end-to-end data analytics project using MySQL for database management and Power BI for clinical and financial insights.
📌 Project Overview
This project focuses on analyzing hospital operations, patient demographics, and financial health. By integrating data from five core healthcare entities, the dashboard provides actionable insights into treatment effectiveness, billing efficiency, and doctor-patient engagement.
📊 Data Model
The system is built on a relational schema consisting of five key tables:
Patients: Personal details, demographics, and medical history.
Doctors: Staff information, specializations, and availability.
Appointments: Records of scheduled and completed visits.
Treatments: Details of medical procedures administered to patients.
Billings: Financial records, insurance details, and payment statuses.
🛠️ Tech Stack
Database: MySQL (Data Storage, Relational Schema, Querying)
Visualization: Power BI Desktop (ETL, Data Modeling, DAX)
Data Transformation: Power Query
Modeling: Star Schema / Snowflake Schema
🚀 Key Features
Patient Demographics: Geographic and age-group distribution of patients.
Clinical Performance: Tracking treatment success rates across different doctor specializations.
Operational Efficiency: Analysis of appointment wait times and scheduling patterns.
Financial Health: Tracking total revenue, outstanding bills, and insurance claim statuses.
Interactive Filters: Drill down by date, department, or specific doctor.
📂 Repository Structure
/SQL_Queries/: Contains .sql scripts for database creation and exploratory data analysis (EDA).
/Dashboard/: The .pbix Power BI project file.
/Data/: Sample CSV files used to populate the MySQL database.
/Assets/: Screenshots of the final dashboard.
🔧 How to Use
Database Setup: Run the provided SQL scripts in your MySQL Workbench to replicate the database.
Connect Power BI: Open the .pbix file and update the data source settings to point to your local MySQL instance.
Explore Insights: Use the interactive slicers to filter through patient and billing data.
📝 Future Improvements
Predictive modeling for patient readmission.
Real-time data integration via API.
Automated appointment scheduling optimization.

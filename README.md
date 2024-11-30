# COVID-19 Data Analysis Across Multiple Platforms

## Project Overview
This project analyzes COVID-19 data across multiple dimensions such as total cases, deaths, vaccinations, and population metrics. The dataset is split into two parts: **COVID Deaths** and **COVID Vaccinations**. The analysis utilizes SQL for data exploration and Excel for preprocessing. The final visualizations and insights are created using Tableau.

---

## Tools and Technologies
- **Excel**: Used to preprocess the dataset and split it into `CovidDeaths` and `CovidVaccinations` files.
- **SQL (PostgreSQL)**: For data exploration, analysis, and performing calculations with advanced SQL techniques.
- **Tableau**: Used to build interactive dashboards for data visualization.

---

## Key Features of the Analysis

### SQL Analysis Highlights
1. **Data Cleaning and Preprocessing**:
   - Filtered data to exclude null values in continents.
   - Sorted and formatted data for easier querying.

2. **COVID Death and Infection Trends**:
   - Total cases vs. total deaths to calculate the likelihood of death upon contracting COVID.
   - Total cases vs. population to find the percentage of the population infected.

3. **Global and Country-Specific Insights**:
   - Countries with the highest infection rates and death counts.
   - Analysis by continents to identify regions with the most impact.

4. **Vaccination Progress**:
   - Merged vaccination and death datasets using joins.
   - Calculated rolling totals of vaccinated individuals using **window functions**.
   - Computed the percentage of the population vaccinated.

5. **Advanced SQL Techniques**:
   - **CTEs (Common Table Expressions)**: Used for reusable calculations in partition-based queries.
   - **Temporary Tables**: Created for intermediate calculations to improve query readability.
   - **Views**: Created for storing precomputed metrics for use in Tableau visualizations.

### Tableau Dashboard
An interactive Tableau dashboard visualizes the key findings from the analysis. It includes:
- **Global Numbers**: Provides a summary of global COVID-19 cases, deaths, and vaccination statistics.
- **Percent Population Infected Per Country**: Displays the percentage of the population infected by country.
- **Total Deaths Per Continent**: Visualizes the total number of deaths grouped by continent.
- **Forecasting**: Uses predictive analysis to forecast the percentage of the population infected.


[![Dashboard Image](https://github.com/Dishant-Chouhan/COVID-19-Data-Analysis-Across-Multiple-Platforms/blob/main/Dashboard%201.png)](https://public.tableau.com/shared/699NP2N9J?:display_count=n&:origin=viz_share_link)

**Link to the Tableau Dashboard**:  
[Interactive Dashboard](https://public.tableau.com/shared/699NP2N9J?:display_count=n&:origin=viz_share_link)

## Conclusion
This project demonstrates how to combine SQL for data exploration and Tableau for interactive visualization to analyze and understand complex datasets like COVID-19 statistics. The insights gained can help identify trends, plan interventions, and understand the global pandemic's effects.

---


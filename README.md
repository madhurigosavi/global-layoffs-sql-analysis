
# Global Layoffs Analysis using SQL

## Project Overview

This project involves cleaning and analyzing a dataset of global company layoffs from 2020 to 2023 using SQL (MySQL). The primary goal is to uncover trends and insights related to layoffs across different industries, countries, companies, and time periods.

---

## Tools Used

* MySQL

---

## Dataset Source

The dataset includes information such as:

* Company
* Location
* Industry
* Total Laid Off
* Percentage Laid Off
* Date
* Stage
* Country
* Funds Raised (in millions)

---

## Data Cleaning Summary

1. **Duplicate Removal**: Identified and deleted duplicate rows using SQL window functions.
2. **Standardization**: Cleaned and standardized text data in key columns such as `company`, `country`, and `industry`.
3. **Date Formatting**: Converted textual date values to the proper SQL `DATE` format.
4. **Null Handling**:

   * Replaced blank entries with NULLs.
   * Imputed missing industry values by matching similar company names.
   * Deleted rows with both `total_laid_off` and `percentage_laid_off` as NULL.
5. **Column Optimization**: Removed temporary/helper columns used during the cleaning process.

---

## Exploratory Data Analysis Summary

The analysis explored various aspects of the layoff data, such as:

* **Layoff Volume**: Identified maximum layoffs both in number and percentage.
* **Complete Layoffs**: Detected companies that laid off 100% of their workforce.
* **Top Companies**: Ranked companies based on the total number of employees laid off.
* **Time Trends**:

  * Analyzed layoffs by year and month to identify surges and patterns.
  * Calculated rolling totals to understand cumulative impact over time.
* **Geographic Insights**: Summarized layoffs by country.
* **Industry Trends**: Highlighted which industries faced the most layoffs overall.
* **Yearly Rankings**: Found the top 5 companies with the most layoffs each year using ranking functions.

---

## Sample Insights

* Significant surge in layoffs during **2022** and **2023**, with **January 2023** recording the highest monthly layoffs.
* Major tech companies like **Amazon**, **Google**, **Meta**, and **Microsoft** were among the most impacted.
* **United States** reported the highest number of layoffs globally.
* Rolling total analysis indicated that layoffs accumulated rapidly during economic uncertainty.
* Industries such as **Consumer**, **Retail**, and **Transportation** were heavily affected.

---

## How to Use

1. Clone or download this repository.
2. Import the SQL dataset into a MySQL environment.
3. Execute the SQL scripts in sequence: first the data cleaning scripts, then the EDA scripts.


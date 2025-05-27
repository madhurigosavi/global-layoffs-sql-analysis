-- Exploratory Data Aanlysis :

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off),MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT company,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;


SELECT industry,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT `date`,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `date`
ORDER BY 2 DESC;

SELECT YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- ROLLING TOTAL LAYOFFS :

WITH Rolling_Total AS 
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH` , SUM(total_laid_off) AS Total_Off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`,Total_Off,
SUM(Total_Off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;


-- Top 5 company and layoffs in each year :

WITH Company_Year (company,years,total_laid_off)  AS
(
SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
) , Company_Year_Rank AS
(SELECT *,DENSE_RANK() OVER(
PARTITION BY years 
ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;


-- Companies that had multiple rounds of layoffs :
SELECT company, COUNT(*) AS layoff_events, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
HAVING COUNT(*) > 1
ORDER BY layoff_events DESC;


-- Layoff Trends by Country Over Time
SELECT country, SUBSTRING(`date`, 1, 7) AS month, SUM(total_laid_off) AS monthly_layoffs
FROM layoffs_staging2
GROUP BY country, month
ORDER BY country, month;

-- percentage of total layoff by number of companies per industry 

SELECT industry,
       COUNT(DISTINCT company) AS companies,
       SUM(total_laid_off) AS layoffs_by_industry,
       ROUND(100 * SUM(total_laid_off) / (SELECT SUM(total_laid_off) FROM layoffs_staging2), 2) AS percent_of_total
FROM layoffs_staging2
GROUP BY industry
ORDER BY percent_of_total DESC;






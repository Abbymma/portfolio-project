--BEGINER PROJECT PRACTICE
--STEP 1: DESCRIBING MY DATABASE FOR UNDERSTANGING
EXEC sp_columns CovidDeaths;

----VIEW THE  FIRST FEW ROWS
SELECT TOP 10* 
FROM AbProject..CovidDeaths 

-- CHECKING OUR MISSING VALUES
SELECT TOP 10 * 
FROM AbProject..CovidDeaths 
WHERE total_cases IS NULL OR total_deaths IS NULL OR total_deaths_per_million IS NULL;


--TOTAL COVID-19 CASES PER COUNTRY
SELECT location,sum(total_cases)as Total_Cases
FROM AbProject..CovidDeaths
Group by location
ORDER BY total_cases DESC

--FOR THE TOP TEN COUNTRY
SELECT TOP 10 location,sum(total_cases)as Total_Cases
FROM AbProject..CovidDeaths
Group by location
ORDER BY total_cases DESC

--LET SAY BY CONTINENT
SELECT continent,sum(total_cases)as Total_Cases
FROM AbProject..CovidDeaths
Group by continent

--LET CHECK THE HIGHEST DEATH PER MILLIONS
SELECT location, max(total_deaths_per_million) AS OVER_ALL_DEATHS
FROM AbProject..CovidDeaths
WHERE total_deaths_per_million IS NOT NULL
GROUP BY location
ORDER BY OVER_ALL_DEATHS DESC


SELECT location, max(total_deaths_per_million) AS OVER_ALL_DEATHS
FROM AbProject..CovidDeaths
WHERE total_deaths_per_million IS NOT NULL
	and location ='Nigeria'
GROUP BY location
ORDER BY OVER_ALL_DEATHS DESC

--LET CHECK THE DAILY NEW_CASES TREND FOR A COUNTRY (NIGERIA)
SELECT date,location,new_cases
FROM AbProject..CovidDeaths
WHERE location = 'Nigeria'
ORDER BY new_cases DESC

--LET FIND COUNTRIES WITH HIGHEST PEOPLE VACCINATED AND PEOPLE FULL VACCINATED
SELECT TOP 10 location,max(people_vaccinated)AS PEOPLE_VACCINATED,
MAX(people_fully_vaccinated) AS FULLY_VACCINATED
FROM AbProject..CovidDeaths
WHERE people_fully_vaccinated IS NOT NULL
GROUP BY location
ORDER BY location,PEOPLE_VACCINATED,FULLY_VACCINATED DESC

--lets looking at the HIGHEST POSITIVE RATE
SELECT TOP 10 location, MAX(positive_rate)AS POSITIVE_RATE
FROM AbProject..CovidDeaths
WHERE location IS NOT NULL
GROUP BY location
ORDER BY POSITIVE_RATE DESC














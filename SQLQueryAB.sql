---MY PROJECT PRACTICAL USING COVID DATA

SELECT*
FROM PortfolioProject..CovidDeaths


SELECT*
FROM PortfolioProject..CovidVaccination


--UPDATING COVIDVACCINATION DATA TO ZERO WHERE IS NULL
UPDATE PortfolioProject..CovidDeaths
SET total_deaths = ISNULL(total_deaths, 0),
    total_cases = ISNULL(total_cases, 0);



UPDATE PortfolioProject..CovidVaccination
SET total_tests = ISNULL(total_tests, 0),
    new_tests = ISNULL(new_tests, 0),
    total_tests_per_thousand = ISNULL(total_tests_per_thousand, 0),
	new_tests_per_thousand = ISNULL(new_tests_per_thousand, 0),
	new_tests_smoothed = ISNULL(new_tests_smoothed, 0),
	new_tests_smoothed_per_thousand = ISNULL(new_tests_smoothed_per_thousand, 0),
	 positive_rate= ISNULL(positive_rate, 0),
	tests_per_case = ISNULL(tests_per_case, 0),
	tests_units = ISNULL(tests_units, 0),
	total_vaccinations = ISNULL(total_vaccinations, 0),
	people_fully_vaccinated = ISNULL(people_fully_vaccinated, 0),
	people_fully_vaccinated_per_hundred = ISNULL(people_fully_vaccinated_per_hundred, 0),
	people_vaccinated= ISNULL(people_vaccinated, 0),
	new_vaccinations = ISNULL(new_vaccinations, 0),
	new_vaccinations_smoothed = ISNULL(new_vaccinations_smoothed, 0),
	total_vaccinations_per_hundred = ISNULL(total_vaccinations_per_hundred, 0),
	people_vaccinated_per_hundred= ISNULL(people_vaccinated_per_hundred, 0),
	new_vaccinations_smoothed_per_million = ISNULL(new_vaccinations_smoothed_per_million, 0),
	stringency_index = ISNULL(stringency_index, 0),
	population_density = ISNULL(population_density, 0),
	median_age = ISNULL(median_age, 0),
	aged_65_older = ISNULL(aged_65_older, 0),
	aged_70_older = ISNULL(aged_70_older, 0),
	gdp_per_capita = ISNULL(gdp_per_capita, 0),
	extreme_poverty = ISNULL(extreme_poverty, 0),
	cardiovasc_death_rate = ISNULL(cardiovasc_death_rate, 0),
	diabetes_prevalence = ISNULL(diabetes_prevalence, 0),
	female_smokers = ISNULL(female_smokers, 0),
	male_smokers = ISNULL(male_smokers, 0),
	handwashing_facilities = ISNULL(handwashing_facilities, 0),
	hospital_beds_per_thousand = ISNULL(hospital_beds_per_thousand, 0),
	life_expectancy = ISNULL(life_expectancy, 0),
	human_development_index = ISNULL(human_development_index, 0);

--WHEN UPDATING FROM ZERO TO NULL
UPDATE PortfolioProject..CovidVaccination
SET total_tests = NULLIF(TRY_CONVERT(FLOAT, total_tests), 0),
    new_tests = NULLIF(TRY_CONVERT(FLOAT, new_tests), 0),
    total_tests_per_thousand = NULLIF(TRY_CONVERT(FLOAT, total_tests_per_thousand), 0),
    new_tests_per_thousand = NULLIF(TRY_CONVERT(FLOAT, new_tests_per_thousand), 0),
    new_tests_smoothed = NULLIF(TRY_CONVERT(FLOAT, new_tests_smoothed), 0),
    new_tests_smoothed_per_thousand = NULLIF(TRY_CONVERT(FLOAT, new_tests_smoothed_per_thousand), 0),
    positive_rate = NULLIF(TRY_CONVERT(FLOAT, positive_rate), 0),
    tests_per_case = NULLIF(TRY_CONVERT(FLOAT, tests_per_case), 0),
    tests_units = NULLIF(TRY_CONVERT(NVARCHAR(255), tests_units), '0'),
    total_vaccinations = NULLIF(TRY_CONVERT(FLOAT, total_vaccinations), 0),
    people_fully_vaccinated = NULLIF(TRY_CONVERT(FLOAT, people_fully_vaccinated), 0),
    people_fully_vaccinated_per_hundred = NULLIF(TRY_CONVERT(FLOAT, people_fully_vaccinated_per_hundred), 0),
    people_vaccinated = NULLIF(TRY_CONVERT(FLOAT, people_vaccinated), 0),
    new_vaccinations = NULLIF(TRY_CONVERT(FLOAT, new_vaccinations), 0),
    new_vaccinations_smoothed = NULLIF(TRY_CONVERT(FLOAT, new_vaccinations_smoothed), 0),
    total_vaccinations_per_hundred = NULLIF(TRY_CONVERT(FLOAT, total_vaccinations_per_hundred), 0),
    people_vaccinated_per_hundred = NULLIF(TRY_CONVERT(FLOAT, people_vaccinated_per_hundred), 0),
    new_vaccinations_smoothed_per_million = NULLIF(TRY_CONVERT(FLOAT, new_vaccinations_smoothed_per_million), 0),
    stringency_index = NULLIF(TRY_CONVERT(FLOAT, stringency_index), 0),
    population_density = NULLIF(TRY_CONVERT(FLOAT, population_density), 0),
    median_age = NULLIF(TRY_CONVERT(FLOAT, median_age), 0),
    aged_65_older = NULLIF(TRY_CONVERT(FLOAT, aged_65_older), 0),
    aged_70_older = NULLIF(TRY_CONVERT(FLOAT, aged_70_older), 0),
    gdp_per_capita = NULLIF(TRY_CONVERT(FLOAT, gdp_per_capita), 0),
    extreme_poverty = NULLIF(TRY_CONVERT(FLOAT, extreme_poverty), 0),
    cardiovasc_death_rate = NULLIF(TRY_CONVERT(FLOAT, cardiovasc_death_rate), 0),
    diabetes_prevalence = NULLIF(TRY_CONVERT(FLOAT, diabetes_prevalence), 0),
    female_smokers = NULLIF(TRY_CONVERT(FLOAT, female_smokers), 0),
    male_smokers = NULLIF(TRY_CONVERT(FLOAT, male_smokers), 0),
    handwashing_facilities = NULLIF(TRY_CONVERT(FLOAT, handwashing_facilities), 0),
    hospital_beds_per_thousand = NULLIF(TRY_CONVERT(FLOAT, hospital_beds_per_thousand), 0),
    life_expectancy = NULLIF(TRY_CONVERT(FLOAT, life_expectancy), 0),
    human_development_index = NULLIF(TRY_CONVERT(FLOAT, human_development_index), 0);

--JOINING COVIDDEATH AND COVIDVACCINE TABLES
SELECT 
    cd.location, 
    max(cd.total_cases) as total_cases, 
    max(cd.new_cases) as new_cases, 
    max(cd.total_deaths) as total_deaths, 
    max(cd.new_deaths) as new_deaths,
    max(cv.new_tests) as new_tests, 
    max(cv.total_tests) as total_tests, 
    max(cv.total_tests_per_thousand) as total_tests_per_thousand,
    max(cv.total_vaccinations) as total_vaccinations, 
    max(cv.people_vaccinated) as people_vaccinated, 
    max(cv.people_fully_vaccinated) as people_fully_vaccinated
FROM PortfolioProject..CovidDeaths cd
JOIN PortfolioProject..CovidVaccination cv 
ON cd.date = cv.date 
AND cd.iso_code = cv.iso_code
group by cd.location


---change fron NVARCHAR TO FLOAT
ALTER TABLE PortfolioProject..CovidDeaths
ALTER COLUMN total_cases FLOAT;

ALTER TABLE PortfolioProject..CovidDeaths
ALTER COLUMN total_deaths FLOAT;






-- Mortality Rate (Total Deaths / Total Cases)
SELECT 
     location,
    max(total_deaths) as total_deaths,
    max(total_cases) as total_cases,
 ROUND(MAX(total_deaths) * 100.0 / NULLIF(MAX(total_cases), 0), 2) AS mortality_rate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
AND location IS NOT NULL
GROUP BY location
ORDER BY mortality_rate DESC;

SELECT *
FROM PortfolioProject..CovidDeaths
WHERE TRY_CAST(total_cases AS FLOAT) IS NULL 
AND total_cases IS NOT NULL;

-- Impact of Vaccination (People Vaccinated vs. Cases)
alter table portfolioproject..CovidVaccination
alter column people_vaccinated FLOAT;


SELECT cd.location,
       cd.date,
       cd.total_cases, 
	   cv.people_vaccinated,
       ROUND(cv.people_vaccinated * 100.0 / NULLIF(cd.total_cases, 0), 2) AS vaccinated_rate
FROM Portfolioproject..coviddeaths cd
join portfolioproject..covidVaccination cv
 on cd.iso_code = cv.iso_code
 and cd.location = cv.location
 and cd.date = cv.date
where cv.people_vaccinated is not null
GROUP BY cd.continent;

--WHEN USING GROUP BY
  SELECT 
    cd.continent,
    MAX(cd.location) AS location, 
    MAX(cd.date) AS latest_date,
    MAX(CAST(cd.total_cases AS FLOAT)) AS total_cases, 
    MAX(cv.people_vaccinated) AS people_vaccinated,
    ROUND(MAX(cv.people_vaccinated) * 100.0 / NULLIF(MAX(CAST(cd.total_cases AS FLOAT)), 0), 2) AS vaccinated_rate
FROM PortfolioProject..CovidDeaths cd
JOIN PortfolioProject..CovidVaccination cv
    ON cd.iso_code = cv.iso_code
    AND cd.location = cv.location
    AND cd.date = cv.date
WHERE cv.people_vaccinated IS NOT NULL
GROUP BY cd.continent;


-- LOOKING AT THE DAILY NEW CASES AND DEATHS TREND
ALTER TABLE Portfolioproject..CovidDeaths
ALTER COLUMN new_cases FLOAT;

ALTER TABLE Portfolioproject..CovidDeaths
ALTER COLUMN new_deaths FLOAT;


SELECT 
    max(continent) as continent,
    max(location) as location,
	max(date) as latest_date,
	max(cast(new_cases as float)) as new_cases,
	max(cast(new_deaths as float)) as new_deaths,
    ROUND(max(cast(new_deaths as float))* 100.0/ NULLIF(max(cast(new_cases as float)), 0),2) AS Death_Rate
FROM portfolioproject..CovidDeaths
where continent is not null
group by location
order by location, latest_date;


-- Check Missing Data in the Dataset
SELECT 
    'CovidDeaths' AS dataset, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN total_cases IS NULL THEN 1 ELSE 0 END) AS missing_cases, 
    SUM(CASE WHEN total_deaths IS NULL THEN 1 ELSE 0 END) AS missing_deaths
FROM PortfolioProject..CovidDeaths

UNION ALL

SELECT 
    'CovidVaccination' AS dataset, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN total_vaccinations IS NULL THEN 1 ELSE 0 END) AS missing_vaccinations, 
    SUM(CASE WHEN people_vaccinated IS NULL THEN 1 ELSE 0 END) AS missing_people_vaccinated
FROM PortfolioProject..CovidVaccination;


















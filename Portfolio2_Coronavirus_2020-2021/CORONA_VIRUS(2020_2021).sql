-- PORTFOLIO PROJECT : CORONA VIRUS 2020-2021

-- DATA CLEANING
# DATA STANDARDIZATION
SELECT * FROM coviddeaths;
SELECT * FROM covidvaccinations;

#date
SELECT DISTINCT `date`, STR_TO_DATE(`date`, '%d/%m/%Y')
FROM coviddeaths
ORDER BY 2;

UPDATE coviddeaths
SET `date` = STR_TO_DATE(`date`, '%d/%m/%Y');

UPDATE covidvaccinations
SET `date` = STR_TO_DATE(`date`, '%d/%m/%Y');

ALTER TABLE coviddeaths
MODIFY COLUMN `date` DATE;

ALTER TABLE covidvaccinations
MODIFY COLUMN `date` DATE;

#population
SELECT population
FROM coviddeaths
WHERE population = '';

UPDATE coviddeaths
SET population = NULL
WHERE population = '';

ALTER TABLE coviddeaths
MODIFY COLUMN population BIGINT;

#total_cases
UPDATE coviddeaths
SET total_cases = NULL
WHERE total_cases = '';

ALTER TABLE coviddeaths
MODIFY COLUMN total_cases INT;

#total_deaths
UPDATE coviddeaths
SET total_deaths = NULL
WHERE total_deaths = '';

ALTER TABLE coviddeaths
MODIFY COLUMN total_deaths INT;

#new_cases
UPDATE coviddeaths
SET new_cases = NULL
WHERE new_cases = '';

ALTER TABLE coviddeaths
MODIFY COLUMN new_cases INT;

#new_deaths
UPDATE coviddeaths
SET new_deaths = NULL
WHERE new_deaths = '';

ALTER TABLE coviddeaths
MODIFY COLUMN new_deaths INT;

#new_vaccinations
UPDATE covidvaccinations
SET new_vaccinations = NULL
WHERE new_vaccinations = '';

ALTER TABLE covidvaccinations
MODIFY COLUMN new_vaccinations INT;

-- SQL DATA EXPLORATION
-- Countries
SELECT *
FROM coviddeaths
ORDER BY 3,4;

SELECT *
FROM covidvaccinations
ORDER BY 3,4;

# Death rates by countries
SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM coviddeaths
ORDER BY 1,2;

# Vietnam's Death rates 
SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM coviddeaths
WHERE location LIKE 'Viet%';


# Percentage of population infected with covid
SELECT location, `date`, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM coviddeaths
ORDER BY 1,2;

# Percentage of population infected with covid in Vietnam
SELECT location, `date`, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM coviddeaths
WHERE location LIKE 'Viet%';


# Country with the highest infection rate compared to population
SELECT location, `date`, population, MAX(total_cases) as HighestInfection, MAX((total_cases/population)*100) as PercentPopulationInfected
FROM coviddeaths
GROUP BY location, `date`, population
ORDER BY 5 DESC;


SELECT location, population, MAX(total_cases) as HighestInfection, MAX((total_cases/population)*100) as PercentPopulationInfected
FROM coviddeaths
GROUP BY location, population
ORDER BY 4 DESC;

# The country with the highest death rate
SELECT location, MAX(total_deaths) as TotalDeath
FROM coviddeaths
WHERE continent != '' AND total_deaths IS NOT NULL
GROUP BY location
ORDER BY 2 DESC;


-- Continent
SELECT continent, SUM(new_deaths) as TotalDeath
FROM coviddeaths
WHERE continent != ''
GROUP BY continent
ORDER BY 2 DESC;


-- Global
# Covid death rate worldwide
SELECT new_cases, new_deaths, (new_deaths/new_cases)*100 as DeathPercentage
FROM coviddeaths;

SELECT SUM(new_cases) as Total_case, SUM(new_deaths) as Total_deaths, (SUM(new_deaths)/SUM(new_cases))*100 as DeathPercentage
FROM coviddeaths
WHERE continent != '';


# Total number of people vaccinated by country
SELECT dea.continent, dea.location, dea.`date`, population, new_vaccinations 
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.`date` = vac.`date`
WHERE dea.continent != '';

# Rolling total number of people vaccinated by country
SELECT dea.continent, dea.location, dea.`date`, population, new_vaccinations,
SUM(new_vaccinations) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.`date`) as RollingPeopleVaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.`date` = vac.`date`
WHERE dea.continent != '';

# Percentage of population in each country that has been vaccinated 
WITH CTE_PeopleVaccinated AS
(
SELECT dea.continent, dea.location, dea.`date`, population, new_vaccinations,
SUM(new_vaccinations) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.`date`) as RollingPeopleVaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.`date` = vac.`date`
WHERE dea.continent != ''
)
SELECT *, (RollingPeopleVaccinated/population)*100 as PeopleVaccinatedRate
FROM CTE_PeopleVaccinated;

# create views
CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.`date`, population, new_vaccinations,
SUM(new_vaccinations) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.`date`) as RollingPeopleVaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
    AND dea.`date` = vac.`date`;

SELECT *, (RollingPeopleVaccinated/population)*100 as PeopleVaccinatedRate
FROM PercentPopulationVaccinated;


SELECT * FROM coviddeaths;
SELECT * FROM covidvaccinations;


# Is there a difference between countries with high human development index and countries with low human development index?
SELECT DISTINCT location, human_development_index
FROM covidvaccinations
ORDER BY 2 DESC;


SELECT DISTINCT location, human_development_index,
CASE
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) >= 0.800 THEN 'Very High HDI'
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) >= 0.700 THEN 'High HDI'
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) BETWEEN 0.550 AND 0.699 THEN 'Medium HDI'
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) < 0.550 THEN 'Low HDI'
END AS HDI_group_countries
FROM covidvaccinations
ORDER BY 2 DESC;

SELECT DISTINCT dea.continent, dea.location, human_development_index, 
CASE
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) >= 0.800 THEN 'Very High HDI'
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) >= 0.700 THEN 'High HDI'
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) BETWEEN 0.550 AND 0.699 THEN 'Medium HDI'
    WHEN CAST(REPLACE(human_development_index, ',', '.') AS DECIMAL(5,3)) < 0.550 THEN 'Low HDI'
END AS HDI_group_countries, MAX(total_cases) as Total_cases, MAX(total_deaths) as Total_deaths
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
	AND dea.`date` = vac.`date`
WHERE human_development_index != '' AND dea.continent != ''
GROUP BY dea.continent, dea.location, human_development_index
ORDER BY Total_cases DESC;



# What is the relationship between the rate of fully vaccinated people and the rate of new deaths?
#people_fully_vaccinated
UPDATE covidvaccinations
SET people_fully_vaccinated = NULL
WHERE people_fully_vaccinated = '';

ALTER TABLE covidvaccinations
MODIFY COLUMN people_fully_vaccinated INT;


SELECT dea.continent, dea.location, population, MAX(people_fully_vaccinated) as TotalFullyVaccinated, SUM(new_deaths) as TotalNewDeaths, 
(MAX(people_fully_vaccinated)/population)*100 as PercentFullVaccinated, (SUM(new_deaths)/MAX(people_fully_vaccinated))*100 as DeathRatePer100Vaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
	AND dea.`date` = vac.`date`
WHERE dea.continent != '' AND new_deaths IS NOT NULL AND people_fully_vaccinated IS NOT NULL
GROUP BY dea.continent, dea.location, population
ORDER BY PercentFullVaccinated  DESC;


WITH first_vacc_dates AS (
  SELECT location, MIN(date) AS first_vacc_date
  FROM covidvaccinations
  WHERE people_fully_vaccinated > 0
  GROUP BY location
)
SELECT
  dea.continent,
  dea.location,
  dea.population,
  MAX(vac.people_fully_vaccinated) AS TotalFullyVaccinated,
  SUM(dea.new_deaths) AS TotalNewDeaths,
  (MAX(vac.people_fully_vaccinated) / dea.population) * 100 AS PercentFullVaccinated,
  (SUM(dea.new_deaths) / MAX(vac.people_fully_vaccinated)) * 100 AS DeathRatePer100Vaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac ON dea.location = vac.location AND dea.date = vac.date
JOIN first_vacc_dates fvd ON dea.location = fvd.location
WHERE dea.continent != ''
  AND dea.new_deaths IS NOT NULL
  AND vac.people_fully_vaccinated IS NOT NULL
  AND dea.date >= fvd.first_vacc_date
GROUP BY dea.continent, dea.location, dea.population
HAVING MAX(vac.people_fully_vaccinated) > SUM(dea.new_deaths)
ORDER BY PercentFullVaccinated DESC;



# create views
DROP VIEW IF EXISTS DeathRatePer100Vaccinated;
CREATE VIEW DeathRatePer100Vaccinated AS
WITH first_vacc_dates AS (
  SELECT location, MIN(date) AS first_vacc_date
  FROM covidvaccinations
  WHERE people_fully_vaccinated > 0
  GROUP BY location
)
SELECT
  dea.continent,
  dea.location,
  dea.population,
  MAX(vac.people_fully_vaccinated) AS TotalFullyVaccinated,
  SUM(dea.new_deaths) AS TotalNewDeaths,
  (MAX(vac.people_fully_vaccinated) / dea.population) * 100 AS PercentFullVaccinated,
  (SUM(dea.new_deaths) / MAX(vac.people_fully_vaccinated)) * 100 AS DeathRatePer100Vaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac ON dea.location = vac.location AND dea.date = vac.date
JOIN first_vacc_dates fvd ON dea.location = fvd.location
WHERE dea.continent != ''
  AND dea.new_deaths IS NOT NULL
  AND vac.people_fully_vaccinated IS NOT NULL
  AND dea.date >= fvd.first_vacc_date
GROUP BY dea.continent, dea.location, dea.population
HAVING MAX(vac.people_fully_vaccinated) > SUM(dea.new_deaths)
ORDER BY PercentFullVaccinated DESC;



SELECT *
FROM DeathRatePer100Vaccinated;




select * from coviddeaths;
--Data to be used
select location,date,total_cases,new_cases,total_deaths,Population from coviddeaths order by 1,2

--Looking at Total Cases vs Total Deaths
SELECT location, date,total_cases, new_cases, total_deaths,
(total_deaths::NUMERIC / total_cases::NUMERIC) * 100 as Deathpercentage
FROM  coviddeaths 
--Location wise
where location like '%India%'
ORDER BY  location, date;

--shows percentage of population get covid
SELECT location, date,Population,total_cases,
(total_cases::NUMERIC / population) * 100 as Deathpercentage
FROM  coviddeaths 
where continent is not null
ORDER BY  1,2;

--Looking at countries with Highest Infection rate compared to Population
SELECT location,Population,MAX(total_cases) as Hishest_Infection_count,
MAX((total_cases::NUMERIC / population)) * 100 as percent_Population_Infected
FROM  coviddeaths 
group  by location,Population
where continent is not null
ORDER BY  percent_Population_Infected desc;

--Showing Countries with highest Death count per Population
SELECT location,
MAX(CAST(Total_deaths AS int)) AS Total_death_count
FROM  coviddeaths 
where continent is not null
and total_deaths is not null
GROUP BY location
ORDER BY Total_death_count DESC;

--Break by Continent
SELECT continent,
MAX(CAST(Total_deaths AS int)) AS Total_death_count
FROM  coviddeaths 
where continent is not null
and total_deaths is not null
GROUP BY continent
ORDER BY Total_death_count DESC;

--Global numbers
SELECT sum(new_cases)as total_cases,sum(cast(new_deaths AS int)) as total_deaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as Death_Percentage
FROM coviddeaths 
WHERE continent IS NOT NULL 
ORDER BY  1,2;


--Joinning two tables
SELECT * FROM covidvaccinations vv
JOIN coviddeaths dd 
ON dd.location = vv.location AND dd.date = vv.date;

--Looking at Total Population vs Vaccination
with popvsvac (Continent,Location,date,Population,new_vaccinations,Rolling_people_vaccinated)
as(  
SELECT dd.continent,dd.location,dd.date,dd.population,vv.new_vaccinations,
SUM(CAST(vv.new_vaccinations AS INTEGER)) 
OVER (PARTITION BY dd.location ORDER BY dd.location,dd.date)as Rolling_people_vaccinated
from coviddeaths dd
JOIN covidvaccinations vv ON dd.location = vv.location AND dd.date = vv.date
WHERE dd.continent IS NOT NULL 
)
select *,(Rolling_people_vaccinated/Population)*100 as percentage_vaccinated from popvsvac;


--India vaccinated
SELECT cv.location,
MAX(cd.population) AS total_population,
MAX(cv.people_fully_vaccinated::FLOAT) AS fully_vaccinated,
(MAX(cv.people_fully_vaccinated::FLOAT) / MAX(cd.population::FLOAT)) * 100 AS vaccination_percentage
FROM CovidDeaths cd
JOIN CovidVaccinations cv 
ON cd.location = cv.location AND cd.date = cv.date
WHERE cv.location = 'India'
GROUP BY cv.location;


--Location wise
select location,sum(cast(new_deaths as int)) as TotalDeathCount
from coviddeaths
where continent is null
and location not in('World','European Union','International')
group by location
order by TotalDeathCount desc;

--highest infection count
SELECT location,population,
MAX(total_cases) AS HighestInfectionCount,
MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM coviddeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected desc ;

--removed null values
SELECT location,population,
MAX(total_cases) AS HighestInfectionCount,
MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM coviddeaths
GROUP BY location, population
HAVING MAX((total_cases/population))*100 IS NOT NULL
ORDER BY PercentPopulationInfected DESC;

--with date
SELECT location,population,date,
MAX(total_cases) AS HighestInfectionCount,
MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM coviddeaths
GROUP BY location, population,date
ORDER BY PercentPopulationInfected desc ;



SELECT 
  location,
  population,
  date,
  MAX(total_cases) AS HighestInfectionCount,
  MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM 
  coviddeaths
GROUP BY 
  location, population, date
ORDER BY 
  CASE 
    WHEN MAX((total_cases/population))*100 IS NULL THEN 1
    ELSE 0
  END,
  MAX((total_cases/population))*100 DESC;

















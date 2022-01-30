select location,date,total_cases,new_cases,total_deaths,population
from CovidDeaths$
order by 1,2
-- what is the % of total_cases vs total_Deaths
select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100
as DeathPercentage
from CovidDeaths$

-- Now We Find Total Cases vs Total Population
select location,date,population,total_cases,(total_cases/population)*100
as GotCovid
from CovidDeaths$
where location like '%states%'

--Highest infection countary 

select  location,population , max(total_cases) as HighestInfection, max(total_cases/population)*100
as PercentPopulationInfected
from CovidDeaths$
group by location,population
order by PercentPopulationInfected desc

-- Find Highest Death Count in country

select  location, max(cast(total_deaths as int)) as TotalDeathsCount
from CovidDeaths$
where continent is not null
group by location
order by TotalDeathsCount desc

-- Find Highest Effective continent

select  continent, max(cast(total_deaths as int)) as TotalDeathsCount
from CovidDeaths$
where continent is not null
group by continent
order by TotalDeathsCount desc

-- Global Effective Numbers

select  location,data,total_deaths,(total_deaths/total_cases)*100 as TotalDeathsCount
from CovidDeaths$
where continent is not null
group by location
order by TotalDeathsCount desc

-- now join CovidDeaths and CovidVacation tables

select*
from CovidVacation$ 
join CovidDeaths$ 
on CovidDeaths$.location = CovidVacation$.location
and CovidDeaths$.date = CovidVacation$.date










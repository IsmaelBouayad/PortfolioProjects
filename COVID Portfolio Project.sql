select *
from CovidDeaths$
where continent is not null
order by 3, 4

--select *
--from CovidVaccinations$
--order by 3, 4

-- Select Data that we are going to be using

select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths$
order by 1, 2

--Looking at total cases vs total deaths
--Shows percentage of dying if you get covid in your country

select location, date, total_cases, total_deaths, (total_deaths / total_cases) * 100 as DeathPercentage
from CovidDeaths$
Where location like 'Italy'
order by 1, 2

--Total cases vs Population
----Shows percentage of population got covid

select location, date, population, total_cases, (total_cases / population) * 100 as CovidInfPercentage
from CovidDeaths$
Where location like '%states%'
order by 1, 2 

-- Looking at countries with highest infection rate compared to population

Select location, population, MAX(total_cases)as HighestInfCount, MAX((total_cases / population)) * 100 as CovidInfPercentage
From CovidDeaths$
--Where location like '%states%'
Group by location, population
Order by 4 desc

-- Looking at countries with highest death rate per population

Select location, MAX(cast(total_deaths as int)) as total_deaths 
From CovidDeaths$
--Where location like '%states%'
where continent is not null
Group by location
Order by 2 desc

--Break things by continent

Select location, MAX(cast(total_deaths as int)) as total_deaths 
From CovidDeaths$
--Where location like '%states%'
where continent is  null
Group by location
Order by 2 desc

--Showing the continents with the highest death count per population

Select continent, MAX(cast(total_deaths as int)) as total_deaths 
From CovidDeaths$
--Where location like '%states%'
where continent is not null
Group by continent
Order by 2 desc

--GLOBAL NUMBERS

--global deaths
Select MAX(cast(total_deaths as int))
From CovidDeaths$

--you can make it like above or below

Select location, MAX(cast(total_deaths as int))
From CovidDeaths$
Where location like 'World'
Group by location

--global cases
Select location, MAX(cast(total_cases as int))
From CovidDeaths$
Where location like 'World'
Group by location

--you can make it like above or below

Select MAX(cast(total_cases as int))
From CovidDeaths$

--global new cases per day

Select date, SUM(new_cases)as TotalNewCases, SUM(cast(new_deaths as Int)) as TotalNewDeaths
From CovidDeaths$
where continent is not null
Group by date
Order by 1

--total cases and total deaths with global death ratio

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths$
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



























































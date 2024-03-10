
--Select*
--From CovidDeaths
--Order by 3,4

--Select*
--From CovidVaccinations
--Order by 3,4

-- Select the data that we are going to use

--Select location, date, total_cases, new_cases, total_deaths, population
--From CovidDeaths
--order by 1,2

-- Looking for Total Cases vs Total Deaths

--Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100  DeathPercentage
--From CovidDeaths
--order by 1,2

--Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100  DeathPercentage
--From CovidDeaths
--Where location Like '%states%'
--order by 2

-- Looking at Total Cases Vs Population

--Select location, date, population, total_cases, (total_cases/ population)*100  DeathPercentage
--From CovidDeaths
--order by 1,2
  

--Select location, date, population, total_cases, (total_cases/ population)*100  DeathPercentage
--From CovidDeaths
--Where location = 'Brazil'
--order by 1,2

-- Looking at countries with Highest Infiction Rate copared to Population

--Select location, population, MAX(total_cases) as InfictionCount, MAX((total_cases/ population))*100  
--AS PercentPopulationInficted
--From CovidDeaths
--Group By location, population 
--order by PercentPopulationInficted desc

-- Looking for Highest Death Count compared to Population

--Select location, MAX(cast(total_deaths as int)) as TotalDeathsCount  
--From CovidDeaths
--Group By location 
--order by TotalDeathsCount desc

-- We have an issue that we need to remove group such as 'World, Africa, Asia, ....'

--Select location, MAX(cast(total_deaths as int)) as TotalDeathsCount
--From CovidDeaths
--Where continent is not NULL
--Group by location
--Order by TotalDeathsCount desc

-- We need to excluding the null value from TotalDeathsCount columns

--With CTE_DeathsByCountry as
--(Select location, MAX(cast(total_deaths as int)) as TotalDeathsCount
--From CovidDeaths
--Where continent is not NULL
--Group by location
--)
--Select *
--From CTE_DeathsByCountry
--Where TotalDeathsCount is not NUll
--Order by TotalDeathsCount desc

--Braek Things Down By Continent

--Select location, MAX(cast(total_deaths as int)) as TotalDeaths
--From CovidDeaths
--Where continent is NULL
--Group By location
--Order by TotalDeaths desc

/*
Global Numbers
*/
--Select date, SUM(cast(new_cases as int))  NewCases, SUM(cast(new_deaths as int))  NewDeaths
--From CovidDeaths
--Where continent is not NUll
--Group by date
--Order by 1,2

--Select date, SUM(cast(new_cases as int))  NewCases, SUM(cast(new_deaths as int))  NewDeaths,
--SUM(cast(new_deaths as int)) / SUM(new_cases) *100  NewDeathsPercentage
--From CovidDeaths
--Where continent is not NUll
--Group by date
--Order by 1,2


--Looking at Total Population Vs Toatal Vaccinations

--Select*
--From CovidDeaths as dea
--Join CovidVaccinations as vac
--	ON dea.location = vac.location
--	and dea.date = vac.date

--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--From CovidDeaths as dea
--Join CovidVaccinations as vac
--	ON dea.location = vac.location
--	and dea.date = vac.date
--Where dea.continent is not null
--order by 2,3

--Delete null new vaccinations days

--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--From CovidDeaths as dea
--Join CovidVaccinations as vac
--	ON dea.location = vac.location
--	and dea.date = vac.date
--Where dea.continent is not null
--And vac.new_vaccinations is not null
--order by 2,3

--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
--SUM(Cast(vac.new_vaccinations as int)) Over (Partition By dea.location Order By dea.location, dea.Date)
--As TotalVaccination
--From CovidDeaths as dea
--Join CovidVaccinations as vac
--	ON dea.location = vac.location
--	and dea.date = vac.date
--Where dea.continent is not null
--And vac.new_vaccinations is not null
--order by 2,3

 -- Use CTE

-- With PopVsVac (continent, location, date, population, new_vaccinations,TotalVaccinations)
-- as
-- (
-- Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
--SUM(Cast(vac.new_vaccinations as int)) Over (Partition By dea.location Order By dea.location, dea.Date)
--As TotalVaccination
--From CovidDeaths as dea
--Join CovidVaccinations as vac
--	ON dea.location = vac.location
--	and dea.date = vac.date
--Where dea.continent is not null
--And vac.new_vaccinations is not null
--order by 2,3
--)

--Select*, (TotalVaccinations/population)*100 As TotalVacPercentage
--From PopVsVac

--Temp Table

--Create Table #PercentPopulationVaccinated
--(
--continent nvarchar(255),
--location nvarchar(255),
--date datetime,
--population numeric,
--new_vaccinations numeric,
--TotalVacPercentage numeric
--)
--Insert into #PercentPopulationVaccinated
-- Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
--SUM(Cast(vac.new_vaccinations as int)) Over (Partition By dea.location Order By dea.location, dea.Date)
--As TotalVaccination
--From CovidDeaths as dea
--Join CovidVaccinations as vac
--	ON dea.location = vac.location
--	and dea.date = vac.date
--Where dea.continent is not null
--And vac.new_vaccinations is not null
----order by 2,3

--Select*, (TotalVacPercentage/population)*100 As Percentage
--From  #PercentPopulationVaccinated

--Creating view to store data for later Visulaization

--Create View PercentPopulationVaccinated
--As
--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
--SUM(Cast(vac.new_vaccinations as int)) Over (Partition By dea.location Order By dea.location, dea.Date)
--As TotalVaccination
--From CovidDeaths as dea
--Join CovidVaccinations as vac
--	ON dea.location = vac.location
--	and dea.date = vac.date
--Where dea.continent is not null
--And vac.new_vaccinations is not null
--order by 2,3

Select*
From PercentPopulationVaccinated
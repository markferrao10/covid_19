select *
from covid_portfolio.covid_deaths
order by 3, 4;
select *
 FROM covid_portfolio.`covidvaccinations (1)1`
 order by 3, 4;
 
 -- select date that we r using
 
 select location, date, new_cases, total_deaths, population, total_cases_per_million
FROM covid_portfolio.`coviddeaths (1)`
order by location, total_deaths_per_million;

-- looking at total deaths vs total cases

select location, total_deaths, date 
FROM covid_portfolio.`coviddeaths (1)`
where location = 'india' ;

-- looking at total cases vs population
select location, date,  total_cases_per_million, population, (total_cases_per_million/ population) * 100 as death_percentage
FROM covid_portfolio.`coviddeaths (1)`
order by population, total_cases_per_million ;

-- looking at countries with highest infection rate
select location, date,  max(total_cases_per_million) as highest_infection_count, population, (total_cases_per_million/ population) * 100 as case_percentage
FROM covid_portfolio.`coviddeaths (1)`
group by population, location
order by population, count(total_cases_per_million) 
desc
;
-- showing countries with highest death count per population
select continent, date,  max(total_deaths_per_million ) as highest_death_count
FROM covid_portfolio.`coviddeaths (1)`
group by continent
order by count(total_deaths_per_million) 
desc;
-- global numberds

select date, count(total_deaths_per_million), sum(new_cases), sum(new_deaths), (total_deaths/ total_cases) * 100 as death_percentage
FROM covid_portfolio.`coviddeaths (1)`
where continent is not null
group by date
order by 1, 2 ;

--  vaccination

select *
FROM covid_portfolio.`covidvaccinations (1)1`;

-- looking ata total population vs vaccination 
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
fROM covid_portfolio.`coviddeaths (1)` dea
 join covid_portfolio.`covidvaccinations (1)1` vac
 on dea.location = vac.location
 and dea.date = vac.date
 order by 1,2,3;
 
 with popvsvac (continent, location, date, new_vaccinations, population)
 as
 ( select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
fROM covid_portfolio.`coviddeaths (1)` dea
 join covid_portfolio.`covidvaccinations (1)1` vac
 on dea.location = vac.location
 and dea.date = vac.date

 ) 
 select *
 from popvsvac;
 
 #
 
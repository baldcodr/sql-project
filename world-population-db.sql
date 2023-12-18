SHOW TABLES;

SELECT *
FROM world.city;

SELECT *
FROM world.country;

SELECT *
FROM world.countrylanguage;

-- List all continents
SELECT Continent
FROM world.country
GROUP BY Continent;

SELECT DISTINCT Continent
FROM world.country;

-- List all the countries in Africa
SELECT name
FROM world.country
WHERE continent = "Antarctica";

-- Count the number of countries in each continent
SELECT Continent, COUNT(name) AS world_country
FROM world.country
GROUP BY Continent
ORDER BY world_country DESC;

-- Calculate the average population of each continent
SELECT Continent, AVG(population) AS avg_continent
FROM world.country
GROUP BY Continent
ORDER BY avg_continent DESC;

-- List all countries with a population above the average world population
SELECT AVG(population) 
FROM world.country;

SELECT Name, population FROM world.country
WHERE Population > (SELECT AVG(population) FROM world.country);

-- Find the top 5 countries with the highest population density
SELECT Name, Continent, Population, SurfaceArea * 1000 AS SF1000, Population/SurfaceArea AS PopulationDensity
FROM world.country
ORDER BY PopulationDensity DESC
LIMIT 10;
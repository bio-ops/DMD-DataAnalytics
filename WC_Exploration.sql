-- 1. From Award winners table, how many distinct teams have won awards?
-- Ans: 29
SELECT COUNT(DISTINCT (team_code))
FROM award_winners 

-- 2. From award winners table, what are the top 5 teams and which team has won the most awards?
-- Ans: Brazil has won the most awards with 20. Italy and Argentina tie for 2nd with France coming in 3rd and Germany 4th

SELECT team_name, COUNT(team_name) AS 'num_awards' -- sets a counter for how many times a team name occurs
FROM award_winners 
GROUP BY team_name -- group num_awards by team
ORDER BY COUNT(team_name)  DESC -- order by highest frequency first, use count function because we care about count

LIMIT 5; -- Only returns top x number of values

-- 3. Which award has Brazil won the most?
-- Ans: A-6 and A-4

SELECT award_id, COUNT(award_id) AS 'freq_awards'
FROM award_winners 
WHERE team_name = 'Brazil'
GROUP BY award_id 
ORDER BY COUNT(award_id) DESC; 

-- What is A-6 and A-4?
-- Ans Bronze Boot and Golden Boot Awards
SELECT award_name, award_id 
FROM awards 
WHERE award_id = 'A-4' OR award_id  = 'A-6'
GROUP BY award_name;

-- 4. Which players have won the golden boot awards from Brazil?

SELECT award_name, tournament_name, family_name, COUNT(family_name) AS 'Award Freq'
FROM award_winners 
WHERE team_name = 'Brazil' AND award_id  = 'A-4'
GROUP BY family_name 
ORDER BY COUNT(family_name) DESC; 

-- 5. Which of the players that have won the golden boot from Brazil scored the most goals?
-- Ademir scored the most goals at 9 goals scored

-- How many goals did Vava score in 1962? (4)
SELECT family_name, COUNT(family_name) AS 'Goals'
FROM goals 
WHERE family_name  = 'Vavá' AND tournament_name ='1962 FIFA World Cup'
UNION 
-- How many goals did Ronaldo score in 2002? (8)
SELECT family_name, COUNT(family_name) AS 'Goals'
FROM goals 
WHERE family_name  = 'Ronaldo' AND tournament_name ='2002 FIFA World Cup'
UNION 
-- How many goals did Leonidas score in 1938? (7)
SELECT family_name, COUNT(family_name) AS 'Goals'
FROM goals 
WHERE family_name  = 'Leônidas' AND tournament_name ='1938 FIFA World Cup'
UNION 
-- How many goals did Garrincha score in 1962? (4)
SELECT family_name, COUNT(family_name) AS 'Goals'
FROM goals 
WHERE family_name  = 'Garrincha' AND tournament_name ='1962 FIFA World Cup'
UNION 
-- How many goals did Ademir score in 1950? (9)
SELECT family_name, COUNT(family_name) AS 'Goals'
FROM goals 
WHERE family_name  = 'Ademir' AND tournament_name ='1950 FIFA World Cup'


-- 6. In what Country did Ademir play when he scored 9 goals for the golden boot?
--  Brazil
SELECT team_name
FROM host_countries 
WHERE tournament_name ='1950 FIFA World Cup'


-- 7. How many countries participated in the 1950 World cup?
-- 13 countries participated

SELECT COUNT(DISTINCT(team_id)) 
FROM qualified_teams 
WHERE tournament_id  = 'WC-1950'

-- 8. What country won the 1950 world cup?
-- Uruguay
SELECT winner
FROM tournaments 
WHERE tournament_name = '1950 FIFA World Cup'

-- 9. What position did Ademir play?
-- forward 
SELECT player_id
FROM players 
WHERE family_name = 'Ademir'
 -- P-03149
SELECT position_name
FROM squads
WHERE player_id = 'P-03149'


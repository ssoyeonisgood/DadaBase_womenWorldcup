/*Part3*/


/*Designing and implementing queries*/

/*It shows which teams reached the final of each World Cup and how many goals they scored.*/
SELECT home_team, away_team, CONCAT(home_score,' VS ',away_score) AS Score, DATE_FORMAT(matchDate, '%M %e, %Y') AS Date FROM Matches WHERE round = 'Final';

/*It shows which countries scored more than 3 points in the 2011 World Cup.*/
SELECT * FROM TeamRecords WHERE goals > 3 and year = '2011';

/*It shows matches held between '2023-08-01' and '2023-08-15' in descending order of date.*/
SELECT home_team, away_team, matchDate, round FROM Matches WHERE matchDate BETWEEN '2023-08-01' and '2023-08-15' ORDER BY DATE(matchDate) DESC;

/*It shows the average number of attendances for the matches in the 2023 World Cup.*/
SELECT ROUND(AVG(attendance),2) AS average_of_attendance_in_2023 FROM Matches WHERE year = 2023;

/*It shows which England players have 'ru' in their names.*/
SELECT * FROM Player WHERE playerName LIKE '%ru%' and teamName = 'England';

/*It shows information about the matches that took place during the 1991 World Cup and the venues’ information where they were held.*/
SELECT m.round,m.matchDate,m.venueName,v.capacity,v.typeOfStadium FROM Matches AS m INNER JOIN Venue AS v ON m.year = 1991 AND m.venueNAME = v.venueName;

/*It shows the average number of goals each team scores in the World Cup. Additionally, the data is sorted in ascending order of average goals.*/
SELECT teamName, ROUND(AVG(goals),1) AS average_goals FROM TeamRecords GROUP BY teamName ORDER BY average_goals;

/*It shows the date of the match against the home team, where the home team beat the away team in the quarterfinals*/
SELECT m.home_team AS winner_home_team, m.matchDate FROM Matches m WHERE home_score > ANY (SELECT away_score FROM Matches) AND round = 'Quarter-finals';

/*It shows information about the Spanish, Brazilian and German teams and the names of their coaches.*/
SELECT t.teamName, t.ranking, c.coachName FROM Team t INNER JOIN Coach c ON t.teamName = c.teamName WHERE t.teamName IN ('Spain', 'Brazil', 'Germany');

/*For teams ranked in the top 10, a note saying 'In the top 10' will be printed along with the team name. For teams that are not in the top 10, a note will be printed saying 'Not in the top 10'. With team name.*/
(SELECT teamName, 'Ranked in top 10' as remark FROM Team WHERE ranking <= 10)  UNION  (SELECT teamName, 'Not in the top 10' AS remark FROM Team WHERE ranking > 10)  ORDER BY teamName;

/*It shows information about the final round in order of year. And if the home team wins, 'home_team win' is printed, and if the away team wins, 'away_team win!' is printed.*/
(SELECT home_team, away_team, year, 'home_team win!' AS remark  FROM Matches  WHERE round = 'Final' AND home_score > away_score) UNION  (SELECT home_team, away_team, year, 'away_team win!' AS remark
FROM Matches  WHERE round = 'Final' AND home_score < away_score) ORDER BY year;

/*It shows how many matches were held at each venue and what the max attendance was in 2015 world cup.*/
SELECT venueName, COUNT(*) AS venue_count, MAX(attendance) AS max_attendance FROM Matches WHERE year = 2015 GROUP BY venueName;


/*Part4*/


/*Stored procedure*/
SOURCE SP_numberOfParticipation.sql;

CALL numberOfParticipation('England', @result);

SELECT @result;

SOURCE SP_matchHistory.sql;

CALL matchHistory('England','Spain');

/*Trigger*/
SOURCE TG_insertVenue.sql;

INSERT INTO Venue VALUES ('Seoul Olympic Main Stadium','Korea Rep', 'Seoul', 30000,'open');

SOURCE TG_updateTeamRecords.sql

SELECT * FROM TeamRecords;

INSERT INTO Matches VALUES ('Argentina', 'Australia', 2, 4, '2019-08-01', 'Group stage', 667755, 'Accor Stadium', 2019);

SELECT * FROM TeamRecords;

SOURCE TG_deleteTeamRecords.sql;

DELETE FROM Matches WHERE home_team = 'Argentina'   AND away_team = 'Australia' AND matchDate = '2019-08-01'   AND round = 'Group stage';

SELECT * FROM TeamRecords;




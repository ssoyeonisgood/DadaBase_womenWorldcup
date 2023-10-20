/*Create data base */
CREATE DATABASE worldCup_21007781;

USE worldCup_21007781;

/*create tables*/
SOURCE createVenue.sql;

SOURCE createTeam.sql;

SOURCE createPlayer.sql;

SOURCE createWorldCup.sql;

SOURCE createMatches.sql;

SOURCE createCoach.sql;

SOURCE createTeamRecords.sql;

/*insert data*/
SOURCE insWorldCup.sql;

LOAD DATA INFILE  '/var/lib/mysql-files/venue.csv' INTO TABLE Venue FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE  '/var/lib/mysql-files/matches.csv' INTO TABLE Matches FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

SOURCE insTeam.sql;

SOURCE insPlayer.sql;

SOURCE insCoach.sql;

LOAD DATA INFILE  '/var/lib/mysql-files/teamRecords.csv' INTO TABLE TeamRecords FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/*Designing and implementing queries*/
SELECT home_team, away_team, CONCAT(home_score,' VS ',away_score) AS Score, DATE_FORMAT(matchDate, '%M %e, %Y') AS Date FROM Matches WHERE round = 'Final';

SELECT * FROM TeamRecords WHERE goals > 3 and year = '2011';

SELECT home_team, away_team, matchDate, round FROM Matches WHERE matchDate BETWEEN '2023-08-01'
 and '2023-08-15' ORDER BY DATE(matchDate) DESC;

SELECT ROUND(AVG(attendance),2) AS average_of_attendance_in_2023 FROM Matches WHERE year = 2023;

SELECT * FROM Player WHERE playerName LIKE '%ru%' and teamName = 'England';

SELECT m.round,m.matchDate,m.venueName,v.capacity,v.typeOfStadium FROM Matches AS m INNER JOIN
Venue AS v ON m.year = 1991 AND m.venueNAME = v.venueName;

SELECT teamName, ROUND(AVG(goals),1) AS average_goals FROM TeamRecords GROUP BY teamName ORDER
BY average_goals;

SELECT m.home_team AS winner_home_team, m.matchDate FROM Matches m WHERE home_score > ANY (SELE
CT away_score FROM Matches) AND round = 'Quarter-finals';

SELECT t.teamName, t.ranking, c.coachName FROM Team t INNER JOIN Coach c ON t.teamName = c.teamName WHERE t.teamName IN ('Spain', 'Brazil', 'Germany');

(SELECT teamName, 'Ranked in top 10' as remark FROM Team WHERE ranking <= 10)  UNION  (SELECT teamName, 'Not in the top 10' AS remark FROM Team WHERE ranking > 10)  ORDER BY teamName;

(SELECT home_team, away_team, year, 'home_team win!' AS remark  FROM Matches  WHERE round = 'Final' AND home_score > away_score) UNION  (SELECT home_team, away_team, year, 'away_team win!' AS remark
FROM Matches  WHERE round = 'Final' AND home_score < away_score) ORDER BY year;

SELECT venueName, COUNT(*) AS venue_count, MAX(attendance) AS max_attendance FROM Matches WHERE year = 2015 GROUP BY venueName;

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




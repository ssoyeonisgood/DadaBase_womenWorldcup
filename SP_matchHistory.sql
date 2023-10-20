/*Part4*/

/*This stored procedure shows information about matches 
between the two countries selected by the user.*/

DROP PROCEDURE IF EXISTS matchHistory;

DELIMITER //

CREATE PROCEDURE matchHistory(
    country1 VARCHAR(30),
    country2 VARCHAR(30)
)
	COMMENT 'Show details of all matches between two countries'
	BEGIN
		SELECT * FROM Matches 
		WHERE (home_team = country1 AND away_team = country2)
    		OR (home_team = country2 AND away_team = country1);
	END//

DELIMITER ;


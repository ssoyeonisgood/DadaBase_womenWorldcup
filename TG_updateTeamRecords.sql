/*Part4*/
/*This trigger automatically updates TeamRecords for the participating countries when a new match is added*/

DROP TRIGGER IF EXISTS updateTeamRecords;
DELIMITER //
CREATE TRIGGER updateTeamRecords
AFTER INSERT ON Matches
FOR EACH ROW
BEGIN
    IF NEW.home_score IS NOT NULL THEN
        SET @goals1 = NEW.home_score;
        SET @year1 = NEW.year;
      
	UPDATE TeamRecords
        SET goals = goals + @goals1, matchesPlayed = matchesPlayed + 1
        WHERE teamName = NEW.home_team AND year = @year1;
    END IF;

    IF NEW.away_score IS NOT NULL THEN
        SET @goals2 = NEW.away_score;
        SET @year2 = NEW.year;
        
        UPDATE TeamRecords
        SET goals = goals + @goals2, matchesPlayed = matchesPlayed + 1
        WHERE teamName = NEW.away_team AND year = @year2;
    END IF;
END//
DELIMITER ;


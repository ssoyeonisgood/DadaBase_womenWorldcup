/*Part4*/

/*This trigger modifies the TeamRecords of the countries participating in the match after the existing match is deleted.*/

DROP TRIGGER IF EXISTS deleteTeamRecords;
DELIMITER //
CREATE TRIGGER deleteTeamRecords
AFTER DELETE ON Matches
FOR EACH ROW
        BEGIN
                IF OLD.home_score IS NOT NULL THEN
                        SET @goals1 = OLD.home_score;
                        SET @year1 = OLD.year;
                        UPDATE TeamRecords
                        SET goals = goals - @goals1, matchesPlayed = matchesPlayed - 1
                        WHERE teamName = OLD.home_team AND year = @year1;
                    END IF;

                IF OLD.away_score IS NOT NULL THEN
                        SET @goals2 = OLD.away_score;
                        SET @year2 = OLD.year;
                        SET @oldGoals2 = 0;
                        UPDATE TeamRecords
                        SET goals = goals - @goals2, matchesPlayed = matchesPlayed - 1
                        WHERE teamName = old.away_team AND year = @year2;
                    END IF;
        END//
DELIMITER ;

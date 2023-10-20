/*Part4*/
/*This stored procedure shows how many times the entered country has participated in the World Cup between 1991 and 2019.*/
DROP PROCEDURE numberOfParticipation;
CREATE PROCEDURE numberOfParticipation(
	IN country VARCHAR(30),
	OUT result INT
)
	COMMENT 'It shows how many times the entered country has participated in the World Cup
	         between 1991 and 2019'

	SELECT COUNT(*)  FROM TeamRecords WHERE teamName = country INTO result;
	


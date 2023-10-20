/*Part2-a*/

/*Information on teams that participated in the Women’s World Cup*/
DROP TABLE IF EXISTS Team;
CREATE TABLE Team (
    teamName     VARCHAR(30)   NOT NULL,
    ranking      int           ,
    PRIMARY KEY(teamName)
);

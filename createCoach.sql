/*Coach information for teams participating in the 2023 Women’s World Cup*/
DROP TABLE IF EXISTS Coach;
CREATE TABLE Coach (
	coachName   VARCHAR(36)         NOT NULL,
        nationality VARCHAR(30)         NOT NULL,
        teamName    VARCHAR(30)         NOT NULL,
        PRIMARY KEY(coachName, teamName),
        FOREIGN KEY(teamName) REFERENCES Team(teamName)
);

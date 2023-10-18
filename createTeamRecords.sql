/*Records of countries participating form 1991 Women's World Cup to 2019 Women's World Cup*/
DROP TABLE IF EXISTS TeamRecords;
CREATE TABLE TeamRecords (
        teamName      VARCHAR(30)   NOT NULL,
	year          INT           NOT NULL,
	matchesPlayed INT           NOT NULL,
	goals         INT           NOT NULL,
        PRIMARY KEY(teamName, year),
        FOREIGN KEY(teamName) REFERENCES Team(teamName),
	FOREIGN KEY(year) REFERENCES WorldCup(year)
);

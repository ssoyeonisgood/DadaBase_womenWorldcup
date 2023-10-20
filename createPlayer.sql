/*Part2-a*/

/*Information on players who participated in the 2023 Women World Cup*/
DROP TABLE IF EXISTS Player;
CREATE TABLE Player (
	playerNumber   INT             NOT NULL,
	playerName     VARCHAR(30)     NOT NULL,
	teamName       VARCHAR(30)     NOT NULL,
	PRIMARY KEY(playerNumber, teamName),
	FOREIGN KEY(teamName) REFERENCES Team(teamName)
);

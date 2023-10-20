/*Part2-a*/

/* Information on all matches at the Women's World Cup */
DROP TABLE IF EXISTS Matches;
CREATE TABLE Matches (
    home_team   VARCHAR(30) NOT NULL,
    away_team   VARCHAR(30) NOT NULL,
    home_score  INT NOT NULL,
    away_score  INT NOT NULL,
    matchDate   DATE NOT NULL,
    round       VARCHAR(20),
    attendance  INT,
    venueName   VARCHAR(40) NOT NULL,
    year        INT NOT NULL,
    PRIMARY KEY (home_team, away_team, matchDate),
    FOREIGN KEY (venueName) REFERENCES Venue(venueName), 
    FOREIGN KEY (year) REFERENCES WorldCup(year)
);



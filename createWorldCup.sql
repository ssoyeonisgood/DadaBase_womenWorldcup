/*Part2-a*/

/*Information on all Women's World Cups held so far*/
DROP TABLE IF EXISTS WorldCup;
CREATE TABLE WorldCup (
    year           INT        NOT NULL,
    startDate      DATE        NOT NULL,
    endDate        DATE        NOT NULL,
    host           VARCHAR(30) NOT NULL,
    totalMatches   int         ,
    teams          int         ,
    PRIMARY KEY(year)
);

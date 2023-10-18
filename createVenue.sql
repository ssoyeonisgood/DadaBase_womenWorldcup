/*Information on venues where the match was held*/
DROP TABLE IF EXISTS Venue;
CREATE TABLE Venue (
    venueName     VARCHAR(40)     NOT NULL,
    country       VARCHAR(30)     NOT NULL,
    city          VARCHAR(20)     NOT NULL,
    capacity      int             NOT NULL,
    typeOfStadium VARCHAR(20)  NOT NULL,
    PRIMARY KEY(venueName)
);

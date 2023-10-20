/*insert data*/
SOURCE insWorldCup.sql;

LOAD DATA INFILE  '/var/lib/mysql-files/venue.csv' INTO TABLE Venue FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE  '/var/lib/mysql-files/matches.csv' INTO TABLE Matches FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

SOURCE insTeam.sql;

SOURCE insPlayer.sql;

SOURCE insCoach.sql;

LOAD DATA INFILE  '/var/lib/mysql-files/teamRecords.csv' INTO TABLE TeamRecords FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

import mysql.connector

conn = mysql.connector.connect(
    user="soyeon",
    password="Thdus@0223",
    host='127.0.0.1',
    database="worldCup_21007781"
)

cursor = conn.cursor()

select_stmt = "SELECT home_team, home_score, away_team, away_score, matchDate FROM Matches WHERE round = 'Final'"
cursor.execute(select_stmt)

for (home_team, home_score, away_team, away_score, matchDate) in cursor:
    print("{} scored {} goals and {} scored {} goals and the match was played on {:%d %b %Y}.\n".format(
        home_team, home_score, away_team, away_score, matchDate))

cursor.close()
conn.close()

import mysql.connector

conn = mysql.connector.connect(
    user="soyeon",
    password="Thdus@0223",
    host='127.0.0.1',
    database="worldCup_21007781"
)

cursor = conn.cursor()

insert_stmt = (
    "INSERT INTO Coach (coachName, nationality, teamName) VALUES (%s, %s, %s)")
data1 = ("Lars Søndergaard", "Denmark", "Denmark")


cursor.execute(insert_stmt, data1)


conn.commit()

select_stmt = "SELECT * FROM Coach"
cursor.execute(select_stmt)

result = cursor.fetchall()
for row in result:
    print(row)

cursor.close()
conn.close()
